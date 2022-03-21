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
      securityQuestions: (json['securityQuestions'] as List<dynamic>?)
          ?.map((e) => SecurityQuestion.fromJson(e as Map<String, dynamic>))
          .toList(),
      securityQuestionResponses:
          (json['securityQuestionResponses'] as List<dynamic>?)
              ?.map((e) =>
                  SecurityQuestionResponse.fromJson(e as Map<String, dynamic>))
              .toList(),
      currentOnboardingStage: $enumDecodeNullable(
          _$CurrentOnboardingStageEnumMap, json['currentOnboardingStage']),
      isPhoneVerified: json['isPhoneVerified'] as bool?,
      hasSetSecurityQuestions: json['hasSetSecurityQuestions'] as bool?,
      hasVerifiedSecurityQuestions:
          json['hasVerifiedSecurityQuestions'] as bool?,
      hasSetNickName: json['hasSetNickName'] as bool?,
      hasSetPin: json['hasSetPin'] as bool?,
      hasAcceptedTerms: json['hasAcceptedTerms'] as bool?,
      phoneNumber: json['phoneNumber'] as String?,
      pin: json['pin'] as String?,
      confirmPIN: json['confirmPIN'] as String?,
      otp: json['otp'] as String?,
      failedLoginCount: json['failedLoginCount'] as int?,
      invalidCredentials: json['invalidCredentials'] as bool?,
      invalidOTP: json['invalidOTP'] as bool?,
      failedToSendOTP: json['failedToSendOTP'] as bool?,
      canResendOTP: json['canResendOTP'] as bool?,
    );

Map<String, dynamic> _$$_OnboardingStateToJson(_$_OnboardingState instance) =>
    <String, dynamic>{
      'termsAndConditions': instance.termsAndConditions,
      'securityQuestions': instance.securityQuestions,
      'securityQuestionResponses': instance.securityQuestionResponses,
      'currentOnboardingStage':
          _$CurrentOnboardingStageEnumMap[instance.currentOnboardingStage],
      'isPhoneVerified': instance.isPhoneVerified,
      'hasSetSecurityQuestions': instance.hasSetSecurityQuestions,
      'hasVerifiedSecurityQuestions': instance.hasVerifiedSecurityQuestions,
      'hasSetNickName': instance.hasSetNickName,
      'hasSetPin': instance.hasSetPin,
      'hasAcceptedTerms': instance.hasAcceptedTerms,
      'phoneNumber': instance.phoneNumber,
      'pin': instance.pin,
      'confirmPIN': instance.confirmPIN,
      'otp': instance.otp,
      'failedLoginCount': instance.failedLoginCount,
      'invalidCredentials': instance.invalidCredentials,
      'invalidOTP': instance.invalidOTP,
      'failedToSendOTP': instance.failedToSendOTP,
      'canResendOTP': instance.canResendOTP,
    };

const _$CurrentOnboardingStageEnumMap = {
  CurrentOnboardingStage.Login: 'Login',
  CurrentOnboardingStage.ResetPIN: 'ResetPIN',
  CurrentOnboardingStage.PINExpired: 'PINExpired',
};
