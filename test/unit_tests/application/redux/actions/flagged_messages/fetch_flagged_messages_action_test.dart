import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mycarehubpro/application/redux/actions/flagged_messages/fetch_flagged_messages_action.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/application/redux/states/connectivity_state.dart';
import 'package:mycarehubpro/domain/core/entities/flagged_messages/flagged_message.dart';

import '../../../../../mocks/mocks.dart';

void main() {
  group('FetchFlaggedMessagesAction', () {
    late StoreTester<AppState> storeTester;

    setUp(() {
      storeTester = StoreTester<AppState>(
        initialState: AppState.initial().copyWith(
          connectivityState: ConnectivityState(isConnected: true),
        ),
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );
    });

    test('should update communities state', () async {
      storeTester.dispatch(
        FetchFlaggedMessagesAction(client: MockTestGraphQlClient()),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(FetchFlaggedMessagesAction);

      expect(
        info.state.staffState?.communitiesState?.flaggedMessages?.length,
        2,
      );
    });

    test('should not update state if error occurs during API call', () async {
      storeTester.dispatch(
        FetchFlaggedMessagesAction(
          client: MockShortGraphQlClient.withResponse(
            'idToken',
            'endpoint',
            Response(
              json.encode(<String, dynamic>{'errors': 'error'}),
              201,
            ),
          ),
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(FetchFlaggedMessagesAction);

      expect(
        info.state.staffState?.communitiesState?.flaggedMessages,
        <FlaggedMessage>[],
      );
    });
  });
}
