// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'role.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Role _$$_RoleFromJson(Map<String, dynamic> json) => _$_Role(
      roleID: json['authorityRoleID'] as String?,
      name: roleValueFromJson(json['name'] as String?),
      active: json['active'] as bool?,
    );

Map<String, dynamic> _$$_RoleToJson(_$_Role instance) => <String, dynamic>{
      'authorityRoleID': instance.roleID,
      'name': _$RoleValueEnumMap[instance.name],
      'active': instance.active,
    };

const _$RoleValueEnumMap = {
  RoleValue.SYSTEM_ADMINISTRATOR: 'SYSTEM_ADMINISTRATOR',
  RoleValue.COMMUNITY_MANAGEMENT: 'COMMUNITY_MANAGEMENT',
  RoleValue.CONTENT_MANAGEMENT: 'CONTENT_MANAGEMENT',
  RoleValue.CLIENT_MANAGEMENT: 'CLIENT_MANAGEMENT',
};
