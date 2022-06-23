import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prohealth360_daktari/application/redux/states/service_requests/tool_assessment_response.dart';
import 'package:prohealth360_daktari/domain/core/entities/service_requests/tool_type.dart';

part 'screening_tools_state.g.dart';
part 'screening_tools_state.freezed.dart';

@freezed
class ScreeningToolsState with _$ScreeningToolsState {
  factory ScreeningToolsState({
    @JsonKey(name: 'getAvailableFacilityScreeningTools')
        List<ToolType>? availableTools,
    @JsonKey(name: 'getAssessmentResponsesByToolType')
        List<ToolAssessmentResponse>? toolAssessmentResponses,
  }) = _ScreeningToolsState;

  factory ScreeningToolsState.fromJson(Map<String, dynamic> json) =>
      _$ScreeningToolsStateFromJson(json);

  factory ScreeningToolsState.initial() => ScreeningToolsState(
        toolAssessmentResponses: <ToolAssessmentResponse>[],
        availableTools: <ToolType>[],
      );
}
