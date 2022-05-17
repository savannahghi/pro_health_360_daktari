/* TEST ENDPOINTS 

We are using staging endpoints here so as to match what the backend does.

The environment that these endpoints call is STRICTLY for internal DEVs only
*/
const String kTestGraphqlEndpoint =
    'https://mycarehub-staging.savannahghi.org/graphql';
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
const String kTestRefreshStreamTokenEndpoint =
    'https://mycarehub-staging.savannahghi.org/refresh_getstream_token';
const String kTestAnonymousLoginEndpoint =
    'https://mycarehub-staging.savannahghi.org/login_anonymous';
const String kTestUserRecoveryPhoneNumbersEndpoint =
    'https://mycarehub-staging.savannahghi.org/user_recovery_phonenumbers';
const String kTestSendRecoverAccountOtpEndpoint =
    'https://mycarehub-staging.savannahghi.org/send_otp';
const String kTestSetPrimaryPhoneNumberEndpoint =
    'https://mycarehub-staging.savannahghi.org/set_primary_phonenumber';
const String kTestUploadFileEndPoint =
    'https://engagement-staging.savannahghi.org/upload';
const String kTestSendContactVerificationOTPEndpoint =
    'https://edi-testing.healthcloud.co.ke/send_otp';
const String kTestVerifyContactOTPEndpoint =
    'https://mycarehub-staging.savannahghi.org/verify_otp';
const String kTestPINResetServiceRequestEndpoint =
    'https://mycarehub-staging.savannahghi.org/service-requests';
const String kTestGetRecordedSecurityQuestionsEndpoint =
    'https://mycarehub-staging.savannahghi.org/get_user_responded_security_questions';
const String kTestVerifySecurityQuestionsEndpoint =
    'https://mycarehub-staging.savannahghi.org/verify_security_questions';
const String kTestOptInEndpoint =
    'https://mycarehub-staging.savannahghi.org/opt-in';

/*DEMO ENDPOINTS  */
const String kDemoGraphqlEndpoint =
    'https://mycarehub-testing.savannahghi.org/graphql';
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
const String kDemoRefreshStreamTokenEndpoint =
    'https://mycarehub-testing.savannahghi.org/refresh_getstream_token';
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
const String kDemoPINResetServiceRequestEndpoint =
    'https://mycarehub-testing.savannahghi.org/service-requests';
const String kDemoGetRecordedSecurityQuestionsEndpoint =
    'https://mycarehub-testing.savannahghi.org/get_user_responded_security_questions';
const String kDemoVerifySecurityQuestionsEndpoint =
    'https://mycarehub-testing.savannahghi.org/verify_security_questions';
const String kDemoOptInEndpoint =
    'https://mycarehub-testing.savannahghi.org/opt-in';

/* PROD ENDPOINTS */
const String kProdGraphqlEndpoint =
    'https://mycarehub-prod.savannahghi.org/graphql';
const String kProdLoginByPhoneEndpoint =
    'https://mycarehub-prod.savannahghi.org/login_by_phone';
const String kProdPinResetEndpoint =
    'https://mycarehub-prod.savannahghi.org/request_pin_reset';
const String kProdUpdateUserPinEndpoint =
    'https://mycarehub-prod.savannahghi.org/reset_pin';
const String kProdVerifyPhoneEndpoint =
    'https://mycarehub-prod.savannahghi.org/verify_phone';
const String kProdCreateUserByPhoneEndpoint =
    'https://mycarehub-prod.savannahghi.org/create_user_by_phone';
const String kProdRetryResendOtpEndpoint =
    'https://mycarehub-prod.savannahghi.org/send_retry_otp';
const String kProdRefreshTokenEndpoint =
    'https://mycarehub-prod.savannahghi.org/refresh_token';
const String kProdRefreshStreamTokenEndpoint =
    'https://mycarehub-prod.savannahghi.org/refresh_getstream_token';
const String kProdAnonymousLoginEndpoint =
    'https://mycarehub-prod.savannahghi.org/login_anonymous';
const String kProdUserRecoveryPhoneNumbersEndpoint =
    'https://mycarehub-prod.savannahghi.org/user_recovery_phonenumbers';
const String kProdSendRecoverAccountOtpEndpoint =
    'https://mycarehub-prod.savannahghi.org/send_otp';
const String kProdSetPrimaryPhoneNumberEndpoint =
    'https://mycarehub-prod.savannahghi.org/set_primary_phonenumber';
const String kProdUploadFileEndPoint =
    'https://engagement-prod.savannahghi.org/upload';
const String kProdSendContactVerificationOTPEndpoint =
    'https://edi-prod.healthcloud.co.ke/send_otp';
const String kProdVerifyContactOTPEndpoint =
    'https://mycarehub-prod.savannahghi.org/verify_otp';
const String kProdPINResetServiceRequestEndpoint =
    'https://mycarehub-prod.savannahghi.org/service-requests';
const String kProdGetRecordedSecurityQuestionsEndpoint =
    'https://mycarehub-prod.savannahghi.org/get_user_responded_security_questions';
const String kProdVerifySecurityQuestionsEndpoint =
    'https://mycarehub-prod.savannahghi.org/verify_security_questions';
const String kProdOptInEndpoint =
    'https://mycarehub-prod.savannahghi.org/opt-in';
