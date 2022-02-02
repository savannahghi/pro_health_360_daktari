// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:app_wrapper/app_wrapper.dart' show AppContext, BaseContext;
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

// Project imports:
import 'package:healthcloud/application/core/services/app_setup_data.dart';
import 'package:healthcloud/application/core/services/onboarding.dart';
import 'package:healthcloud/application/redux/actions/core/auth_status_action.dart';
import 'package:healthcloud/application/redux/actions/core/bottom_nav_action.dart';
import 'package:healthcloud/application/redux/actions/user_state_actions/refresh_token_action.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/domain/core/value_objects/app_contexts.dart';
import 'package:healthcloud/domain/core/value_objects/app_enums.dart';
import 'package:healthcloud/infrastructure/endpoints.dart';
import 'package:healthcloud/presentation/router/routes.dart';

/// This show only exposed the AppContext and BaseContext to prevent conflicts
/// between the endpoint constants in the library, and the local ones

/// Returns the correct [AppSetupData] based on the [AppContext]
///
/// Example AppContext are:
/// - AppTest,
/// - AppDemo,
/// - AppProd,
/// - AppE2E,
AppSetupData getAppSetupData(AppContext context) {
  switch (context) {
    case AppContext.AppTest:
      return devAppSetupData;
    case AppContext.AppDemo:
      return demoAppSetupData;
    case AppContext.AppProd:
      return prodAppSetupData;
    case AppContext.AppE2E:
      return devAppSetupData;
    default:
      return devAppSetupData;
  }
}

final AppSetupData devAppSetupData = AppSetupData(
  appContexts: testAppContexts,
  sentryDNS: FlutterConfig.get('DEV_SENTRY_DNS') as String,
  customContext: const BaseContext(
    anonymousLoginEndpoint: kTestAnonymousLoginEndpoint,
    graphqlEndpoint: kTestGraphqlEndpoint,
    setPrimaryPhoneNumberEndpoint: kTestSetPrimaryPhoneNumberEndpoint,
    refreshTokenEndpoint: kTestRefreshTokenEndpoint,
    retryResendOtpEndpoint: kTestRetryResendOtpEndpoint,
    pinResetEndpoint: kTestPinResetEndpoint,
    userRecoveryPhoneNumbersEndpoint: kTestUserRecoveryPhoneNumbersEndpoint,
    verifyContactOTPEndpoint: kTestVerifyContactOTPEndpoint,
    verifyPhoneEndpoint: kTestVerifyPhoneEndpoint,
    sendContactVerificationOTPEndpoint: kTestSendContactVerificationOTPEndpoint,
    sendRecoverAccountOtpEndpoint: kTestSendRecoverAccountOtpEndpoint,
    loginByPhoneEndpoint: kTestLoginByPhoneEndpoint,
    updateUserPinEndpoint: kTestUpdateUserPinEndpoint,
    uploadFileEndPoint: kTestUploadFileEndPoint,
    createUserByPhoneEndpoint: kTestCreateUserByPhoneEndpoint,
    switchFlaggedFeaturesEndpoint: '',
    requestPinResetEndpoint: '',
    respondedSecurityQuestionsEndpoint: '',
    verifySecurityQuestionsEndpoint: '',
  ),
);

