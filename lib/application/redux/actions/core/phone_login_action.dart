// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart';
import 'package:prohealth360_daktari/application/core/services/analytics_service.dart';
// Project imports:
import 'package:prohealth360_daktari/application/core/services/helpers.dart';
import 'package:prohealth360_daktari/application/core/services/utils.dart';
import 'package:prohealth360_daktari/application/redux/actions/core/update_credentials_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/core/update_staff_profile_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/core/update_user_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/actions/onboarding/update_onboarding_state_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/states/onboarding/onboarding_state.dart';
import 'package:prohealth360_daktari/domain/core/entities/core/auth_credentials.dart';
import 'package:prohealth360_daktari/domain/core/entities/core/onboarding_path_info.dart';
import 'package:prohealth360_daktari/domain/core/entities/core/user.dart';
import 'package:prohealth360_daktari/domain/core/entities/login/phone_login_response.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_enums.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_events.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/presentation/router/routes.dart';

/// [PhoneLoginAction] called when the user try to login using their primary phone
class PhoneLoginAction extends ReduxAction<AppState> {
  PhoneLoginAction({
    required this.httpClient,
    required this.phoneLoginEndpoint,
  });

  final IGraphQlClient httpClient;
  final String phoneLoginEndpoint;

  @override
  Future<void> after() async {
    dispatch(WaitAction<AppState>.remove(phoneLoginStateFlag));
    super.after();
  }

  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(phoneLoginStateFlag));
    dispatch(
      UpdateOnboardingStateAction(
        currentOnboardingStage: CurrentOnboardingStage.Login,
      ),
    );
  }

  @override
  Future<AppState?> reduce() async {
    final OnboardingState? onboardingState = state.onboardingState;

    final Map<String, String> credentials = <String, String>{
      'phoneNumber': onboardingState!.phoneNumber!,
      'pin': onboardingState.pin!,
      'flavour': Flavour.pro.name,
    };

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
          hasSetNickName:
              user?.username != null && user?.username != user!.name,
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
          defaultFacilityName:
              loginResponse.userResponse?.staffState?.defaultFacilityName,
        ),
      );

      /// This addresses cases where a user's PIN has been reset by an admin
      /// and it needs to be changed before accessing the platform
      ///
      /// Note: For this to work, the backend should trigger these properties
      /// in the user profile (isPhoneVerified, hasSetPin, hasSetSecurityQuestions)
      if (user?.pinUpdateRequired ?? false) {
        dispatch(
          UpdateOnboardingStateAction(
            currentOnboardingStage: CurrentOnboardingStage.PINUpdate,
            isPhoneVerified: false,
            hasSetPin: false,
            hasSetSecurityQuestions: false,
          ),
        );
      }

      final OnboardingPathInfo path = getOnboardingPath(state: state);

      dispatch(
        NavigateAction<AppState>.pushNamedAndRemoveAll(
          path.nextRoute,
          arguments: path.arguments,
        ),
      );
      await AnalyticsService().logEvent(
        name: loginEvent,
        eventType: AnalyticsEventType.AUTH,
      );

      return state;
    } else {
      final Map<String, dynamic> parsed =
          jsonDecode(httpResponse.body) as Map<String, dynamic>;

      switch (processedResponse.code) {
        case 7:
          final OnboardingState? onboardingState = state.onboardingState;

          await captureException(
            errorNoUserFound,
            error: processedResponse.message,
            response: processedResponse.response.body,
          );

          await AnalyticsService().logEvent(
            name: noUserFoundEvent,
            eventType: AnalyticsEventType.AUTH,
            parameters: <String, dynamic>{
              'phoneNumber': onboardingState?.phoneNumber ?? UNKNOWN,
            },
          );

          throw const UserException(noUserFound);

        case 8:
          dispatch(UpdateOnboardingStateAction(invalidCredentials: true));
          await captureException(
            errorPhoneLogin,
            error: processedResponse.message,
            response: processedResponse.response.body,
          );
          await AnalyticsService().logEvent(
            name: incorrectCredentialsLoginEvent,
            eventType: AnalyticsEventType.AUTH,
          );
          return null;
        case 48:
          dispatch(
            NavigateAction<AppState>.pushNamedAndRemoveUntil(
              AppRoutes.pinExpiredPage,
              (Route<dynamic> route) => false,
            ),
          );
          await AnalyticsService().logEvent(
            name: pinExpiredEvent,
            eventType: AnalyticsEventType.AUTH,
          );

          return state;
        case 72:
          dispatch(
            NavigateAction<AppState>.pushNamedAndRemoveUntil(
              AppRoutes.pendingPINRequestPage,
              (Route<dynamic> route) => false,
            ),
          );
          await AnalyticsService().logEvent(
            name: pendingPinResetServiceRequest,
            eventType: AnalyticsEventType.AUTH,
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
          await AnalyticsService().logEvent(
            name: exponentialBackOffEvent,
            eventType: AnalyticsEventType.AUTH,
            parameters: <String, dynamic>{'retryTime': retryTime?.ceil()},
          );
          return state;

        default:
          await captureException(
            errorPhoneLogin,
            error: processedResponse.message,
            response: processedResponse.response.body,
          );
          // exception thrown if the backend could not match the provided
          //credentials with those stored in the backend
          await AnalyticsService().logEvent(
            name: unknownAuthErrorEvent,
            eventType: AnalyticsEventType.AUTH,
          );
          throw const UserException(somethingWentWrongText);
      }
    }
  }
}
