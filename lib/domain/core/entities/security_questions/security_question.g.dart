// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'security_question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SecurityQuestion _$SecurityQuestionFromJson(Map<String, dynamic> json) {
  return SecurityQuestion(
    active: json['active'] as bool,
    sequence: json['sequence'] as int?,
    description: json['description'] as String?,
    id: json['id'] as String,
    questionStem: json['questionStem'] as String,
    responseType: json['responseType'] as String?,
    flavour: json['flavour'] as String?,
  );
}

Map<String, dynamic> _$SecurityQuestionToJson(SecurityQuestion instance) =>
    <String, dynamic>{
      'id': instance.id,
      'questionStem': instance.questionStem,
      'description': instance.description,
      'responseType': instance.responseType,
      'flavour': instance.flavour,
      'active': instance.active,
      'sequence': instance.sequence,
    };
