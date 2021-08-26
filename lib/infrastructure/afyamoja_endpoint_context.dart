import 'package:app_wrapper/app_wrapper.dart';
import 'package:healthcloud/infrastructure/endpoints.dart' as local_endpoints;

/// [AfyaMojaEndpointContext] returns the correct server endpoint depending on the context
/// that the app is running on
class AfyaMojaEndpointContext extends EndpointContext {
  static String getGraphQLEndpoint(List<AppContext> contexts) {
    if (contexts.contains(AppContext.AppProd)) {
      return kProdGraphqlEndpoint;
    }
    if (contexts.contains(AppContext.AppDemo)) {
      return kDemoGraphqlEndpoint;
    }
    if (contexts.contains(AppContext.AppE2E)) {
      return ke2eGraphqlEndpoint;
    }
    return local_endpoints.testGraphqlEndpoint;
  }

  static String loginByPhoneEndpoint(List<AppContext> contexts) {
    if (contexts.contains(AppContext.AppProd)) {
      return kProdLoginByPhoneEndpoint;
    }

    if (contexts.contains(AppContext.AppDemo)) {
      return kDemoLoginByPhoneEndpoint;
    }

    if (contexts.contains(AppContext.AppE2E)) {
      return ke2eLoginByPhoneEndpoint;
    }

    return local_endpoints.testLoginByPhoneEndpoint;
  }

  static String uploadFileEndpoint(List<AppContext> contexts) {
    if (contexts.contains(AppContext.AppProd)) {
      return kProdUploadFileEndPoint;
    }

    if (contexts.contains(AppContext.AppDemo)) {
      return kDemoUploadFileEndPoint;
    }

    if (contexts.contains(AppContext.AppE2E)) {
      return ke2eUploadFileEndPoint;
    }

    return local_endpoints.testUploadFileEndPoint;
  }

  static String resetPinResetEndpoint(List<AppContext> contexts) {
    if (contexts.contains(AppContext.AppProd)) {
      return kProdPinResetEndpoint;
    }
    if (contexts.contains(AppContext.AppDemo)) {
      return kDemoPinResetEndpoint;
    }
    if (contexts.contains(AppContext.AppE2E)) {
      return ke2ePinResetEndpoint;
    }
    return local_endpoints.testPinResetEndpoint;
  }

  static String updateUserPinEndpoint(List<AppContext> contexts) {
    if (contexts.contains(AppContext.AppProd)) {
      return kProdUpdateUserPinEndpoint;
    }
    if (contexts.contains(AppContext.AppDemo)) {
      return kDemoUpdateUserPinEndpoint;
    }
    if (contexts.contains(AppContext.AppE2E)) {
      return ke2eUpdateUserPinEndpoint;
    }
    return local_endpoints.testUpdateUserPinEndpoint;
  }

  static String verifyPhoneEndpoint(List<AppContext> contexts) {
    if (contexts.contains(AppContext.AppProd)) {
      return kProdVerifyPhoneEndpoint;
    }
    if (contexts.contains(AppContext.AppDemo)) {
      return kDemoVerifyPhoneEndpoint;
    }
    if (contexts.contains(AppContext.AppE2E)) {
      return ke2eVerifyPhoneEndpoint;
    }
    return local_endpoints.testVerifyPhoneEndpoint;
  }

  static String createUserByPhoneEndpoint(List<AppContext> contexts) {
    if (contexts.contains(AppContext.AppProd)) {
      return kProdCreateUserByPhoneEndpoint;
    }
    if (contexts.contains(AppContext.AppDemo)) {
      return kDemoCreateUserByPhoneEndpoint;
    }
    if (contexts.contains(AppContext.AppE2E)) {
      return ke2eCreateUserByPhoneEndpoint;
    }
    return local_endpoints.testCreateUserByPhoneEndpoint;
  }

