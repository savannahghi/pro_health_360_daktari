import 'package:freezed_annotation/freezed_annotation.dart';

part 'assessment_question_response.freezed.dart';
part 'assessment_question_response.g.dart';

@freezed
class AssessmentQuestionResponse with _$AssessmentQuestionResponse {
  factory AssessmentQuestionResponse({
    @JsonKey(name: 'toolIndex') int? index,
    @JsonKey(name: 'tool') String? tool,
    @JsonKey(name: 'response') String? response,
  }) = _AssessmentQuestionResponse;

  factory AssessmentQuestionResponse.fromJson(Map<String, dynamic> json) =>
      _$AssessmentQuestionResponseFromJson(json);
}
