import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tool_assessment_response.freezed.dart';
part 'tool_assessment_response.g.dart';

@freezed
class ToolAssessmentResponse with _$ToolAssessmentResponse {
  factory ToolAssessmentResponse({
    @JsonKey(name: 'clientName') String? name,
    @JsonKey(name: 'dateAnswered') String? date,
    @JsonKey(name: 'clientID') String? clientID,
  }) = _ToolAssessmentResponse;

  factory ToolAssessmentResponse.fromJson(Map<String, dynamic> json) =>
      _$ToolAssessmentResponseFromJson(json);

  factory ToolAssessmentResponse.initial() => ToolAssessmentResponse(
        name: UNKNOWN,
        date: UNKNOWN,
        clientID: UNKNOWN,
      );
}