final AppSetupData demoAppSetupData = AppSetupData(
  appContexts: demoAppContexts,
  sentryDNS: FlutterConfig.get('DEV_SENTRY_DNS') as String,
  customContext: const BaseContext(
    anonymousLoginEndpoint: kDemoAnonymousLoginEndpoint,
    graphqlEndpoint: kDemoGraphqlEndpoint,
    setPrimaryPhoneNumberEndpoint: kDemoSetPrimaryPhoneNumberEndpoint,
    refreshTokenEndpoint: kDemoRefreshTokenEndpoint,
    retryResendOtpEndpoint: kDemoRetryResendOtpEndpoint,
    pinResetEndpoint: kDemoPinResetEndpoint,
    userRecoveryPhoneNumbersEndpoint: kDemoUserRecoveryPhoneNumbersEndpoint,
    verifyContactOTPEndpoint: kDemoVerifyContactOTPEndpoint,
    verifyPhoneEndpoint: kDemoVerifyPhoneEndpoint,
    sendContactVerificationOTPEndpoint: kDemoSendContactVerificationOTPEndpoint,
    sendRecoverAccountOtpEndpoint: kDemoSendRecoverAccountOtpEndpoint,
    loginByPhoneEndpoint: kDemoLoginByPhoneEndpoint,
    updateUserPinEndpoint: kDemoUpdateUserPinEndpoint,
    uploadFileEndPoint: kDemoUploadFileEndPoint,
    createUserByPhoneEndpoint: kDemoCreateUserByPhoneEndpoint,
    switchFlaggedFeaturesEndpoint: '',
    requestPinResetEndpoint: '',
    respondedSecurityQuestionsEndpoint: '',
    verifySecurityQuestionsEndpoint: '',
  ),
);

final AppSetupData prodAppSetupData = AppSetupData(
  appContexts: prodAppContexts,
  sentryDNS: FlutterConfig.get('PROD_SENTRY_DNS') as String,
  customContext: const BaseContext(
    anonymousLoginEndpoint: kProdAnonymousLoginEndpoint,
    graphqlEndpoint: kProdGraphqlEndpoint,
    setPrimaryPhoneNumberEndpoint: kProdSetPrimaryPhoneNumberEndpoint,
    refreshTokenEndpoint: kProdRefreshTokenEndpoint,
    retryResendOtpEndpoint: kProdRetryResendOtpEndpoint,
    pinResetEndpoint: kProdPinResetEndpoint,
    userRecoveryPhoneNumbersEndpoint: kProdUserRecoveryPhoneNumbersEndpoint,
    verifyContactOTPEndpoint: kProdVerifyContactOTPEndpoint,
    verifyPhoneEndpoint: kProdVerifyPhoneEndpoint,
    sendContactVerificationOTPEndpoint: kProdSendContactVerificationOTPEndpoint,
    sendRecoverAccountOtpEndpoint: kProdSendRecoverAccountOtpEndpoint,
    loginByPhoneEndpoint: kProdLoginByPhoneEndpoint,
    updateUserPinEndpoint: kProdUpdateUserPinEndpoint,
    uploadFileEndPoint: kProdUploadFileEndPoint,
    createUserByPhoneEndpoint: kProdCreateUserByPhoneEndpoint,
    switchFlaggedFeaturesEndpoint: '',
    requestPinResetEndpoint: '',
    respondedSecurityQuestionsEndpoint: '',
    verifySecurityQuestionsEndpoint: '',
  ),
);

/// Triggers Navigation event by sending a log to firebase
///
/// @params
/// - String `route` (determines the route to push to after sending log)
/// - bool `shouldReplace` (is used as a flag for navigation events that replace previous routes)
/// - BuildContext `context`
Future<void> triggerNavigationEvent({
  required BuildContext context,
  required String route,
  String? event,
  bool shouldReplace = false,
  Object? args,
  bool shouldRemoveUntil = false,
}) async {
  /// Navigation Function
  if (shouldReplace) {
    await Navigator.of(context).pushReplacementNamed(route, arguments: args);
  } else if (shouldRemoveUntil) {
    await Navigator.of(context).pushNamedAndRemoveUntil(
      route,
      ModalRoute.withName(route),
      arguments: args,
    );
  } else {
    await Navigator.of(context).pushNamed(route, arguments: args);
  }
}

