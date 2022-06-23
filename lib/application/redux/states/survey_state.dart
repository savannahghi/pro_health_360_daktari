// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prohealth360_daktari/domain/core/entities/surveys/survey.dart';

part 'survey_state.freezed.dart';
part 'survey_state.g.dart';

@freezed
class SurveyState with _$SurveyState {
  factory SurveyState({
    @JsonKey(name: 'listSurveys') List<Survey?>? surveys,
    bool? errorFetchingSurveys,
  }) = _SurveyState;

  factory SurveyState.fromJson(Map<String, dynamic> json) =>
      _$SurveyStateFromJson(json);

  factory SurveyState.initial() => SurveyState(
        surveys: <Survey>[],
        errorFetchingSurveys: false,
      );
}
