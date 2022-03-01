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
      credentials: json['credentials'] == null
          ? null
          : AuthCredentials.fromJson(
              json['credentials'] as Map<String, dynamic>),
      staffState: json['staffProfile'] == null
          ? null
          : StaffState.fromJson(json['staffProfile'] as Map<String, dynamic>),
      streamToken: json['getStreamToken'] as String?,
    );

Map<String, dynamic> _$$_PhoneLoginResponseToJson(
        _$_PhoneLoginResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'credentials': instance.credentials,
      'staffProfile': instance.staffState,
      'getStreamToken': instance.streamToken,
    };
