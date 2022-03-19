// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_staff_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RegisterStaffPayload _$$_RegisterStaffPayloadFromJson(
        Map<String, dynamic> json) =>
    _$_RegisterStaffPayload(
      facility: json['facility'] as String?,
      staffName: json['staffName'] as String?,
      gender: genderFromJson(json['gender'] as String?),
      phoneNumber: json['phoneNumber'] as String?,
      idNumber: json['idNumber'] as String?,
      staffNumber: json['staffNumber'] as String?,
      role: roleFromJson(json['staffRoles'] as String?),
      inviteStaff: json['inviteStaff'] as bool?,
      dateOfBirth: json['dateOfBirth'] == null
          ? null
          : DateTime.parse(json['dateOfBirth'] as String),
    );

Map<String, dynamic> _$$_RegisterStaffPayloadToJson(
        _$_RegisterStaffPayload instance) =>
    <String, dynamic>{
      'facility': instance.facility,
      'staffName': instance.staffName,
      'gender': _$GenderEnumMap[instance.gender],
      'phoneNumber': instance.phoneNumber,
      'idNumber': instance.idNumber,
      'staffNumber': instance.staffNumber,
      'staffRoles': _$RoleEnumMap[instance.role],
      'inviteStaff': instance.inviteStaff,
      'dateOfBirth': dobToJson(instance.dateOfBirth),
    };

const _$GenderEnumMap = {
  Gender.male: 'male',
  Gender.female: 'female',
  Gender.other: 'other',
  Gender.unknown: 'unknown',
};

const _$RoleEnumMap = {
  Role.SYSTEM_ADMINISTRATOR: 'SYSTEM_ADMINISTRATOR',
  Role.COMMUNITY_MANAGEMENT: 'COMMUNITY_MANAGEMENT',
  Role.CONTENT_MANAGEMENT: 'CONTENT_MANAGEMENT',
  Role.CLIENT_MANAGEMENT: 'CLIENT_MANAGEMENT',
};