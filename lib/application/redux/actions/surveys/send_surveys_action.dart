import 'dart:async';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart';
import 'package:mycarehubpro/application/core/graphql/mutations.dart';
import 'package:mycarehubpro/application/core/graphql/queries.dart';
import 'package:mycarehubpro/application/redux/actions/flags/app_flags.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class SendSurveysAction extends ReduxAction<AppState> {
  final IGraphQlClient client;
  final Map<String, dynamic> variables;
  final void Function(String?)? onError;
  final VoidCallback? onSuccess;

  SendSurveysAction({
    required this.client,
    required this.variables, 
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
      return null;
    }
    if (payLoad['data']['sendClientSurveyLinks'] == true) {
      onSuccess?.call();
      return state;
    }
    onError?.call(getErrorMessage('sending surveys'));
    return null;
  }
}
