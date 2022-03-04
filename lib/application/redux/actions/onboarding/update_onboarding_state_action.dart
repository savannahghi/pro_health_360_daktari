// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:myharehubpro/application/redux/states/app_state.dart';
import 'package:myharehubpro/application/redux/states/onboarding/onboarding_state.dart';
// Project imports:

class UpdateOnboardingStateAction extends ReduxAction<AppState> {
  UpdateOnboardingStateAction({
    this.securityQuestions,
    this.securityQuestionsResponses,
    this.isPhoneVerified,
    this.otp,
    this.invalidOTP,
    this.failedToSendOTP,
    this.canResendOTP,
    this.termsAccepted,
    this.hasSetNickName,
    this.hasSetSecurityQuestions,
    this.hasVerifiedSecurityQuestions,
    this.hasSetPin,
    this.isResetPin,
    this.unKnownPhoneNo,
    this.phoneNumber,
    this.pinCode,
    this.invalidCredentials,
  });

  List<SecurityQuestion>? securityQuestions;
  List<SecurityQuestionResponse>? securityQuestionsResponses;
  bool? isPhoneVerified;
  final String? otp;
  final bool? invalidOTP;
  final bool? failedToSendOTP;
  final bool? canResendOTP;
  bool? termsAccepted;
  bool? hasSetNickName;
  bool? hasSetSecurityQuestions;
  bool? hasVerifiedSecurityQuestions;
  bool? hasSetPin;
  bool? isResetPin;
  final bool? unKnownPhoneNo;
  final String? phoneNumber;
  final String? pinCode;
  final bool? invalidCredentials;

  @override
  AppState reduce() {
    final bool? oldPhoneVerified = state.onboardingState?.isPhoneVerified;

    final OnboardingState? newOnboardingState = state.onboardingState?.copyWith(
      isPINSet: hasSetPin ?? state.onboardingState?.isPINSet,
      isResetPin: isResetPin ?? state.onboardingState?.isResetPin,
      securityQuestions:
          securityQuestions ?? state.onboardingState?.securityQuestions,
      securityQuestionResponses: securityQuestionsResponses ??
          state.onboardingState?.securityQuestionResponses,
      isPhoneVerified: isPhoneVerified ?? oldPhoneVerified,
      termsAccepted: termsAccepted ?? state.onboardingState?.termsAccepted,
      hasSetNickName: hasSetNickName ?? state.onboardingState?.hasSetNickName,
      hasSetSecurityQuestions: hasSetSecurityQuestions ??
          state.onboardingState?.hasSetSecurityQuestions,
      hasVerifiedSecurityQuestions: hasVerifiedSecurityQuestions ??
          state.onboardingState?.hasVerifiedSecurityQuestions,
      verifyPhoneState: state.onboardingState?.verifyPhoneState?.copyWith(
        otp: otp ?? state.onboardingState?.verifyPhoneState?.otp,
        failedToSendOTP: failedToSendOTP ??
            state.onboardingState?.verifyPhoneState?.failedToSendOTP ??
            false,
        canResendOTP: canResendOTP ??
            state.onboardingState?.verifyPhoneState?.canResendOTP ??
            false,
      ),
      phoneLogin: state.onboardingState?.phoneLogin?.copyWith(
        unKnownPhoneNo:
            unKnownPhoneNo ?? state.onboardingState?.phoneLogin?.unKnownPhoneNo,
        phoneNumber:
            phoneNumber ?? state.onboardingState?.phoneLogin?.phoneNumber,
        pinCode: pinCode ?? state.onboardingState?.phoneLogin?.pinCode,
        invalidCredentials: invalidCredentials ??
            state.onboardingState?.phoneLogin?.invalidCredentials,
      ),
    );

    final AppState newState =
        state.copyWith(onboardingState: newOnboardingState);

    return newState;
  }
}
