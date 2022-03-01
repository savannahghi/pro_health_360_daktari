// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OnboardingState _$$_OnboardingStateFromJson(Map<String, dynamic> json) =>
    _$_OnboardingState(
      termsAndConditions: json['termsAndConditions'] == null
          ? null
          : TermsAndConditions.fromJson(
              json['termsAndConditions'] as Map<String, dynamic>),
      createPINState: json['createPINState'] == null
          ? null
          : CreatePINState.fromJson(
              json['createPINState'] as Map<String, dynamic>),
      securityQuestions: (json['securityQuestions'] as List<dynamic>?)
          ?.map((e) => SecurityQuestion.fromJson(e as Map<String, dynamic>))
          .toList(),
      securityQuestionResponses:
          (json['securityQuestionResponses'] as List<dynamic>?)
              ?.map((e) =>
                  SecurityQuestionResponse.fromJson(e as Map<String, dynamic>))
              .toList(),
      verifyPhoneState: json['verifyPhoneState'] == null
          ? null
          : VerifyPhoneState.fromJson(
              json['verifyPhoneState'] as Map<String, dynamic>),
      phoneLogin: json['phoneLogin'] == null
          ? null
          : PhoneLoginState.fromJson(
              json['phoneLogin'] as Map<String, dynamic>),
      termsAccepted: json['termsAccepted'] as bool?,
      isPhoneVerified: json['isPhoneVerified'] as bool?,
      isPINSet: json['isPINSet'] as bool?,
      isResetPin: json['isResetPin'] as bool?,
      hasSetSecurityQuestions: json['hasSetSecurityQuestions'] as bool?,
      hasVerifiedSecurityQuestions:
          json['hasVerifiedSecurityQuestions'] as bool?,
      hasSetNickName: json['hasSetNickName'] as bool?,
    );

Map<String, dynamic> _$$_OnboardingStateToJson(_$_OnboardingState instance) =>
    <String, dynamic>{
      'termsAndConditions': instance.termsAndConditions,
      'createPINState': instance.createPINState,
      'securityQuestions': instance.securityQuestions,
      'securityQuestionResponses': instance.securityQuestionResponses,
      'verifyPhoneState': instance.verifyPhoneState,
      'phoneLogin': instance.phoneLogin,
      'termsAccepted': instance.termsAccepted,
      'isPhoneVerified': instance.isPhoneVerified,
      'isPINSet': instance.isPINSet,
      'isResetPin': instance.isResetPin,
      'hasSetSecurityQuestions': instance.hasSetSecurityQuestions,
      'hasVerifiedSecurityQuestions': instance.hasVerifiedSecurityQuestions,
      'hasSetNickName': instance.hasSetNickName,
    };
