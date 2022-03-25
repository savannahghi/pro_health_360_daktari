// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'roles_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RolesList _$$_RolesListFromJson(Map<String, dynamic> json) => _$_RolesList(
      roles: (json['getUserRoles'] as List<dynamic>?)
          ?.map((e) => Role.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_RolesListToJson(_$_RolesList instance) =>
    <String, dynamic>{
      'getUserRoles': instance.roles,
    };
