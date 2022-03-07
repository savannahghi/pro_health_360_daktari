// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_client_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RegisterClientPayload _$$_RegisterClientPayloadFromJson(
        Map<String, dynamic> json) =>
    _$_RegisterClientPayload(
      facility: json['facility'] as String?,
      clientType: $enumDecodeNullable(_$ClientTypeEnumMap, json['clientType']),
      clientName: json['clientName'] as String?,
      gender: genderFromJson(json['gender'] as String?),
      dateOfBirth: json['dateOfBirth'] == null
          ? null
          : DateTime.parse(json['dateOfBirth'] as String),
      phoneNumber: json['phoneNumber'] as String?,
      enrollmentDate: json['enrollmentDate'] == null
          ? null
          : DateTime.parse(json['enrollmentDate'] as String),
      cccNumber: json['cccNumber'] as String?,
      counselled: json['counselled'] as bool?,
      inviteClient: json['inviteClient'] as bool?,
    );

Map<String, dynamic> _$$_RegisterClientPayloadToJson(
        _$_RegisterClientPayload instance) =>
    <String, dynamic>{
      'facility': instance.facility,
      'clientType': _$ClientTypeEnumMap[instance.clientType],
      'clientName': instance.clientName,
      'gender': _$GenderEnumMap[instance.gender],
      'dateOfBirth': dobToJson(instance.dateOfBirth),
      'phoneNumber': instance.phoneNumber,
      'enrollmentDate': dobToJson(instance.enrollmentDate),
      'cccNumber': instance.cccNumber,
      'counselled': instance.counselled,
      'inviteClient': instance.inviteClient,
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
