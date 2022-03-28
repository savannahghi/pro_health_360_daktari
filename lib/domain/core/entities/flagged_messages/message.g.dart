// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Message _$$_MessageFromJson(Map<String, dynamic> json) => _$_Message(
      messageID: json['id'] as String?,
      text: json['text'] as String?,
      createdAt: json['createdAt'] as String?,
      user: json['user'] == null
          ? null
          : FlaggedMessageUser.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_MessageToJson(_$_Message instance) =>
    <String, dynamic>{
      'id': instance.messageID,
      'text': instance.text,
      'createdAt': instance.createdAt,
      'user': instance.user,
    };
