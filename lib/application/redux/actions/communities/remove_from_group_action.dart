import 'dart:async';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart';
import 'package:mycarehubpro/application/core/graphql/mutations.dart';
import 'package:mycarehubpro/application/redux/actions/flags/app_flags.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class RemoveFromGroupAction extends ReduxAction<AppState> {
  RemoveFromGroupAction({
    required this.memberID,
    required this.communityID,
    required this.client,
    required this.onSuccess,
    required this.onFailure,
  });

  final String communityID;
  final String memberID;
  final IGraphQlClient client;
  final VoidCallback? onSuccess;
  final VoidCallback? onFailure;

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(removeFromGroupFlag));
    super.after();
  }

  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(removeFromGroupFlag));
  }

  @override
  Future<AppState?> reduce() async {
    final Map<String, dynamic> variables = <String, dynamic>{
      'communityID': communityID,
      'memberIDs': <String>[memberID],
    };

    final Response response =
        await client.query(removeFromGroupMutation, variables);

    final ProcessedResponse processedResponse = processHttpResponse(response);

    if (processedResponse.ok) {
      final Map<String, dynamic> body = client.toMap(response);

      client.close();

      final String? errors = client.parseError(body);

      if (errors != null) {
        Sentry.captureException(
          UserException(errors),
        );

        throw UserException(getErrorMessage('removing user from group'));
      }

      if (body['data'] != null &&
          body['data']['removeMembersFromCommunity'] != null &&
          body['data']['removeMembersFromCommunity'] is bool &&
          body['data']['removeMembersFromCommunity'] == true) {
        onSuccess?.call();
      } else {
        onFailure?.call();
      }
    } else {
      throw UserException(processedResponse.message);
    }
  }
}