  static String retrySendOtpEndpoint(List<AppContext> contexts) {
    if (contexts.contains(AppContext.AppProd)) {
      return kProdRetryResendOtpEndpoint;
    }
    if (contexts.contains(AppContext.AppDemo)) {
      return kDemoRetryResendOtpEndpoint;
    }
    if (contexts.contains(AppContext.AppE2E)) {
      return ke2eRetryResendOtpEndpoint;
    }
    return local_endpoints.testRetryResendOtpEndpoint;
  }

  static String refreshTokenEndpoint(List<AppContext> contexts) {
    if (contexts.contains(AppContext.AppProd)) {
      return kProdRefreshTokenEndpoint;
    }
    if (contexts.contains(AppContext.AppDemo)) {
      return kDemoRefreshTokenEndpoint;
    }
    if (contexts.contains(AppContext.AppE2E)) {
      return ke2eRefreshTokenEndpoint;
    }
    return local_endpoints.testRefreshTokenEndpoint;
  }

  static String anonymousLoginEndpoint(List<AppContext> contexts) {
    if (contexts.contains(AppContext.AppProd)) {
      return kProdAnonymousLoginEndpoint;
    }
    if (contexts.contains(AppContext.AppDemo)) {
      return kDemoAnonymousLoginEndpoint;
    }
    if (contexts.contains(AppContext.AppE2E)) {
      return ke2eAnonymousLoginEndpoint;
    }
    return local_endpoints.testAnonymousLoginEndpoint;
  }

  static String userRecoveryPhoneNumbers(List<AppContext> contexts) {
    if (contexts.contains(AppContext.AppProd)) {
      return kProdUserRecoveryPhoneNumbersEndpoint;
    }
    if (contexts.contains(AppContext.AppDemo)) {
      return kDemoUserRecoveryPhoneNumbersEndpoint;
    }
    if (contexts.contains(AppContext.AppE2E)) {
      return ke2eUserRecoveryPhoneNumbersEndpoint;
    }
    return local_endpoints.testUserRecoveryPhoneNumbersEndpoint;
  }

  static String sendRecoverAccountOTP(List<AppContext> contexts) {
    if (contexts.contains(AppContext.AppProd)) {
      return kProdSendRecoverAccountOtpEndpoint;
    }
    if (contexts.contains(AppContext.AppDemo)) {
      return kDemoSendRecoverAccountOtpEndpoint;
    }
    if (contexts.contains(AppContext.AppE2E)) {
      return ke2eSendRecoverAccountOtpEndpoint;
    }
    return local_endpoints.testSendRecoverAccountOtpEndpoint;
  }

  static String setPrimaryPhoneNumber(List<AppContext> contexts) {
    if (contexts.contains(AppContext.AppProd)) {
      return kProdSetPrimaryPhoneNumberEndpoint;
    }
    if (contexts.contains(AppContext.AppDemo)) {
      return kDemoSetPrimaryPhoneNumberEndpoint;
    }
    if (contexts.contains(AppContext.AppE2E)) {
      return ke2eSetPrimaryPhoneNumberEndpoint;
    }
    return local_endpoints.testSetPrimaryPhoneNumberEndpoint;
  }

  static String sendContactVerificationOTP(List<AppContext> contexts) {
    if (contexts.contains(AppContext.AppProd)) {
      return kProdSendContactVerificationOTPEndpoint;
    }
    if (contexts.contains(AppContext.AppDemo)) {
      return kDemoSendContactVerificationOTPEndpoint;
    }
    return local_endpoints.testSendContactVerificationOTPEndpoint;
  }

  static String verifyContactOTP(List<AppContext> contexts) {
    if (contexts.contains(AppContext.AppProd)) {
      return kProdVerifyContactOTPEndpoint;
    }
    if (contexts.contains(AppContext.AppDemo)) {
      return kDemoVerifyContactOTPEndpoint;
    }
    return local_endpoints.testVerifyContactOTPEndpoint;
  }
}
