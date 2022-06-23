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
      createdBy: json['createdBy'] == null
          ? null
          : Member.fromJson(json['createdBy'] as Map<String, dynamic>),
      ageRange: json['ageRange'] == null
          ? null
          : AgeRange.fromJson(json['ageRange'] as Map<String, dynamic>),
      gender: (json['gender'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$GenderEnumMap, e))
          .toList(),
      clientType: (json['clientType'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$ClientTypeEnumMap, e))
          .toList(),
    );

Map<String, dynamic> _$$_CommunityToJson(_$_Community instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'memberCount': instance.memberCount,
      'description': instance.description,
      'createdBy': instance.createdBy,
      'ageRange': instance.ageRange,
      'gender': instance.gender?.map((e) => _$GenderEnumMap[e]).toList(),
      'clientType':
          instance.clientType?.map((e) => _$ClientTypeEnumMap[e]).toList(),
    };

const _$GenderEnumMap = {
  Gender.male: 'male',
  Gender.female: 'female',
  Gender.other: 'other',
  Gender.unknown: 'unknown',
};

const _$ClientTypeEnumMap = {
  ClientType.PMTCT: 'PMTCT',
  ClientType.OVC: 'OVC',
  ClientType.OTZ: 'OTZ',
  ClientType.OTZ_PLUS: 'OTZ_PLUS',
  ClientType.HVL: 'HVL',
  ClientType.DREAMS: 'DREAMS',
  ClientType.HIGH_RISK: 'HIGH_RISK',
  ClientType.SPOUSES: 'SPOUSES',
  ClientType.YOUTH: 'YOUTH',
};
