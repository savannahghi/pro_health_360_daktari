// Dart imports:
import 'dart:async';

// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:healthcloud/application/core/graphql/mutations.dart';
import 'package:healthcloud/application/redux/actions/flags/app_flags.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:http/http.dart' as http;
import 'package:sentry_flutter/sentry_flutter.dart';

/// [CompleteOnboardingTourAction] is a Redux Action whose job is to update a
/// users onboarding tour completion status. Otherwise delightfully notify the
/// user of any Error that might occur during the process
class CompleteOnboardingTourAction extends ReduxAction<AppState> {
  CompleteOnboardingTourAction({
    required this.userID,
    required this.client,
  });

  final String? userID;
  final IGraphQlClient client;

  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(setNickNameFlag));
  }

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(setNickNameFlag));
    super.after();
  }

  @override
  Future<AppState> reduce() async {
    final Map<String, String?> variables = <String, String?>{
      'userID': userID,
      'flavour': Flavour.pro.name,
    };

    final http.Response result = await client.query(
      completeOnboardingTourMutation,
      variables,
    );

    final Map<String, dynamic> body = client.toMap(result);
    client.close();

    final String? errors = client.parseError(body);
    if (errors != null) {
      Sentry.captureException(
        UserException(errors),
      );

      throw UserException(getErrorMessage('completing the onbaording tour'));
    }

    return state;
  }
}
