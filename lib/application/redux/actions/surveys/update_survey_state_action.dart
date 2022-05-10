import 'package:async_redux/async_redux.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/application/redux/states/survey_state.dart';
import 'package:mycarehubpro/domain/core/entities/surveys/survey.dart';

class UpdateSurveyStateAction extends ReduxAction<AppState> {
  final List<Survey?>? surveys;

  UpdateSurveyStateAction({this.surveys});

  @override
  AppState reduce() {
    final SurveyState? surveyState =
        state.surveyState?.copyWith(surveys: surveys);

    final AppState newState = state.copyWith(
      surveyState: surveyState,
    );

    return newState;
  }
}
