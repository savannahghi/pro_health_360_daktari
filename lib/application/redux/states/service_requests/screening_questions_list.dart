import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mycarehubpro/application/redux/states/service_requests/screening_question.dart';

part 'screening_questions_list.freezed.dart';
part 'screening_questions_list.g.dart';

@freezed
class ScreeningQuestionsList with _$ScreeningQuestionsList {
  factory ScreeningQuestionsList({
    String? name,
    String? date,
    List<ScreeningQuestion>? screeningQuestionsList,
  }) = _ScreeningQuestionsList;

  factory ScreeningQuestionsList.fromJson(Map<String, dynamic> json) =>
      _$ScreeningQuestionsListFromJson(json);

  factory ScreeningQuestionsList.initial() => ScreeningQuestionsList(
        name: UNKNOWN,
        date: UNKNOWN,
        screeningQuestionsList: <ScreeningQuestion>[],
      );
}
