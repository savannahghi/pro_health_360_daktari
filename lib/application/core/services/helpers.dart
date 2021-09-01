import 'package:app_wrapper/app_wrapper.dart';
import 'package:healthcloud/application/core/services/app_setup_data.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:domain_objects/entities.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:healthcloud/infrastructure/endpoints.dart';
import 'package:healthcloud/domain/core/value_objects/app_contexts.dart';

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
      return AppSetupData(
        appContexts: testAppContexts,
        sentryDNS: FlutterConfig.get('DEV_SENTRY_DNS') as String,
        customContext: const BaseContext(
          anonymousLoginEndpoint: testAnonymousLoginEndpoint,
          graphqlEndpoint: testGraphqlEndpoint,
          setPrimaryPhoneNumberEndpoint: testSetPrimaryPhoneNumberEndpoint,
          refreshTokenEndpoint: testRefreshTokenEndpoint,
          retryResendOtpEndpoint: testRetryResendOtpEndpoint,
          pinResetEndpoint: testPinResetEndpoint,
          userRecoveryPhoneNumbersEndpoint:
              testUserRecoveryPhoneNumbersEndpoint,
          verifyContactOTPEndpoint: testVerifyContactOTPEndpoint,
          verifyPhoneEndpoint: testVerifyPhoneEndpoint,
          sendContactVerificationOTPEndpoint:
              testSendContactVerificationOTPEndpoint,
          sendRecoverAccountOtpEndpoint: testSendRecoverAccountOtpEndpoint,
          loginByPhoneEndpoint: testLoginByPhoneEndpoint,
          updateUserPinEndpoint: testUpdateUserPinEndpoint,
          uploadFileEndPoint: testUploadFileEndPoint,
          createUserByPhoneEndpoint: testCreateUserByPhoneEndpoint,
        ),
      );
    case AppContext.AppDemo:
      return AppSetupData(
        appContexts: demoAppContexts,
        sentryDNS: FlutterConfig.get('PROD_SENTRY_DNS') as String,
        customContext: const BaseContext(
          anonymousLoginEndpoint: testAnonymousLoginEndpoint,
          graphqlEndpoint: testGraphqlEndpoint,
          setPrimaryPhoneNumberEndpoint: testSetPrimaryPhoneNumberEndpoint,
          refreshTokenEndpoint: testRefreshTokenEndpoint,
          retryResendOtpEndpoint: testRetryResendOtpEndpoint,
          pinResetEndpoint: testPinResetEndpoint,
          userRecoveryPhoneNumbersEndpoint:
              testUserRecoveryPhoneNumbersEndpoint,
          verifyContactOTPEndpoint: testVerifyContactOTPEndpoint,
          verifyPhoneEndpoint: testVerifyPhoneEndpoint,
          sendContactVerificationOTPEndpoint:
              testSendContactVerificationOTPEndpoint,
          sendRecoverAccountOtpEndpoint: testSendRecoverAccountOtpEndpoint,
          loginByPhoneEndpoint: testLoginByPhoneEndpoint,
          updateUserPinEndpoint: testUpdateUserPinEndpoint,
          uploadFileEndPoint: testUploadFileEndPoint,
          createUserByPhoneEndpoint: testCreateUserByPhoneEndpoint,
        ),
      );
    case AppContext.AppProd:
      return AppSetupData(
        appContexts: prodAppContexts,
        sentryDNS: FlutterConfig.get('PROD_SENTRY_DNS') as String,
      );
    case AppContext.AppE2E:
      return AppSetupData(
        appContexts: e2eAppContexts,
        sentryDNS: FlutterConfig.get('DEV_SENTRY_DNS') as String,
        customContext: const BaseContext(
          anonymousLoginEndpoint: testAnonymousLoginEndpoint,
          graphqlEndpoint: testGraphqlEndpoint,
          setPrimaryPhoneNumberEndpoint: testSetPrimaryPhoneNumberEndpoint,
          refreshTokenEndpoint: testRefreshTokenEndpoint,
          retryResendOtpEndpoint: testRetryResendOtpEndpoint,
          pinResetEndpoint: testPinResetEndpoint,
          userRecoveryPhoneNumbersEndpoint:
              testUserRecoveryPhoneNumbersEndpoint,
          verifyContactOTPEndpoint: testVerifyContactOTPEndpoint,
          verifyPhoneEndpoint: testVerifyPhoneEndpoint,
          sendContactVerificationOTPEndpoint:
              testSendContactVerificationOTPEndpoint,
          sendRecoverAccountOtpEndpoint: testSendRecoverAccountOtpEndpoint,
          loginByPhoneEndpoint: testLoginByPhoneEndpoint,
          updateUserPinEndpoint: testUpdateUserPinEndpoint,
          uploadFileEndPoint: testUploadFileEndPoint,
          createUserByPhoneEndpoint: testCreateUserByPhoneEndpoint,
        ),
      );
    default:
      return AppSetupData(
        appContexts: testAppContexts,
        sentryDNS: FlutterConfig.get('DEV_SENTRY_DNS') as String,
        customContext: const BaseContext(
          anonymousLoginEndpoint: testAnonymousLoginEndpoint,
          graphqlEndpoint: testGraphqlEndpoint,
          setPrimaryPhoneNumberEndpoint: testSetPrimaryPhoneNumberEndpoint,
          refreshTokenEndpoint: testRefreshTokenEndpoint,
          retryResendOtpEndpoint: testRetryResendOtpEndpoint,
          pinResetEndpoint: testPinResetEndpoint,
          userRecoveryPhoneNumbersEndpoint:
              testUserRecoveryPhoneNumbersEndpoint,
          verifyContactOTPEndpoint: testVerifyContactOTPEndpoint,
          verifyPhoneEndpoint: testVerifyPhoneEndpoint,
          sendContactVerificationOTPEndpoint:
              testSendContactVerificationOTPEndpoint,
          sendRecoverAccountOtpEndpoint: testSendRecoverAccountOtpEndpoint,
          loginByPhoneEndpoint: testLoginByPhoneEndpoint,
          updateUserPinEndpoint: testUpdateUserPinEndpoint,
          uploadFileEndPoint: testUploadFileEndPoint,
          createUserByPhoneEndpoint: testCreateUserByPhoneEndpoint,
        ),
      );
  }
}

/// Returns a list of secondary phone numbers
List<PhoneNumber>? deconstructSecondaryPhoneNumber(
    CoreState state, UserProfile? userProfile) {
  if (userProfile?.secondaryPhoneNumbers != null) {
    /// overwrite secondary phones to avoid complex pattern matching
    return userProfile?.secondaryPhoneNumbers;
  } else {
    if (state.userState!.userProfile!.secondaryPhoneNumbers != null) {
      return state.userState!.userProfile!.secondaryPhoneNumbers;
    }
  }
  return null;
}

/// Returns a list of secondary email addresses
List<EmailAddress>? deconstructSecondaryEmailAddresses(
    CoreState state, UserProfile? userProfile) {
  if (userProfile?.secondaryEmailAddresses != null) {
    /// overwrite secondary emails to avoid complex pattern matching
    return userProfile?.secondaryEmailAddresses;
  } else {
    if (state.userState!.userProfile!.secondaryEmailAddresses != null) {
      return state.userState!.userProfile!.secondaryEmailAddresses;
    }
  }
  return null;
}
