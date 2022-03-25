// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SearchUserResponse _$$_SearchUserResponseFromJson(
        Map<String, dynamic> json) =>
    _$_SearchUserResponse(
      id: json['ID'] as String?,
      clientCCCNumber: json['CCCNumber'] as String?,
      staffNumber: json['StaffNumber'] as String?,
      user: json['User'] == null
          ? null
          : UserData.fromJson(json['User'] as Map<String, dynamic>),
      rolesList: json['rolesList'] == null
          ? null
          : RolesList.fromJson(json['rolesList'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_SearchUserResponseToJson(
        _$_SearchUserResponse instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'CCCNumber': instance.clientCCCNumber,
      'StaffNumber': instance.staffNumber,
      'User': instance.user,
      'rolesList': instance.rolesList,
    };
