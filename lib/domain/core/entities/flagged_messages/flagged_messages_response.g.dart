// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flagged_messages_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FlaggedMessagesResponse _$$_FlaggedMessagesResponseFromJson(
        Map<String, dynamic> json) =>
    _$_FlaggedMessagesResponse(
      messages: (json['listFlaggedMessages'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : MessageObject.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_FlaggedMessagesResponseToJson(
        _$_FlaggedMessagesResponse instance) =>
    <String, dynamic>{
      'listFlaggedMessages': instance.messages,
    };
