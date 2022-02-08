// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_client_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RegisterClientPaylod _$_$_RegisterClientPaylodFromJson(
    Map<String, dynamic> json) {
  return _$_RegisterClientPaylod(
    facility: json['facility'] as String?,
    clientType: _$enumDecodeNullable(_$ClientTypeEnumMap, json['clientType']),
    clientName: json['clientName'] as String?,
    gender: _$enumDecodeNullable(_$GenderEnumMap, json['gender']),
    dateOfBirth: json['dateOfBirth'] == null
        ? null
        : DateTime.parse(json['dateOfBirth'] as String),
    phoneNumber: json['phoneNumber'] as String?,
    enrollmentDate: json['enrollmentDate'] == null
        ? null
        : DateTime.parse(json['enrollmentDate'] as String),
    cccNumber: json['cccNumber'] as String?,
    counselled: json['counselled'] as bool?,
  );
}

Map<String, dynamic> _$_$_RegisterClientPaylodToJson(
        _$_RegisterClientPaylod instance) =>
    <String, dynamic>{
      'facility': instance.facility,
      'clientType': _$ClientTypeEnumMap[instance.clientType],
      'clientName': instance.clientName,
      'gender': _$GenderEnumMap[instance.gender],
      'dateOfBirth': instance.dateOfBirth?.toIso8601String(),
      'phoneNumber': instance.phoneNumber,
      'enrollmentDate': instance.enrollmentDate?.toIso8601String(),
      'cccNumber': instance.cccNumber,
      'counselled': instance.counselled,
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

K? _$enumDecodeNullable<K, V>(
  Map<K, V> enumValues,
  dynamic source, {
  K? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<K, V>(enumValues, source, unknownValue: unknownValue);
}

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
  Gender.unknown: 'unknown',
};
