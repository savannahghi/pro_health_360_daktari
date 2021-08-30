import 'package:flutter_test/flutter_test.dart';
import 'package:healthcloud/domain/core/value_objects/app_contexts.dart';
import 'package:healthcloud/infrastructure/afyamoja_endpoint_context.dart';
import 'package:healthcloud/infrastructure/endpoints.dart';

void main() {
  group('test endpoints', () {
    test('test endpoints', () {
      expect(AfyaMojaEndpointContext.getGraphQLEndpoint(testAppContexts),
          testGraphqlEndpoint);

      expect(AfyaMojaEndpointContext.loginByPhoneEndpoint(testAppContexts),
          testLoginByPhoneEndpoint);

      expect(AfyaMojaEndpointContext.resetPinResetEndpoint(testAppContexts),
          testPinResetEndpoint);

      expect(AfyaMojaEndpointContext.updateUserPinEndpoint(testAppContexts),
          testUpdateUserPinEndpoint);

      expect(AfyaMojaEndpointContext.verifyPhoneEndpoint(testAppContexts),
          testVerifyPhoneEndpoint);

      expect(AfyaMojaEndpointContext.createUserByPhoneEndpoint(testAppContexts),
          testCreateUserByPhoneEndpoint);

      expect(AfyaMojaEndpointContext.retrySendOtpEndpoint(testAppContexts),
          testRetryResendOtpEndpoint);

      expect(AfyaMojaEndpointContext.refreshTokenEndpoint(testAppContexts),
          testRefreshTokenEndpoint);

      expect(AfyaMojaEndpointContext.anonymousLoginEndpoint(testAppContexts),
          testAnonymousLoginEndpoint);

      expect(AfyaMojaEndpointContext.userRecoveryPhoneNumbers(testAppContexts),
          testUserRecoveryPhoneNumbersEndpoint);

      expect(AfyaMojaEndpointContext.sendRecoverAccountOTP(testAppContexts),
          testSendRecoverAccountOtpEndpoint);

      expect(AfyaMojaEndpointContext.setPrimaryPhoneNumber(testAppContexts),
          testSetPrimaryPhoneNumberEndpoint);

      expect(AfyaMojaEndpointContext.uploadFileEndpoint(testAppContexts),
          testUploadFileEndPoint);

      expect(
          AfyaMojaEndpointContext.sendContactVerificationOTP(testAppContexts),
          testSendContactVerificationOTPEndpoint);

      expect(AfyaMojaEndpointContext.verifyContactOTP(testAppContexts),
          testVerifyContactOTPEndpoint);
    });
  });
}
