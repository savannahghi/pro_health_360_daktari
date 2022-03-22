// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Member _$$_MemberFromJson(Map<String, dynamic> json) => _$_Member(
      id: json['ID'] as String?,
      userID: json['userID'] as String?,
      role: json['role'] as String?,
      username: json['name'] as String?,
      gender: genderFromJson(json['gender'] as String?),
    );

Map<String, dynamic> _$$_MemberToJson(_$_Member instance) => <String, dynamic>{
      'ID': instance.id,
      'userID': instance.userID,
      'role': instance.role,
      'name': instance.username,
      'gender': genderToJson(instance.gender),
    };
