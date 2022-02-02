// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:healthcloud/domain/core/entities/login/create_pin.dart';
import 'package:healthcloud/domain/core/entities/login/phone_login_state.dart';
import 'package:healthcloud/domain/core/entities/login/verify_phone_state.dart';
import 'package:healthcloud/domain/core/entities/security_questions/security_question.dart';
import 'package:healthcloud/domain/core/entities/security_questions/security_question_response.dart';
import 'package:healthcloud/domain/core/entities/terms/terms_and_conditions.dart';

part 'onboarding_state.freezed.dart';
part 'onboarding_state.g.dart';

@freezed
class OnboardingState with _$OnboardingState {
  factory OnboardingState({
    TermsAndConditions? termsAndConditions,
    CreatePINState? createPINState,
    List<SecurityQuestion>? securityQuestions,
    List<SecurityQuestionResponse>? securityQuestionResponses,
    VerifyPhoneState? verifyPhoneState,
    PhoneLoginState? phoneLogin,
    // If the user has verified their phone number
    bool? isPhoneVerified,
    //If the user has set their PIN
    bool? isPINSet,
    //If the user wants to reset their PIN
    bool? isResetPin,
    // If the user has set their security questions
    bool? hasSetSecurityQuestions,
    // If the user has successfuly verified their security questions if pin is expired
    bool? hasVerifiedSecurityQuestions,
    // If the user has set their nickname
    bool? hasSetNickName,
  }) = _OnboardingState;

  factory OnboardingState.fromJson(Map<String, dynamic> json) =>
      _$OnboardingStateFromJson(json);

  factory OnboardingState.initial() => OnboardingState(
        termsAndConditions: TermsAndConditions.initial(),

        ///   - Login state
        ///   - create pin
        phoneLogin: PhoneLoginState.initial(),
        createPINState: CreatePINState.initial(),
        securityQuestions: <SecurityQuestion>[],
        securityQuestionResponses: <SecurityQuestionResponse>[],
        verifyPhoneState: VerifyPhoneState.initial(),
        isPhoneVerified: false,
        isPINSet: false,
        isResetPin: false,
        hasSetSecurityQuestions: false,
        hasVerifiedSecurityQuestions: false,
        hasSetNickName: false,
      );
}
