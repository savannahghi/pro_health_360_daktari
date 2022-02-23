// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_group_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CreateGroupPayload _$_$_CreateGroupPayloadFromJson(
    Map<String, dynamic> json) {
  return _$_CreateGroupPayload(
    name: json['name'] as String?,
    description: json['description'] as String?,
    ageRange: json['ageRange'] == null
        ? null
        : AgeRange.fromJson(json['ageRange'] as Map<String, dynamic>),
    gender: (json['gender'] as List<dynamic>?)
        ?.map((e) => _$enumDecode(_$GenderEnumMap, e))
        .toList(),
    clientType: (json['clientType'] as List<dynamic>?)
        ?.map((e) => _$enumDecode(_$ClientTypeEnumMap, e))
        .toList(),
    inviteOnly: json['inviteOnly'] as bool?,
  );
}

Map<String, dynamic> _$_$_CreateGroupPayloadToJson(
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

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

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
