// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'screening_questions_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ScreeningQuestionsList _$$_ScreeningQuestionsListFromJson(
        Map<String, dynamic> json) =>
    _$_ScreeningQuestionsList(
      name: json['name'] as String?,
      date: json['date'] as String?,
      screeningQuestionsList: (json['screeningQuestionsList'] as List<dynamic>?)
          ?.map((e) => ScreeningQuestion.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ScreeningQuestionsListToJson(
        _$_ScreeningQuestionsList instance) =>
    <String, dynamic>{
      'name': instance.name,
      'date': instance.date,
      'screeningQuestionsList': instance.screeningQuestionsList,
    };
