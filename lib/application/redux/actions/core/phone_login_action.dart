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
// Project imports:
import 'package:myharehubpro/application/core/services/helpers.dart';
import 'package:myharehubpro/application/core/services/utils.dart';
import 'package:myharehubpro/application/redux/actions/core/update_credentials_action.dart';
import 'package:myharehubpro/application/redux/actions/core/update_staff_profile_action.dart';
import 'package:myharehubpro/application/redux/actions/core/update_user_action.dart';
import 'package:myharehubpro/application/redux/actions/flags/app_flags.dart';
import 'package:myharehubpro/application/redux/actions/onboarding/update_onboarding_state_action.dart';
import 'package:myharehubpro/application/redux/states/app_state.dart';
import 'package:myharehubpro/application/redux/states/onboarding/onboarding_state.dart';
import 'package:myharehubpro/domain/core/entities/core/auth_credentials.dart';
import 'package:myharehubpro/domain/core/entities/core/user.dart';
import 'package:myharehubpro/domain/core/entities/login/phone_login_response.dart';
import 'package:myharehubpro/domain/core/value_objects/app_strings.dart';
import 'package:http/http.dart';

/// [PhoneLoginAction] called when the user try to login using their primary phone
class PhoneLoginAction extends ReduxAction<AppState> {
  PhoneLoginAction({required this.context});

  final BuildContext context;

  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(phoneLoginStateFlag));
  }

  @override
  Future<void> after() async {
    dispatch(WaitAction<AppState>.remove(phoneLoginStateFlag));
    super.after();
  }

  @override
  Future<AppState?> reduce() async {
    final IGraphQlClient httpClient = AppWrapperBase.of(context)!.graphQLClient;

    final OnboardingState? onboardingState = state.onboardingState;

    final Map<String, String> credentials = <String, String>{
      'phoneNumber': onboardingState!.phoneLogin!.phoneNumber!,
      'pin': onboardingState.phoneLogin!.pinCode!,
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
      AuthCredentials? authCredentials = loginResponse.credentials?.copyWith(
        signedInTime: now.toIso8601String(),
        isSignedIn: true,
      );

      final String? expiresIn = loginResponse.credentials?.expiresIn;
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
      final String fullName = loginResponse.staffState?.user?.name ?? UNKNOWN;

      User? user = loginResponse.staffState?.user?.copyWith(
        pinChangeRequired: false,
        chatRoomToken: loginResponse.streamToken,
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
          termsAccepted: user?.termsAccepted,
          hasSetSecurityQuestions: user?.hasSetSecurityQuestions,
          hasSetPin: user?.hasSetPin,
          isPhoneVerified: user?.isPhoneVerified,
        ),
      );

      dispatch(UpdateUserAction(user: user));

      dispatch(
        UpdateStaffProfileAction(
          id: loginResponse.staffState?.id,
          staffNumber: loginResponse.staffState?.staffNumber,
          defaultFacility: loginResponse.staffState?.defaultFacility,
          facilities: loginResponse.staffState?.facilities,
        ),
      );

      final OnboardingPathConfig path = getOnboardingPath(state: state);

      dispatch(
        NavigateAction<AppState>.pushNamedAndRemoveAll(
          path.route,
          arguments: path.arguments,
        ),
      );

      return state;
    } else {
      if (processedResponse.message == wrongLoginCredentials) {
        dispatch(UpdateOnboardingStateAction(invalidCredentials: true));
      }

      await captureException(
        errorPhoneLogin,
        error: processedResponse.message,
        response: processedResponse.response.body,
      );
      throw const UserException(wrongCredentials);
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
