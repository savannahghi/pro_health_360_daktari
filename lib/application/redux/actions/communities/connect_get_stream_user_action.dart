import 'dart:async';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:prohealth360_daktari/application/communities/stream_token_provider.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_enums.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
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
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(connectionFlag));
  }

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(connectionFlag));
    super.after();
  }

  @override
  Future<AppState?> reduce() async {
    final String staffId = state.staffState?.id ?? UNKNOWN;

    if (staffId.isEmpty || staffId == UNKNOWN) {
      throw const UserException(kindlyLogOutText);
    }

    if (streamClient.wsConnectionStatus == stream.ConnectionStatus.connected ||
        streamClient.wsConnectionStatus == stream.ConnectionStatus.connecting) {
      return null;
    }

    try {
      final StreamTokenProvider streamTokenProvider =
          StreamTokenProvider(client: client, endpoint: endpoint);

      final String? name = state.staffState?.user?.name;
      final String? username = state.staffState?.user?.username;
      final String? userId = state.staffState?.user?.userId;

      await streamClient.connectUserWithProvider(
        stream.User(
          id: staffId,
          name: name,
          extraData: <String, dynamic>{
            'username': username,
            'userType': describeEnum(StreamUserType.STAFF),
            'userID': userId,
          },
        ),
        streamTokenProvider.tokenProvider,
      );
    } on stream.StreamWebSocketError catch (e) {
      switch (e.errorCode) {
        case stream.ChatErrorCode.undefinedToken:
        case stream.ChatErrorCode.tokenExpired:
        case stream.ChatErrorCode.tokenBeforeIssuedAt:
        case stream.ChatErrorCode.tokenNotValid:
        case stream.ChatErrorCode.tokenSignatureInvalid:
          Sentry.captureException(e, hint: e.message);
          throw UserException(getErrorMessage());
        default:
          Sentry.captureException(e, hint: e.message);
      }
    } on stream.StreamChatError catch (e) {
      if (e.message.toLowerCase().contains('connection already in progress')) {
        return null;
      }
    } catch (e) {
      Sentry.captureException(e);
      throw UserException(getErrorMessage());
    }
    return null;
  }
}
