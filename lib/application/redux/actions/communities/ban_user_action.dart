import 'dart:async';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart';
import 'package:mycarehubpro/application/core/graphql/mutations.dart';
import 'package:mycarehubpro/application/redux/actions/flags/app_flags.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class BanUserAction extends ReduxAction<AppState> {
  final IGraphQlClient client;
  final String memberID;
  final VoidCallback? onError;
  final VoidCallback? onSuccess;
  final String? communityID;

  BanUserAction({
    required this.client,
    required this.memberID,
    this.onError,
    this.onSuccess,
    required this.communityID,
  });

  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add('${banUserFlag}_$memberID'));
  }

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove('${banUserFlag}_$memberID'));
    super.after();
  }

  @override
  Future<AppState?> reduce() async {
    final String staffID = state.staffState?.id ?? '';
    final Map<String, dynamic> variables = <String, dynamic>{
      'memberID': memberID,
      'bannedBy': staffID,
      'communityID': communityID ?? '',
    };

    final Response response = await client.query(
      banUserMutation,
      variables,
    );
    client.close();

    final Map<String, dynamic> payLoad = client.toMap(response);

    final String? error = parseError(payLoad);
    if (error != null) {
      onError?.call();

      return null;
    }

    if (payLoad['data']['banUser'] == true) {
      onSuccess?.call();
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
