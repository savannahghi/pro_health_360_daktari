/* TEST ENDPOINTS 

We are using staging endpoints here so as to match what the backend does.

The environment that these endpoints call is STRICTLY for internal DEVs only
*/
const String kTestGraphqlEndpoint =
    'https://gateway.test.savannahghi.org/graphql';
const String kTestLoginByPhoneEndpoint =
    'https://mycarehub-staging.savannahghi.org/login_by_phone';
const String kTestPinResetEndpoint =
    'https://mycarehub-staging.savannahghi.org/request_pin_reset';
const String kTestUpdateUserPinEndpoint =
    'https://mycarehub-staging.savannahghi.org/reset_pin';
const String kTestVerifyPhoneEndpoint =
    'https://mycarehub-staging.savannahghi.org/verify_phone';
const String kTestCreateUserByPhoneEndpoint =
    'https://mycarehub-staging.savannahghi.org/create_user_by_phone';
const String kTestRetryResendOtpEndpoint =
    'https://mycarehub-staging.savannahghi.org/send_retry_otp';
const String kTestRefreshTokenEndpoint =
    'https://mycarehub-staging.savannahghi.org/refresh_token';
const String kTestAnonymousLoginEndpoint =
    'https://mycarehub-staging.savannahghi.org/login_anonymous';
const String kTestUserRecoveryPhoneNumbersEndpoint =
    'https://mycarehub-staging.savannahghi.org/user_recovery_phonenumbers';
const String kTestSendRecoverAccountOtpEndpoint =
    'https://mycarehub-staging.savannahghi.org/send_otp';
const String kTestSetPrimaryPhoneNumberEndpoint =
    'https://mycarehub-staging.savannahghi.org/set_primary_phonenumber';
const String kTestUploadFileEndPoint =
    'https://engagement-testing.savannahghi.org/upload';
const String kTestSendContactVerificationOTPEndpoint =
    'https://edi-testing.healthcloud.co.ke/send_otp';
const String kTestVerifyContactOTPEndpoint =
    'https://mycarehub-staging.savannahghi.org/verify_otp';

/*DEMO ENDPOINTS  */
const String kDemoGraphqlEndpoint =
    'https://gateway.test.savannahghi.org/graphql';
const String kDemoLoginByPhoneEndpoint =
    'https://mycarehub-testing.savannahghi.org/login_by_phone';
const String kDemoPinResetEndpoint =
    'https://mycarehub-testing.savannahghi.org/request_pin_reset';
const String kDemoUpdateUserPinEndpoint =
    'https://mycarehub-testing.savannahghi.org/reset_pin';
const String kDemoVerifyPhoneEndpoint =
    'https://mycarehub-testing.savannahghi.org/verify_phone';
const String kDemoCreateUserByPhoneEndpoint =
    'https://mycarehub-testing.savannahghi.org/create_user_by_phone';
const String kDemoRetryResendOtpEndpoint =
    'https://mycarehub-testing.savannahghi.org/send_retry_otp';
const String kDemoRefreshTokenEndpoint =
    'https://mycarehub-testing.savannahghi.org/refresh_token';
const String kDemoAnonymousLoginEndpoint =
    'https://mycarehub-testing.savannahghi.org/login_anonymous';
const String kDemoUserRecoveryPhoneNumbersEndpoint =
    'https://mycarehub-testing.savannahghi.org/user_recovery_phonenumbers';
const String kDemoSendRecoverAccountOtpEndpoint =
    'https://mycarehub-testing.savannahghi.org/send_otp';
const String kDemoSetPrimaryPhoneNumberEndpoint =
    'https://mycarehub-testing.savannahghi.org/set_primary_phonenumber';
const String kDemoUploadFileEndPoint =
    'https://engagement-testing.savannahghi.org/upload';
const String kDemoSendContactVerificationOTPEndpoint =
    'https://edi-testing.healthcloud.co.ke/send_otp';
const String kDemoVerifyContactOTPEndpoint =
    'https://mycarehub-testing.savannahghi.org/verify_otp';

/* PROD ENDPOINTS */
const String kProdGraphqlEndpoint =
    'https://gateway.test.savannahghi.org/graphql';
const String kProdLoginByPhoneEndpoint =
    'https://onboarding-prod.savannahghi.org/login_by_phone';
const String kProdPinResetEndpoint =
    'https://onboarding-prod.savannahghi.org/request_pin_reset';
const String kProdUpdateUserPinEndpoint =
    'https://onboarding-prod.savannahghi.org/reset_pin';
const String kProdVerifyPhoneEndpoint =
    'https://onboarding-prod.savannahghi.org/verify_phone';
const String kProdCreateUserByPhoneEndpoint =
    'https://onboarding-prod.savannahghi.org/create_user_by_phone';
const String kProdRetryResendOtpEndpoint =
    'https://onboarding-prod.savannahghi.org/send_retry_otp';
const String kProdRefreshTokenEndpoint =
    'https://onboarding-prod.savannahghi.org/refresh_token';
const String kProdAnonymousLoginEndpoint =
    'https://onboarding-prod.savannahghi.org/login_anonymous';
const String kProdUserRecoveryPhoneNumbersEndpoint =
    'https://onboarding-prod.savannahghi.org/user_recovery_phonenumbers';
const String kProdSendRecoverAccountOtpEndpoint =
    'https://onboarding-prod.savannahghi.org/send_otp';
const String kProdSetPrimaryPhoneNumberEndpoint =
    'https://onboarding-prod.savannahghi.org/set_primary_phonenumber';
const String kProdUploadFileEndPoint =
    'https://engagement-prod.savannahghi.org/upload';
const String kProdSendContactVerificationOTPEndpoint =
    'https://edi-prod.healthcloud.co.ke/send_otp';
const String kProdVerifyContactOTPEndpoint =
    'https://onboarding-prod.savannahghi.org/verify_otp';
