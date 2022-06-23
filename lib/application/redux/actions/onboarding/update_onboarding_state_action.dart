// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/states/onboarding/onboarding_state.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_enums.dart';
// Project imports:

class UpdateOnboardingStateAction extends ReduxAction<AppState> {
  UpdateOnboardingStateAction({
    this.currentOnboardingStage,
    this.failedLoginCount,
    this.securityQuestions,
    this.securityQuestionsResponses,
    this.isPhoneVerified,
    this.otp,
    this.invalidOTP,
    this.failedToSendOTP,
    this.canResendOTP,
    this.hasAcceptedTerms,
    this.hasSetNickName,
    this.hasSetSecurityQuestions,
    this.hasVerifiedSecurityQuestions,
    this.hasSetPin,
    this.phoneNumber,
    this.pin,
    this.confirmPIN,
    this.invalidCredentials,
  });

  List<SecurityQuestion>? securityQuestions;
  List<SecurityQuestionResponse>? securityQuestionsResponses;

  ///------------WORKFLOW RELATED BOOLEANS------------
  final CurrentOnboardingStage? currentOnboardingStage;
  bool? isPhoneVerified;
  bool? hasSetSecurityQuestions;
  bool? hasVerifiedSecurityQuestions;
  bool? hasSetNickName;
  bool? hasAcceptedTerms;

  ///------------WORKFLOW RELATED VALUES------------
  final String? phoneNumber;
  final String? pin;
  final String? confirmPIN;
  final String? otp;

  ///------------VERIFY PIN RELATED VALUES------------
  final bool? invalidOTP;
  final bool? failedToSendOTP;
  final bool? canResendOTP;
  bool? hasSetPin;

  ///------------LOGIN RELATED VALUES------------
  final int? failedLoginCount;
  final bool? invalidCredentials;

  @override
  AppState reduce() {
    final bool? oldPhoneVerified = state.onboardingState?.isPhoneVerified;

    final OnboardingState? newOnboardingState = state.onboardingState?.copyWith(
      hasSetPin: hasSetPin ?? state.onboardingState?.hasSetPin,
      securityQuestions:
          securityQuestions ?? state.onboardingState?.securityQuestions,
      securityQuestionResponses: securityQuestionsResponses ??
          state.onboardingState?.securityQuestionResponses,
      isPhoneVerified: isPhoneVerified ?? oldPhoneVerified,
      hasAcceptedTerms:
          hasAcceptedTerms ?? state.onboardingState?.hasAcceptedTerms,
      hasSetNickName: hasSetNickName ?? state.onboardingState?.hasSetNickName,
      hasSetSecurityQuestions: hasSetSecurityQuestions ??
          state.onboardingState?.hasSetSecurityQuestions,
      hasVerifiedSecurityQuestions: hasVerifiedSecurityQuestions ??
          state.onboardingState?.hasVerifiedSecurityQuestions,
      otp: otp ?? state.onboardingState?.otp,
      failedToSendOTP:
          failedToSendOTP ?? state.onboardingState?.failedToSendOTP,
      canResendOTP: canResendOTP ?? state.onboardingState?.canResendOTP,
      pin: pin ?? state.onboardingState?.pin,
      confirmPIN: confirmPIN ?? state.onboardingState?.confirmPIN,
      invalidCredentials:
          invalidCredentials ?? state.onboardingState?.invalidCredentials,
      phoneNumber: phoneNumber ?? state.onboardingState?.phoneNumber,
      currentOnboardingStage: currentOnboardingStage ??
          state.onboardingState?.currentOnboardingStage,
    );

    final AppState newState =
        state.copyWith(onboardingState: newOnboardingState);

    return newState;
  }
}

class ResetOnboardingStateAction extends ReduxAction<AppState> {
  ResetOnboardingStateAction();

  @override
  AppState reduce() {
    final AppState newState =
        state.copyWith(onboardingState: OnboardingState.initial());

    return newState;
  }
}
