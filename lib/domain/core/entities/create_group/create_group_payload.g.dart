// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_group_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CreateGroupPayload _$$_CreateGroupPayloadFromJson(
        Map<String, dynamic> json) =>
    _$_CreateGroupPayload(
      name: json['name'] as String?,
      description: json['description'] as String?,
      ageRange: json['ageRange'] == null
          ? null
          : AgeRange.fromJson(json['ageRange'] as Map<String, dynamic>),
      gender: (json['gender'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$GenderEnumMap, e))
          .toList(),
      clientType: (json['clientType'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$ClientTypeEnumMap, e))
          .toList(),
      inviteOnly: json['inviteOnly'] as bool?,
    );

Map<String, dynamic> _$$_CreateGroupPayloadToJson(
        _$_CreateGroupPayload instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'ageRange': instance.ageRange?.toJson(),
      'gender': instance.gender?.map((e) => _$GenderEnumMap[e]).toList(),
      'clientType':
          instance.clientType?.map((e) => _$ClientTypeEnumMap[e]).toList(),
      'inviteOnly': instance.inviteOnly,
    };

const _$GenderEnumMap = {
  Gender.male: 'male',
  Gender.female: 'female',
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
