/// This show only exposed the AppContext and BaseContext to prevent conflicts
/// between the endpoint constants in the library, and the local ones
import 'package:app_wrapper/app_wrapper.dart' show AppContext, EndpointContext;
import 'package:healthcloud/infrastructure/endpoints.dart';

/// [AfyaMojaEndpointContext] returns the correct server endpoint depending on the context
/// that the app is running on
class AfyaMojaEndpointContext extends EndpointContext {
  static String getGraphQLEndpoint(List<AppContext> contexts) {
    if (contexts.contains(AppContext.AppProd)) {
      return kProdGraphqlEndpoint;
    }

    return kTestGraphqlEndpoint;
  }

  static String loginByPhoneEndpoint(List<AppContext> contexts) {
    if (contexts.contains(AppContext.AppProd)) {
      return kProdLoginByPhoneEndpoint;
    }

    return kTestLoginByPhoneEndpoint;
  }

  static String uploadFileEndpoint(List<AppContext> contexts) {
    if (contexts.contains(AppContext.AppProd)) {
      return kProdUploadFileEndPoint;
    }

    return kTestUploadFileEndPoint;
  }

  static String resetPinResetEndpoint(List<AppContext> contexts) {
    if (contexts.contains(AppContext.AppProd)) {
      return kProdPinResetEndpoint;
    }

    return kTestPinResetEndpoint;
  }

  static String updateUserPinEndpoint(List<AppContext> contexts) {
    if (contexts.contains(AppContext.AppProd)) {
      return kProdUpdateUserPinEndpoint;
    }

    return kTestUpdateUserPinEndpoint;
  }

  static String verifyPhoneEndpoint(List<AppContext> contexts) {
    if (contexts.contains(AppContext.AppProd)) {
      return kProdVerifyPhoneEndpoint;
    }

    return kTestVerifyPhoneEndpoint;
  }

  static String createUserByPhoneEndpoint(List<AppContext> contexts) {
    if (contexts.contains(AppContext.AppProd)) {
      return kProdCreateUserByPhoneEndpoint;
    }

    return kTestCreateUserByPhoneEndpoint;
  }

  static String retrySendOtpEndpoint(List<AppContext> contexts) {
    if (contexts.contains(AppContext.AppProd)) {
      return kProdRetryResendOtpEndpoint;
    }

    return kTestRetryResendOtpEndpoint;
  }

  static String refreshTokenEndpoint(List<AppContext> contexts) {
    if (contexts.contains(AppContext.AppProd)) {
      return kProdRefreshTokenEndpoint;
    }

    return kTestRefreshTokenEndpoint;
  }

  static String anonymousLoginEndpoint(List<AppContext> contexts) {
    if (contexts.contains(AppContext.AppProd)) {
      return kProdAnonymousLoginEndpoint;
    }

    return kTestAnonymousLoginEndpoint;
  }

  static String userRecoveryPhoneNumbers(List<AppContext> contexts) {
    if (contexts.contains(AppContext.AppProd)) {
      return kProdUserRecoveryPhoneNumbersEndpoint;
    }

    return kTestUserRecoveryPhoneNumbersEndpoint;
  }

  static String sendRecoverAccountOTP(List<AppContext> contexts) {
    if (contexts.contains(AppContext.AppProd)) {
      return kProdSendRecoverAccountOtpEndpoint;
    }

    return kTestSendRecoverAccountOtpEndpoint;
  }

  static String setPrimaryPhoneNumber(List<AppContext> contexts) {
    if (contexts.contains(AppContext.AppProd)) {
      return kProdSetPrimaryPhoneNumberEndpoint;
    }

    return kTestSetPrimaryPhoneNumberEndpoint;
  }

  static String sendContactVerificationOTP(List<AppContext> contexts) {
    if (contexts.contains(AppContext.AppProd)) {
      return kProdSendContactVerificationOTPEndpoint;
    }

    return kTestSendContactVerificationOTPEndpoint;
  }

  static String verifyContactOTP(List<AppContext> contexts) {
    if (contexts.contains(AppContext.AppProd)) {
      return kProdVerifyContactOTPEndpoint;
    }

    return kTestVerifyContactOTPEndpoint;
  }
}
