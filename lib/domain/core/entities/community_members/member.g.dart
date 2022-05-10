// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Member _$$_MemberFromJson(Map<String, dynamic> json) => _$_Member(
      id: json['id'] as String?,
      userID: json['userID'] as String?,
      role: json['role'] as String?,
      userType: json['userType'] as String?,
      username: json['username'] as String?,
      gender: $enumDecodeNullable(_$GenderEnumMap, json['gender']),
      banStatus: json['extraData'] == null
          ? null
          : BanStatus.fromJson(json['extraData'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_MemberToJson(_$_Member instance) => <String, dynamic>{
      'id': instance.id,
      'userID': instance.userID,
      'role': instance.role,
      'userType': instance.userType,
      'username': instance.username,
      'gender': _$GenderEnumMap[instance.gender],
      'extraData': instance.banStatus,
    };

const _$GenderEnumMap = {
  Gender.male: 'male',
  Gender.female: 'female',
  Gender.other: 'other',
  Gender.unknown: 'unknown',
};
