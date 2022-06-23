import 'package:async_redux/async_redux.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/states/survey_state.dart';
import 'package:prohealth360_daktari/domain/core/entities/surveys/survey.dart';

class UpdateSurveyStateAction extends ReduxAction<AppState> {
  final List<Survey?>? surveys;

  final bool? errorFetchingSurveys;

  UpdateSurveyStateAction({
    this.surveys,
    this.errorFetchingSurveys,
  });

  @override
  AppState reduce() {
    final SurveyState? surveyState = state.surveyState?.copyWith(
      surveys: surveys ?? state.surveyState?.surveys,
      errorFetchingSurveys:
          errorFetchingSurveys ?? state.surveyState?.errorFetchingSurveys,
    );

    final AppState newState = state.copyWith(
      surveyState: surveyState,
    );

    return newState;
  }
}
