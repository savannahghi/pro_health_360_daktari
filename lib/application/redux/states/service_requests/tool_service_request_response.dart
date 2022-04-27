import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mycarehubpro/application/redux/states/service_requests/assessment_question_response.dart';

part 'tool_service_request_response.freezed.dart';
part 'tool_service_request_response.g.dart';

@freezed
class ToolAssessmentRequestResponse with _$ToolAssessmentRequestResponse {
  factory ToolAssessmentRequestResponse({
    @JsonKey(name: 'serviceRequestID') String? serviceRequestID,
    @JsonKey(name: 'clientContact') String? phoneNumber,
    @JsonKey(name: 'screeningToolResponses')
        List<AssessmentQuestionResponse>? questionsResponses,
  }) = _ToolAssessmentRequestResponse;

  factory ToolAssessmentRequestResponse.fromJson(Map<String, dynamic> json) =>
      _$ToolAssessmentRequestResponseFromJson(json);

  factory ToolAssessmentRequestResponse.initial() =>
      ToolAssessmentRequestResponse(
        serviceRequestID: UNKNOWN,
        phoneNumber: UNKNOWN,
        questionsResponses: <AssessmentQuestionResponse>[],
      );
}
