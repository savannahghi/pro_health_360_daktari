import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'screening_question.freezed.dart';
part 'screening_question.g.dart';

@freezed
class ScreeningQuestion with _$ScreeningQuestion {
  factory ScreeningQuestion({
    String? questionText,
    String? answer,
  }) = _ScreeningQuestion;

  factory ScreeningQuestion.fromJson(Map<String, dynamic> json) =>
      _$ScreeningQuestionFromJson(json);

  factory ScreeningQuestion.initial() => ScreeningQuestion(
        questionText: UNKNOWN,
        answer: UNKNOWN,
      );
}
