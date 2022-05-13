import 'dart:async';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart';
import 'package:mycarehubpro/application/core/graphql/mutations.dart';
import 'package:mycarehubpro/application/core/graphql/queries.dart';
import 'package:mycarehubpro/application/redux/actions/flags/app_flags.dart';
import 'package:mycarehubpro/application/redux/actions/surveys/update_survey_state_action.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/domain/core/entities/surveys/client_configuration_payload.dart';
import 'package:mycarehubpro/domain/core/entities/surveys/survey.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class SendSurveysAction extends ReduxAction<AppState> {
  final IGraphQlClient client;
  final ClientConfigurationPayload clientConfigurationPayload;
  final void Function(String?)? onError;
  final void Function()? onSuccess;

  SendSurveysAction({
    required this.client,
    required this.clientConfigurationPayload,
    this.onError,
    this.onSuccess,
  });

  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(sendSurveysFlag));
  }

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(sendSurveysFlag));
    super.after();
  }

  @override
  Future<AppState?> reduce() async {
    final String facilityID = state.staffState?.defaultFacility ?? '';
    final Map<String, dynamic> filterParams =
        clientConfigurationPayload.toJson();

    final Map<String, dynamic> variables = <String, dynamic>{
      'facilityID': facilityID,
      'formID': '',
      'filterParams': filterParams,
    };

    final Response response = await client.query(
      sendClientSurveyLinksMutation,
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

    if (payLoad['data']['sendClientSurveyLinks'] == true) {
      onSuccess?.call();
    }

    return state;
  }

  @override
  Object? wrapError(dynamic error) {
    Sentry.captureException(error);
    return UserException(getErrorMessage());
  }
}
