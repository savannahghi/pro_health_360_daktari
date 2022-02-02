// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'misc_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MiscState _$_$_MiscStateFromJson(Map<String, dynamic> json) {
  return _$_MiscState(
    message: json['message'] as String?,
    otpCode: json['otpCode'] as String?,
    acceptedTerms: json['acceptedTerms'] as bool?,
    faqList: (json['faqList'] as List<dynamic>?)
        ?.map((e) =>
            e == null ? null : FAQContent.fromJson(e as Map<String, dynamic>))
        .toList(),
    createPin: json['createPin'] as String?,
    confirmPin: json['confirmPin'] as String?,
    accountExists: json['accountExists'] as bool?,
    invalidPin: json['invalidPin'] as bool?,
    hasCompletedEnteringOTP: json['hasCompletedEnteringOTP'] as bool?,
    isResendingOTP: json['isResendingOTP'] as bool?,
    error: json['error'] as String?,
    initialRoute: json['initialRoute'] as String?,
  );
}

Map<String, dynamic> _$_$_MiscStateToJson(_$_MiscState instance) =>
    <String, dynamic>{
      'message': instance.message,
      'otpCode': instance.otpCode,
      'acceptedTerms': instance.acceptedTerms,
      'faqList': instance.faqList,
      'createPin': instance.createPin,
      'confirmPin': instance.confirmPin,
      'accountExists': instance.accountExists,
      'invalidPin': instance.invalidPin,
      'hasCompletedEnteringOTP': instance.hasCompletedEnteringOTP,
      'isResendingOTP': instance.isResendingOTP,
      'error': instance.error,
      'initialRoute': instance.initialRoute,
    };
