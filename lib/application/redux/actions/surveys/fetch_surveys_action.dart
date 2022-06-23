import 'dart:async';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart';
import 'package:prohealth360_daktari/application/core/graphql/queries.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/actions/surveys/update_survey_state_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/states/survey_state.dart';
import 'package:prohealth360_daktari/domain/core/entities/surveys/survey.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class FetchSurveysAction extends ReduxAction<AppState> {
  final IGraphQlClient client;

  FetchSurveysAction({
    required this.client,
  });

  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(fetchSurveysFlag));

    dispatch(UpdateSurveyStateAction(errorFetchingSurveys: false));
  }

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(fetchSurveysFlag));
    super.after();
  }

  @override
  Future<AppState?> reduce() async {
    final Map<String, dynamic> variables = <String, dynamic>{'projectID': 2};

    final Response response = await client.query(
      listSurveysQuery,
      variables,
    );
    client.close();

    final Map<String, dynamic> payLoad = client.toMap(response);

    final String? error = parseError(payLoad);

    if (error != null) {
      Sentry.captureException(
        error,
        hint: <String, dynamic>{
          'variables': variables,
          'query': listSurveysQuery,
          'response': response.body,
        },
      );
      dispatch(UpdateSurveyStateAction(errorFetchingSurveys: true));
      return state;
    }

    final SurveyState surveyState = SurveyState.fromJson(
      payLoad['data'] as Map<String, dynamic>,
    );
    final List<Survey?>? surveys = surveyState.surveys;

    dispatch(UpdateSurveyStateAction(surveys: surveys));

    return state;
  }

  @override
  Object? wrapError(dynamic error) {
    Sentry.captureException(error);
    return UserException(getErrorMessage());
  }
}
