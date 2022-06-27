import 'dart:async';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart';
import 'package:prohealth360_daktari/application/core/graphql/mutations.dart';
import 'package:prohealth360_daktari/application/redux/actions/communities/update_communities_state_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class DeleteCommunityMessageAction extends ReduxAction<AppState> {
  final IGraphQlClient client;
  final String messageID;
  final void Function(String message)? onFailure;
  final VoidCallback? onSuccess;

  DeleteCommunityMessageAction({
    required this.client,
    required this.messageID,
    this.onFailure,
    this.onSuccess,
  });

  @override
  void before() {
    super.before();
    dispatch(
      WaitAction<AppState>.add('${deleteCommunityMessageFlag}_$messageID'),
    );
  }

  @override
  void after() {
    dispatch(
      WaitAction<AppState>.remove('${deleteCommunityMessageFlag}_$messageID'),
    );
    super.after();
  }

  @override
  Future<AppState?> reduce() async {
    final bool hasConnection = state.connectivityState?.isConnected ?? false;
    if (!hasConnection) {
      onFailure?.call(connectionLostText);
      return null;
    }

    final Map<String, dynamic> variables = <String, dynamic>{
      'messageID': messageID,
    };

    final Response response = await client.query(
      deleteCommunityMessageMutation,
      variables,
    );
    client.close();

    final Map<String, dynamic> responseMap = client.toMap(response);

    final String? errors = parseError(responseMap);

    if (errors != null) {
      Sentry.captureException(UserException(errors));
      throw const UserException(somethingWentWrongText);
    }

    final Map<String, dynamic>? data =
        responseMap['data'] as Map<String, dynamic>?;

    if (data?['deleteCommunityMessage'] == true) {
      final List<Message?>? messages =
          state.staffState?.communitiesState?.flaggedMessages;
      messages?.removeWhere((Message? message) => message?.id == messageID);

      dispatch(
        UpdateCommunitiesStateAction(flaggedMessages: messages),
      );
      onSuccess?.call();
    }

    return state;
  }
}
