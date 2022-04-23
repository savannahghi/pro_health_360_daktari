// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tool_service_request_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ToolAssessmentRequestResponse _$$_ToolAssessmentRequestResponseFromJson(
        Map<String, dynamic> json) =>
    _$_ToolAssessmentRequestResponse(
      serviceRequestID: json['serviceRequestID'] as String?,
      questionsResponses: (json['screeningToolResponses'] as List<dynamic>?)
          ?.map((e) =>
              AssessmentQuestionResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ToolAssessmentRequestResponseToJson(
        _$_ToolAssessmentRequestResponse instance) =>
    <String, dynamic>{
      'serviceRequestID': instance.serviceRequestID,
      'screeningToolResponses': instance.questionsResponses,
    };
