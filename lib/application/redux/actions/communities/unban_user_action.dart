import 'dart:async';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart';
import 'package:prohealth360_daktari/application/core/graphql/mutations.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class UnBanUserAction extends ReduxAction<AppState> {
  final IGraphQlClient client;
  final String memberID;
  final VoidCallback? onError;
  final VoidCallback? onSuccess;
  final String? communityID;

  UnBanUserAction({
    required this.client,
    required this.memberID,
    this.onError,
    this.onSuccess,
    required this.communityID,
  });

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(unBanUserFlag));
    super.after();
  }

  @override
  void before() {
    dispatch(WaitAction<AppState>.add(unBanUserFlag));
    super.before();
  }

  @override
  Future<AppState?> reduce() async {
    final Map<String, dynamic> variables = <String, dynamic>{
      'memberID': memberID,
      'communityID': communityID ?? '',
    };

    final Response response = await client.query(
      unBanUserMutation,
      variables,
    );
    client.close();

    final Map<String, dynamic> payLoad = client.toMap(response);

    final String? error = parseError(payLoad);
    if (error != null) {
      onError?.call();

      return null;
    }

    final Map<String, dynamic>? data = payLoad['data'] as Map<String, dynamic>?;

    if (data?['unBanUser'] == true) {
      onSuccess?.call();
      return state;
    } else {
      onError?.call();
    }
    return null;
  }

  @override
  Object? wrapError(dynamic error) {
    Sentry.captureException(error);
    return UserException(getErrorMessage());
  }
}
