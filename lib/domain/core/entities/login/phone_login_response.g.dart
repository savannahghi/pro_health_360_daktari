// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phone_login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PhoneLoginResponse _$$_PhoneLoginResponseFromJson(
        Map<String, dynamic> json) =>
    _$_PhoneLoginResponse(
      code: json['code'] as int?,
      message: json['message'] as String?,
      userResponse: json['response'] == null
          ? null
          : UserResponse.fromJson(json['response'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_PhoneLoginResponseToJson(
        _$_PhoneLoginResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'response': instance.userResponse,
    };
