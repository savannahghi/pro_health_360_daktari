// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'survey_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SurveyState _$$_SurveyStateFromJson(Map<String, dynamic> json) =>
    _$_SurveyState(
      surveys: (json['listSurveys'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Survey.fromJson(e as Map<String, dynamic>))
          .toList(),
      errorFetchingSurveys: json['errorFetchingSurveys'] as bool?,
    );

Map<String, dynamic> _$$_SurveyStateToJson(_$_SurveyState instance) =>
    <String, dynamic>{
      'listSurveys': instance.surveys,
      'errorFetchingSurveys': instance.errorFetchingSurveys,
    };
