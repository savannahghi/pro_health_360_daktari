// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mycarehubpro/domain/core/entities/surveys/survey.dart';

part 'survey_state.freezed.dart';
part 'survey_state.g.dart';

@freezed
class SurveyState with _$SurveyState {
  factory SurveyState({
    List<Survey?>? surveys,
  }) = _SurveyState;

  factory SurveyState.fromJson(Map<String, dynamic> json) =>
      _$SurveyStateFromJson(json);

  factory SurveyState.initial() => SurveyState(
        surveys: <Survey>[],
      );
}
