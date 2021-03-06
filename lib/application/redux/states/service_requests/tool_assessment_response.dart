import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prohealth360_daktari/application/redux/states/service_requests/tool_service_request_response.dart';

part 'tool_assessment_response.freezed.dart';
part 'tool_assessment_response.g.dart';

@freezed
class ToolAssessmentResponse with _$ToolAssessmentResponse {
  factory ToolAssessmentResponse({
    @JsonKey(name: 'clientName') String? name,
    @JsonKey(name: 'dateAnswered') String? date,
    @JsonKey(name: 'clientID') String? clientID,
    @JsonKey(name: 'getScreeningToolServiceRequestResponses')
        ToolAssessmentRequestResponse? toolAssessmentRequestResponse,
  }) = _ToolAssessmentResponse;

  factory ToolAssessmentResponse.fromJson(Map<String, dynamic> json) =>
      _$ToolAssessmentResponseFromJson(json);

  factory ToolAssessmentResponse.initial() => ToolAssessmentResponse(
        name: UNKNOWN,
        date: UNKNOWN,
        clientID: UNKNOWN,
        toolAssessmentRequestResponse: ToolAssessmentRequestResponse.initial(),
      );
}
