// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserResponse _$$_UserResponseFromJson(Map<String, dynamic> json) =>
    _$_UserResponse(
      credentials: json['credentials'] == null
          ? null
          : AuthCredentials.fromJson(
              json['credentials'] as Map<String, dynamic>),
      staffState: json['staffProfile'] == null
          ? null
          : StaffState.fromJson(json['staffProfile'] as Map<String, dynamic>),
      streamToken: json['getStreamToken'] as String?,
    );

Map<String, dynamic> _$$_UserResponseToJson(_$_UserResponse instance) =>
    <String, dynamic>{
      'credentials': instance.credentials,
      'staffProfile': instance.staffState,
      'getStreamToken': instance.streamToken,
    };
