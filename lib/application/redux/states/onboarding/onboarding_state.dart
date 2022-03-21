// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mycarehubpro/domain/core/entities/terms/terms_and_conditions.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_enums.dart';

part 'onboarding_state.freezed.dart';
part 'onboarding_state.g.dart';

@freezed
class OnboardingState with _$OnboardingState {
  factory OnboardingState({
    TermsAndConditions? termsAndConditions,
    List<SecurityQuestion>? securityQuestions,
    List<SecurityQuestionResponse>? securityQuestionResponses,

    ///------------WORKFLOW RELATED BOOLEANS------------
    /// Have standardized shared values that will be used across all states
    /// regardless of the workflow
    // The current stage of onboarding that the user is in
    CurrentOnboardingStage? currentOnboardingStage,

    // If the user has verified their phone number
    bool? isPhoneVerified,

    // If the user has set their security questions
    bool? hasSetSecurityQuestions,

    // If the user has successfully verified their security questions if pin is expired
    bool? hasVerifiedSecurityQuestions,

    // If the user has set their nickname
    bool? hasSetNickName,

    // Whether the user's PIN has been set
    final bool? hasSetPin,

    // Whether the user has accepted terms and conditions
    final bool? hasAcceptedTerms,

    ///------------WORKFLOW RELATED VALUES------------
    // The currently active user's phone number
    final String? phoneNumber,

    // The PIN
    final String? pin,

    // The confirm PIN
    final String? confirmPIN,

    // The OTP used when confirming the phone number
    final String? otp,

    ///------------LOGIN RELATED VALUES------------
    // The number of failed login attempts that this user has
    final int? failedLoginCount,

    // Whether the credentials this user entered are invalid
    final bool? invalidCredentials,

    ///------------VERIFY PHONE RELATED VALUES------------
    // If the OTP entered is invalid
    final bool? invalidOTP,

    // Whether there was a failure while sending an OTP
    final bool? failedToSendOTP,

    //  Whether the user is allowed to resend their PIN
    final bool? canResendOTP,
  }) = _OnboardingState;

  factory OnboardingState.fromJson(Map<String, dynamic> json) =>
      _$OnboardingStateFromJson(json);

  factory OnboardingState.initial() => OnboardingState(
        termsAndConditions: TermsAndConditions.initial(),
        securityQuestions: <SecurityQuestion>[],
        securityQuestionResponses: <SecurityQuestionResponse>[],
        currentOnboardingStage: CurrentOnboardingStage.Login,
        isPhoneVerified: false,
        hasSetSecurityQuestions: false,
        hasVerifiedSecurityQuestions: false,
        hasSetNickName: false,
        hasSetPin: false,
        hasAcceptedTerms: false,
        phoneNumber: UNKNOWN,
        pin: UNKNOWN,
        confirmPIN: UNKNOWN,
        otp: UNKNOWN,
        failedLoginCount: 0,
        invalidCredentials: false,
        invalidOTP: false,
        failedToSendOTP: false,
        canResendOTP: false,
      );
}
