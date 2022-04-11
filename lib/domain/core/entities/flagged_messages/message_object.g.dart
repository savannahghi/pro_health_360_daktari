// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MessageObject _$$_MessageObjectFromJson(Map<String, dynamic> json) =>
    _$_MessageObject(
      message: json['message'] == null
          ? null
          : Message.fromJson(json['message'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_MessageObjectToJson(_$_MessageObject instance) =>
    <String, dynamic>{
      'message': instance.message,
    };
