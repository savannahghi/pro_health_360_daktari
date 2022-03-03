import 'dart:async';
import 'dart:convert';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:healthcloud/application/redux/actions/core/update_user_action.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/domain/core/entities/core/get_stream_token.dart';
import 'package:healthcloud/domain/core/entities/core/user.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:http/http.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart' as stream;

class ConnectGetStreamUserAction extends ReduxAction<AppState> {
  final stream.StreamChatClient streamClient;
  final IGraphQlClient client;
  final String endpoint;

  ConnectGetStreamUserAction({
    required this.streamClient,
    required this.client,
    required this.endpoint, 
  });

  @override
  Future<AppState?> reduce() async {
    streamClient.closeConnection();
    
    String staffID = state.staffState?.id ?? '';
    
    if (staffID.isEmpty || staffID == UNKNOWN) {
      staffID = defaultStreamUserID;
    }

    final Map<String, dynamic> variables = <String, dynamic>{
      'userID': staffID,
    };
    String streamToken = state.staffState?.user?.chatRoomToken ?? '';

    if (streamToken.isEmpty || streamToken == UNKNOWN) {
      
      final Response httpResponse = await client.callRESTAPI(
        endpoint: endpoint,
        method: httpPOST,
        variables: variables,
      );
      if (httpResponse.statusCode == 200) {
        final Map<String, dynamic> body =
            jsonDecode(httpResponse.body) as Map<String, dynamic>;

        final GetStreamToken result = GetStreamToken.fromJson(body);

        streamToken = result.getStreamToken ?? '';
      }
      dispatch(UpdateUserAction(user: User(chatRoomToken: streamToken)));
    }
    /// Set the current user. In a production scenario, this should be done using
    /// a backend to generate a user token using our server SDK.
    /// Please see the following for more information:
    /// https://getstream.io/chat/docs/flutter-dart/tokens_and_authentication/?language=dart
    try {
      await streamClient.connectUser(
        stream.User(id: staffID),
        streamToken,
      );
    } on stream.StreamWebSocketError catch (e) {
      final Response httpResponse = await client.callRESTAPI(
        endpoint: endpoint,
        method: httpPOST,
        variables: variables,
      );
      if (httpResponse.statusCode == 200) {
        final Map<String, dynamic> body =
            jsonDecode(httpResponse.body) as Map<String, dynamic>;

        final GetStreamToken result = GetStreamToken.fromJson(body);

        streamToken = result.getStreamToken ?? '';
      }
      dispatch(UpdateUserAction(user: User(chatRoomToken: streamToken)));
      try {
        await streamClient.connectUser(
          stream.User(id: staffID),
          streamToken,
        );
      } on stream.StreamWebSocketError catch (e) {
        Sentry.captureException(
          e,
          hint: e.message,
        );
      }
      Sentry.captureException(
        e,
        hint: e.message,
      );
    }
  }
}
