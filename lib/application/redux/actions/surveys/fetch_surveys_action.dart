import 'dart:async';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart';
import 'package:mycarehubpro/application/core/graphql/queries.dart';
import 'package:mycarehubpro/application/redux/actions/flags/app_flags.dart';
import 'package:mycarehubpro/application/redux/actions/surveys/update_survey_state_action.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/domain/core/entities/surveys/survey.dart';
import 'package:mycarehubpro/domain/core/entities/surveys/surveys_response.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class FetchSurveysAction extends ReduxAction<AppState> {
  final IGraphQlClient client;
  final void Function(String?)? onError;

  FetchSurveysAction({
    required this.client,
    this.onError,
  });

  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(fetchSurveysFlag));
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
      onError?.call(error);
      Sentry.captureException(
        error,
        hint: <String, dynamic>{
          'variables': variables,
          'query': listSurveysQuery,
          'response': response.body,
        },
      );
      dispatch(UpdateSurveyStateAction(surveys: <Survey>[]));
      return state;
    }

    final SurveysResponse surveysResponse = SurveysResponse.fromJson(
      payLoad['data'] as Map<String, dynamic>,
    );
    final List<Survey?>? surveys = surveysResponse.surveys;

    dispatch(UpdateSurveyStateAction(surveys: surveys));

    return state;
  }

  @override
  Object? wrapError(dynamic error) {
    Sentry.captureException(error);
    return UserException(getErrorMessage());
  }
}
