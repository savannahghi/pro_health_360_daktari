// Dart imports:
import 'dart:async';

// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:prohealth360_daktari/application/core/graphql/queries.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:http/http.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

/// [InviteMembersAction] is a Redux Action whose job is to invite members to a
/// specific community group. Otherwise delightfully notify user of any Error
/// that might occur during the process.
class InviteMembersAction extends ReduxAction<AppState> {
  InviteMembersAction({
    required this.client,
    required this.variables,
    this.onFailure,
    this.onSuccess,
  });

  final IGraphQlClient client;
  final Map<String, dynamic> variables;
  final void Function(String message)? onFailure;
  final VoidCallback? onSuccess;

  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(inviteMembersFlag));
  }

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(inviteMembersFlag));
    super.after();
  }

  @override
  Future<AppState?> reduce() async {
    final bool hasConnection = state.connectivityState?.isConnected ?? false;
    if (!hasConnection) {
      onFailure?.call('connection failure');
      return null;
    }

    final Response response =
        await client.query(inviteMembersToCommunityQuery, variables);

    final ProcessedResponse processedResponse = processHttpResponse(response);

    if (processedResponse.ok) {
      final Map<String, dynamic> body = client.toMap(response);
      client.close();

      final String? errors = client.parseError(body);

      if (errors != null) {
        Sentry.captureException(UserException(errors));

        throw UserException(getErrorMessage('inviting members'));
      }

      if (body['data']['inviteMembersToCommunity'] == true) {
        onSuccess?.call();
      }
    } else {
      throw UserException(processedResponse.message);
    }

    return null;
  }
}
