// Package imports:
import 'package:app_wrapper/app_wrapper.dart' show AppContext, BaseContext;
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:domain_objects/entities.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:flutter_config/flutter_config.dart';

// Project imports:
import 'package:healthcloud/application/core/services/app_setup_data.dart';
import 'package:healthcloud/domain/core/value_objects/app_contexts.dart';
import 'package:healthcloud/infrastructure/endpoints.dart';

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
      return devAppSetupData;
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
  ),
);

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
