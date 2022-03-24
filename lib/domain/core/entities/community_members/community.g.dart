// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Community _$$_CommunityFromJson(Map<String, dynamic> json) => _$_Community(
      id: json['id'] as String?,
      name: json['name'] as String?,
      memberCount: json['memberCount'] as int?,
      description: json['description'] as String?,
      createdBy: json['createdBy'] as String?,
    );

Map<String, dynamic> _$$_CommunityToJson(_$_Community instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'memberCount': instance.memberCount,
      'description': instance.description,
      'createdBy': instance.createdBy,
    };
