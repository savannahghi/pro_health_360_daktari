// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_configuration_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ClientConfigurationPayload _$$_ClientConfigurationPayloadFromJson(
        Map<String, dynamic> json) =>
    _$_ClientConfigurationPayload(
      clientTypes: (json['clientTypes'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$ClientTypeEnumMap, e))
          .toList(),
      ageRange: json['ageRange'] == null
          ? null
          : AgeRange.fromJson(json['ageRange'] as Map<String, dynamic>),
      gender: (json['gender'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$GenderEnumMap, e))
          .toList(),
    );

Map<String, dynamic> _$$_ClientConfigurationPayloadToJson(
        _$_ClientConfigurationPayload instance) =>
    <String, dynamic>{
      'clientTypes':
          instance.clientTypes?.map((e) => _$ClientTypeEnumMap[e]).toList(),
      'ageRange': instance.ageRange?.toJson(),
      'gender': instance.gender?.map((e) => _$GenderEnumMap[e]).toList(),
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

const _$GenderEnumMap = {
  Gender.male: 'male',
  Gender.female: 'female',
  Gender.other: 'other',
  Gender.unknown: 'unknown',
};
