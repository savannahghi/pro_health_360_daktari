// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_phone_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_VerifyPhoneState _$$_VerifyPhoneStateFromJson(Map<String, dynamic> json) =>
    _$_VerifyPhoneState(
      invalidOTP: json['invalidOTP'] as bool? ?? false,
      otp: json['otp'] as String?,
      failedToSendOTP: json['failedToSendOTP'] as bool? ?? false,
      canResendOTP: json['canResendOTP'] as bool? ?? false,
    );

Map<String, dynamic> _$$_VerifyPhoneStateToJson(_$_VerifyPhoneState instance) =>
    <String, dynamic>{
      'invalidOTP': instance.invalidOTP,
      'otp': instance.otp,
      'failedToSendOTP': instance.failedToSendOTP,
      'canResendOTP': instance.canResendOTP,
    };
