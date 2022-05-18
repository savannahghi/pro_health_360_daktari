import 'package:async_redux/async_redux.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/domain/core/entities/surveys/survey.dart';

class SurveysViewModel extends Vm {
  final Wait? wait;
  final List<Survey?>? surveys;
  final bool? errorFetchingSurveys;

  SurveysViewModel({
    required this.wait,
    required this.surveys,
    required this.errorFetchingSurveys,
  }) : super(equals: <Object?>[surveys, wait, errorFetchingSurveys]);

  static SurveysViewModel fromStore(Store<AppState> store) {
    return SurveysViewModel(
      wait: store.state.wait,
      surveys: store.state.surveyState?.surveys,
      errorFetchingSurveys: store.state.surveyState?.errorFetchingSurveys,
    );
  }
}
