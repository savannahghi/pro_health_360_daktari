import 'package:flutter_test/flutter_test.dart';
import 'package:healthcloud/domain/core/value_objects/app_contexts.dart';
import 'package:healthcloud/infrastructure/afyamoja_endpoint_context.dart';
import 'package:healthcloud/infrastructure/endpoints.dart';

void main() {
  group('AfyaMojaEndpointContext', () {
    test(
        'should return the correct test endpoints when [testAppContexts]'
        ' is passed', () {
      expect(AfyaMojaEndpointContext.getGraphQLEndpoint(testAppContexts),
          kTestGraphqlEndpoint);

      expect(AfyaMojaEndpointContext.loginByPhoneEndpoint(testAppContexts),
          kTestLoginByPhoneEndpoint);

      expect(AfyaMojaEndpointContext.resetPinResetEndpoint(testAppContexts),
          kTestPinResetEndpoint);

      expect(AfyaMojaEndpointContext.updateUserPinEndpoint(testAppContexts),
          kTestUpdateUserPinEndpoint);

      expect(AfyaMojaEndpointContext.verifyPhoneEndpoint(testAppContexts),
          kTestVerifyPhoneEndpoint);

      expect(AfyaMojaEndpointContext.createUserByPhoneEndpoint(testAppContexts),
          kTestCreateUserByPhoneEndpoint);

      expect(AfyaMojaEndpointContext.retrySendOtpEndpoint(testAppContexts),
          kTestRetryResendOtpEndpoint);

      expect(AfyaMojaEndpointContext.refreshTokenEndpoint(testAppContexts),
          kTestRefreshTokenEndpoint);

      expect(AfyaMojaEndpointContext.anonymousLoginEndpoint(testAppContexts),
          kTestAnonymousLoginEndpoint);

      expect(AfyaMojaEndpointContext.userRecoveryPhoneNumbers(testAppContexts),
          kTestUserRecoveryPhoneNumbersEndpoint);

      expect(AfyaMojaEndpointContext.sendRecoverAccountOTP(testAppContexts),
          kTestSendRecoverAccountOtpEndpoint);

      expect(AfyaMojaEndpointContext.setPrimaryPhoneNumber(testAppContexts),
          kTestSetPrimaryPhoneNumberEndpoint);

      expect(AfyaMojaEndpointContext.uploadFileEndpoint(testAppContexts),
          kTestUploadFileEndPoint);

      expect(
          AfyaMojaEndpointContext.sendContactVerificationOTP(testAppContexts),
          kTestSendContactVerificationOTPEndpoint);

      expect(AfyaMojaEndpointContext.verifyContactOTP(testAppContexts),
          kTestVerifyContactOTPEndpoint);
    });
  });
}
