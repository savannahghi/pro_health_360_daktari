// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tool_assessment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ToolAssessmentResponse _$$_ToolAssessmentResponseFromJson(
        Map<String, dynamic> json) =>
    _$_ToolAssessmentResponse(
      name: json['clientName'] as String?,
      date: json['dateAnswered'] as String?,
      clientID: json['clientID'] as String?,
      toolAssessmentRequestResponse:
          json['getScreeningToolServiceRequestResponses'] == null
              ? null
              : ToolAssessmentRequestResponse.fromJson(
                  json['getScreeningToolServiceRequestResponses']
                      as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ToolAssessmentResponseToJson(
        _$_ToolAssessmentResponse instance) =>
    <String, dynamic>{
      'clientName': instance.name,
      'dateAnswered': instance.date,
      'clientID': instance.clientID,
      'getScreeningToolServiceRequestResponses':
          instance.toolAssessmentRequestResponse,
    };
