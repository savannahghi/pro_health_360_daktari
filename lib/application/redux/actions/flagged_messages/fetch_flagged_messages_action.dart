import 'dart:async';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart';
import 'package:mycarehubpro/application/core/graphql/queries.dart';
import 'package:mycarehubpro/application/redux/actions/communities/update_communities_state_action.dart';
import 'package:mycarehubpro/application/redux/actions/flags/app_flags.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/domain/core/entities/flagged_messages/flagged_messages_response.dart';
import 'package:mycarehubpro/domain/core/entities/flagged_messages/message_object.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class FetchFlaggedMessagesAction extends ReduxAction<AppState> {
  final IGraphQlClient client;
  final String communityCID;
  final List<String>? memberIDs;
  final void Function(String message)? onFailure;

  FetchFlaggedMessagesAction({
    required this.client,
    required this.communityCID,
    this.memberIDs,
    this.onFailure,
  });

  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(fetchFlaggedMessagesFlag));
  }

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(fetchFlaggedMessagesFlag));
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
      'communityCID': 'messaging:$communityCID',
    };

    final Response response = await client.query(
      listFlaggedMessagesQuery,
      variables,
    );
    client.close();

    final Map<String, dynamic> responseMap = client.toMap(response);

    final String? errors = parseError(responseMap);

    if (errors != null) {
      Sentry.captureException(UserException(errors));

      dispatch(
        UpdateCommunitiesStateAction(flaggedMessages: <Message>[]),
      );

      throw const UserException(somethingWentWrongText);
    }

    final FlaggedMessagesResponse flaggedMessagesMap =
        FlaggedMessagesResponse.fromJson(
      responseMap['data'] as Map<String, dynamic>,
    );

    final List<Message?>? messages = flaggedMessagesMap.messages
        ?.map((MessageObject? e) => e?.message)
        .toList();

    dispatch(
      UpdateCommunitiesStateAction(flaggedMessages: messages ?? <Message>[]),
    );

    return state;
  }
}
