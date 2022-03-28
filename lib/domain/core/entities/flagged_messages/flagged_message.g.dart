// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flagged_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FlaggedMessage _$$_FlaggedMessageFromJson(Map<String, dynamic> json) =>
    _$_FlaggedMessage(
      message: json['message'] == null
          ? null
          : Message.fromJson(json['message'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_FlaggedMessageToJson(_$_FlaggedMessage instance) =>
    <String, dynamic>{
      'message': instance.message,
    };
