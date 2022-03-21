// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart';
// Project imports:
import 'package:mycarehubpro/application/core/services/helpers.dart';
import 'package:mycarehubpro/application/core/services/utils.dart';
import 'package:mycarehubpro/application/redux/actions/core/update_credentials_action.dart';
import 'package:mycarehubpro/application/redux/actions/core/update_staff_profile_action.dart';
import 'package:mycarehubpro/application/redux/actions/core/update_user_action.dart';
import 'package:mycarehubpro/application/redux/actions/flags/app_flags.dart';
import 'package:mycarehubpro/application/redux/actions/onboarding/update_onboarding_state_action.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/application/redux/states/onboarding/onboarding_state.dart';
import 'package:mycarehubpro/domain/core/entities/core/auth_credentials.dart';
import 'package:mycarehubpro/domain/core/entities/core/onboarding_path_info.dart';
import 'package:mycarehubpro/domain/core/entities/core/user.dart';
import 'package:mycarehubpro/domain/core/entities/login/phone_login_response.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';
import 'package:mycarehubpro/presentation/router/routes.dart';

/// [PhoneLoginAction] called when the user try to login using their primary phone
class PhoneLoginAction extends ReduxAction<AppState> {
  PhoneLoginAction({required this.context});

  final BuildContext context;

  @override
  Future<void> after() async {
    dispatch(WaitAction<AppState>.remove(phoneLoginStateFlag));
    super.after();
  }

  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(phoneLoginStateFlag));
  }

  @override
  Future<AppState?> reduce() async {
    final IGraphQlClient httpClient = AppWrapperBase.of(context)!.graphQLClient;

    final OnboardingState? onboardingState = state.onboardingState;

    final Map<String, String> credentials = <String, String>{
      'phoneNumber': onboardingState!.phoneNumber!,
      'pin': onboardingState.pin!,
      'flavour': Flavour.pro.name,
    };

    final String phoneLoginEndpoint =
        AppWrapperBase.of(context)!.customContext!.loginByPhoneEndpoint;

    final Response httpResponse = await httpClient.callRESTAPI(
      endpoint: phoneLoginEndpoint,
      method: httpPOST,
      variables: credentials,
    );

    final ProcessedResponse processedResponse =
        processHttpResponse(httpResponse);

    if (processedResponse.ok) {
      final Map<String, dynamic> responseMap =
          json.decode(processedResponse.response.body) as Map<String, dynamic>;

      final PhoneLoginResponse loginResponse =
          PhoneLoginResponse.fromJson(responseMap);

      final DateTime now = DateTime.now();
      AuthCredentials? authCredentials =
          loginResponse.userResponse?.credentials?.copyWith(
        signedInTime: now.toIso8601String(),
        isSignedIn: true,
      );

      final String? expiresIn =
          loginResponse.userResponse?.credentials?.expiresIn;
      if (expiresIn != null && expiresIn.isNotEmpty && isNumeric(expiresIn)) {
        final DateTime tokenExpiryTimestamp =
            now.add(Duration(seconds: int.tryParse(expiresIn) ?? 0));

        authCredentials = authCredentials?.copyWith(
          tokenExpiryTimestamp: tokenExpiryTimestamp.toIso8601String(),
        );
      }

      dispatch(
        UpdateCredentialsAction(
          idToken: authCredentials?.idToken,
          refreshToken: authCredentials?.refreshToken,
          expiresIn: authCredentials?.expiresIn,
          isSignedIn: true,
          signedInTime: authCredentials?.signedInTime,
          tokenExpiryTimestamp: authCredentials?.tokenExpiryTimestamp,
        ),
      );
      final String fullName =
          loginResponse.userResponse?.staffState?.user?.name ?? UNKNOWN;

      User? user = loginResponse.userResponse?.staffState?.user?.copyWith(
        pinChangeRequired: false,
        chatRoomToken: loginResponse.userResponse?.streamToken,
      );

      if (fullName != UNKNOWN && fullName.isNotEmpty) {
        final List<String> names = fullName.split(' ');
        user = user?.copyWith(
          firstName: names.first,
          lastName: names.last,
        );
      }

      dispatch(
        UpdateOnboardingStateAction(
          hasSetNickName: user?.username != null,
          hasAcceptedTerms: user?.termsAccepted,
          hasSetSecurityQuestions: user?.hasSetSecurityQuestions,
          hasSetPin: user?.hasSetPin,
          isPhoneVerified: user?.isPhoneVerified,
        ),
      );

      dispatch(UpdateUserAction(user: user));

      dispatch(
        UpdateStaffProfileAction(
          id: loginResponse.userResponse?.staffState?.id,
          staffNumber: loginResponse.userResponse?.staffState?.staffNumber,
          defaultFacility:
              loginResponse.userResponse?.staffState?.defaultFacility,
          facilities: loginResponse.userResponse?.staffState?.facilities,
        ),
      );

      final OnboardingPathInfo path = getOnboardingPath(state: state);

      dispatch(
        NavigateAction<AppState>.pushNamedAndRemoveAll(
          path.nextRoute,
          arguments: path.arguments,
        ),
      );

      return state;
    } else {
      final Map<String, dynamic> parsed =
          jsonDecode(httpResponse.body) as Map<String, dynamic>;

      switch (processedResponse.code) {
        case 8:
          dispatch(UpdateOnboardingStateAction(invalidCredentials: true));
          throw const UserException(wrongCredentials);
        case 48:
          dispatch(
            NavigateAction<AppState>.pushNamedAndRemoveUntil(
              AppRoutes.pinExpiredPage,
              (Route<dynamic> route) => false,
            ),
          );
          return state;
        case 72:
          dispatch(
            NavigateAction<AppState>.pushNamedAndRemoveUntil(
              AppRoutes.pendingPINRequestPage,
              (Route<dynamic> route) => false,
            ),
          );
          return state;
        case 73:
          final double? retryTime =
              double.tryParse(parsed['retryTime'].toString());

          dispatch(
            NavigateAction<AppState>.pushNamedAndRemoveUntil(
              AppRoutes.loginCounterPage,
              (Route<dynamic> route) => false,
              arguments: retryTime?.ceil(),
            ),
          );

          return state;

        default:
          await captureException(
            errorPhoneLogin,
            error: processedResponse.message,
            response: processedResponse.response.body,
          );
          throw const UserException(somethingWentWrongText);
      }
    }
  }

  @override
  Object? wrapError(dynamic error) {
    if (error.runtimeType == UserException) {
      ScaffoldMessenger.of(context)
          .showSnackBar(snackbar(content: (error as UserException).msg));

      return null;
    }

    return error;
  }
}
