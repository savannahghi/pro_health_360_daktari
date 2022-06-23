import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:prohealth360_daktari/application/redux/actions/communities/update_communities_state_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/flagged_messages/delete_community_message_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/update_connectivity_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/states/connectivity_state.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

import '../../../../../mocks/mocks.dart';

void main() {
  group('DeleteCommunityMessageAction', () {
    late StoreTester<AppState> storeTester;

    setUp(() async {
      storeTester = StoreTester<AppState>(
        initialState: AppState.initial().copyWith(
          connectivityState: ConnectivityState(isConnected: true),
        ),
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );
      setupFirebaseAnalyticsMocks();
      await Firebase.initializeApp();
    });

    test('should update communities state', () async {
      storeTester.dispatch(
        UpdateCommunitiesStateAction(
          flaggedMessages: <Message>[
            Message(),
            Message(id: 'id-2'),
          ],
        ),
      );

      storeTester.dispatch(
        DeleteCommunityMessageAction(
          client: MockTestGraphQlClient(),
          messageID: 'id-2',
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(DeleteCommunityMessageAction);

      expect(
        info.state.staffState?.communitiesState?.flaggedMessages?.length,
        1,
      );
    });

    test('should not update state if error occurs during API call', () async {
      storeTester.dispatch(
        DeleteCommunityMessageAction(
          client: MockShortGraphQlClient.withResponse(
            'idToken',
            'endpoint',
            Response(
              json.encode(<String, dynamic>{'errors': 'error'}),
              201,
            ),
          ),
          messageID: 'message-id',
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(DeleteCommunityMessageAction);

      expect(
        (info.error! as UserException).msg,
        somethingWentWrongText,
      );
    });

    test('should return error if no connection', () async {
      String error = '';

      storeTester.dispatch(UpdateConnectivityAction(hasConnection: false));
      storeTester.dispatch(
        DeleteCommunityMessageAction(
          client: MockShortGraphQlClient.withResponse(
            'idToken',
            'endpoint',
            Response(
              json.encode(<String, dynamic>{'errors': 'error'}),
              201,
            ),
          ),
          messageID: 'message-id',
          onFailure: (String message) => error = message,
        ),
      );

      expect(error, '');

      await storeTester.waitUntil(DeleteCommunityMessageAction);

      expect(error, connectionLostText);
    });
  });
}
