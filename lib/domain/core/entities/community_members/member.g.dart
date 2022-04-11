// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Member _$$_MemberFromJson(Map<String, dynamic> json) => _$_Member(
      id: json['id'] as String?,
      userID: json['userID'] as String?,
      role: json['role'] as String?,
      username: json['username'] as String?,
      gender: genderFromJson(json['gender'] as String?),
      banStatus: json['extraData'] == null
          ? null
          : BanStatus.fromJson(json['extraData'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_MemberToJson(_$_Member instance) => <String, dynamic>{
      'id': instance.id,
      'userID': instance.userID,
      'role': instance.role,
      'username': instance.username,
      'gender': genderToJson(instance.gender),
      'extraData': instance.banStatus,
    };
