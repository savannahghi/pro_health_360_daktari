// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phone_login_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PhoneLoginState _$_$_PhoneLoginStateFromJson(Map<String, dynamic> json) {
  return _$_PhoneLoginState(
    invalidCredentials: json['invalidCredentials'] as bool?,
    phoneNumber: json['phoneNumber'] as String?,
    pinCode: json['pinCode'] as String?,
    unKnownPhoneNo: json['unKnownPhoneNo'] as bool?,
  );
}

Map<String, dynamic> _$_$_PhoneLoginStateToJson(_$_PhoneLoginState instance) =>
    <String, dynamic>{
      'invalidCredentials': instance.invalidCredentials,
      'phoneNumber': instance.phoneNumber,
      'pinCode': instance.pinCode,
      'unKnownPhoneNo': instance.unKnownPhoneNo,
    };
