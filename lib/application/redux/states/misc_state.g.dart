// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'misc_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MiscState _$_$_MiscStateFromJson(Map<String, dynamic> json) {
  return _$_MiscState(
    visitCount: json['visitCount'] as String?,
    title: json['title'] as String?,
    message: json['message'] as String?,
    phoneNumber: json['phoneNumber'] as String?,
    otpCode: json['otpCode'] as String?,
    pinCode: json['pinCode'] as String?,
    acceptedTerms: json['acceptedTerms'] as bool?,
    faqList: (json['faqList'] as List<dynamic>?)
        ?.map((e) =>
            e == null ? null : FAQContent.fromJson(e as Map<String, dynamic>))
        .toList(),
    eventState: json['eventState'] == null
        ? null
        : EventState.fromJson(json['eventState'] as Map<String, dynamic>),
    defaultLocation: json['defaultLocation'] as String?,
    createPin: json['createPin'] as String?,
    confirmPin: json['confirmPin'] as String?,
    invalidCredentials: json['invalidCredentials'] as bool?,
    unKnownPhoneNo: json['unKnownPhoneNo'] as bool?,
    accountExists: json['accountExists'] as bool?,
    invalidPin: json['invalidPin'] as bool?,
    patientSearchTerm: json['patientSearchTerm'] as String?,
    hasCompletedEnteringOTP: json['hasCompletedEnteringOTP'] as bool?,
    isResendingOTP: json['isResendingOTP'] as bool?,
  );
}

Map<String, dynamic> _$_$_MiscStateToJson(_$_MiscState instance) =>
    <String, dynamic>{
      'visitCount': instance.visitCount,
      'title': instance.title,
      'message': instance.message,
      'phoneNumber': instance.phoneNumber,
      'otpCode': instance.otpCode,
      'pinCode': instance.pinCode,
      'acceptedTerms': instance.acceptedTerms,
      'faqList': instance.faqList,
      'eventState': instance.eventState,
      'defaultLocation': instance.defaultLocation,
      'createPin': instance.createPin,
      'confirmPin': instance.confirmPin,
      'invalidCredentials': instance.invalidCredentials,
      'unKnownPhoneNo': instance.unKnownPhoneNo,
      'accountExists': instance.accountExists,
      'invalidPin': instance.invalidPin,
      'patientSearchTerm': instance.patientSearchTerm,
      'hasCompletedEnteringOTP': instance.hasCompletedEnteringOTP,
      'isResendingOTP': instance.isResendingOTP,
    };
