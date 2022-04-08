// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'screening_tools_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ScreeningToolsState _$$_ScreeningToolsStateFromJson(
        Map<String, dynamic> json) =>
    _$_ScreeningToolsState(
      availableTools:
          (json['getAvailableFacilityScreeningTools'] as List<dynamic>?)
              ?.map((e) => ToolType.fromJson(e as Map<String, dynamic>))
              .toList(),
      toolAssessmentResponses: (json['getAssessmentResponsesByToolType']
              as List<dynamic>?)
          ?.map(
              (e) => ToolAssessmentResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ScreeningToolsStateToJson(
        _$_ScreeningToolsState instance) =>
    <String, dynamic>{
      'getAvailableFacilityScreeningTools': instance.availableTools,
      'getAssessmentResponsesByToolType': instance.toolAssessmentResponses,
    };
