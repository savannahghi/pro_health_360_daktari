// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'surveys_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SurveysResponse _$$_SurveysResponseFromJson(Map<String, dynamic> json) =>
    _$_SurveysResponse(
      surveys: (json['listSurveys'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Survey.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_SurveysResponseToJson(_$_SurveysResponse instance) =>
    <String, dynamic>{
      'listSurveys': instance.surveys,
    };