/// Used to capture User Exceptions and logged to AfyaMoja Sentry
///
/// These include exceptions like: `'Error while fetching user feed'`
/// Check `exception_strings.dart` for more examples of these exceptions.
///
/// @params
/// - message: Reported as issue title
/// - query and variables: The query/mutation with variables that resulted into the exception
/// - response: Response received
/// - error: exception string
Future<void> captureException(
  String? message, {
  String? query,
  Map<String, dynamic>? variables,
  dynamic response,
  dynamic error,
}) async {
  final Map<String, dynamic> stackTrace = <String, dynamic>{
    'query': query,
    'variables': variables,
    'response': response,
    'error': error
  };

  /// Adds the stackTrace as a breadcrumb
  Sentry.addBreadcrumb(
    Breadcrumb(
      message: 'Stacktrace for: $message',
      data: stackTrace,
      timestamp: DateTime.now(),
    ),
  );
  await Sentry.captureException(UserException(message));
}

/// Gets initial route based on the authToken status
Future<String> getInitialRoute({required BuildContext context}) async {
  final AppState state = StoreProvider.state<AppState>(context)!;

  // This will always be false
  final bool signedIn = state.credentials?.isSignedIn ?? false;

  await StoreProvider.dispatch<AppState>(
    context,
    AuthStatusAction(
      expiresIn: DateTime.now().toIso8601String(),
    ),
  );

  if (signedIn == true) {
    /// Check inactivity time
    final AuthTokenStatus tokenStatus = await getAuthTokenStatus(
      context: context,
    );

    switch (tokenStatus) {
      case AuthTokenStatus.requiresLogin:
        return AppRoutes.loginPage;
      case AuthTokenStatus.requiresPin:
        return AppRoutes.verifyOTPPage;
      default: // Happy case => Get the onboarding path and
    }

    if (onboardingPath(state: state).route == AppRoutes.homePage) {
      StoreProvider.dispatch<AppState>(
        context,
        BottomNavAction(currentBottomNavIndex: 0),
      );
    }

    return onboardingPath(state: state).route;
  }

  return AppRoutes.loginPage;
}

/// [getAuthTokenStatus] is used to check if the Auth Token has expired or if it needs refreshing
///
/// The reason the http and graphQL client are not passed in is because by the
/// time this function is being called they will have already been initialized
Future<AuthTokenStatus> getAuthTokenStatus({
  required BuildContext context,
}) async {
  final AppState? state = StoreProvider.state<AppState>(context);

  /// Checks if user is signed in
  final bool isSignedIn = state!.credentials!.isSignedIn!;

  if (isSignedIn) {
    /// Token Expiry time
    final String tokenExpiryFromState =
        state.credentials!.tokenExpiryTimestamp!;

    if (tokenExpiryFromState != UNKNOWN) {
      /// subtract the current time from the time the user signed in
      /// first check if token has expired
      final Duration difference =
          DateTime.parse(tokenExpiryFromState).difference(DateTime.now());

      final int differenceInMinutes = difference.inMinutes;
      final int differenceInHours = difference.inHours;

      /// If the difference is more than 10 do nothing everything is ok
      if (differenceInMinutes >= 10) {
        return AuthTokenStatus.okay;
      }

      /// Refresh the token because it is about to expire or it has expired.
      /// No PIN verification is required
      else if (differenceInMinutes > 0 && differenceInMinutes <= 9) {
        StoreProvider.dispatch<AppState>(
          context,
          RefreshTokenAction(context: context),
        );
        return AuthTokenStatus.okay;
      }

      /// Refresh the token and require PIN verification
      else if (differenceInHours > -12) {
        StoreProvider.dispatch<AppState>(
          context,
          RefreshTokenAction(context: context),
        );

        return AuthTokenStatus.requiresPin;
      }
      return AuthTokenStatus.requiresLogin;
    } else {
      return AuthTokenStatus.requiresLogin;
    }
  } else {
    return AuthTokenStatus.requiresLogin;
  }
}

/// Decides whether to show the debug mode banner based on the environment
/// that the app is running.
///
/// The banner is only shown when the app is running in test mode
bool showDebugModeBanner(List<AppContext> appContexts) =>
    appContexts.contains(AppContext.AppTest);
