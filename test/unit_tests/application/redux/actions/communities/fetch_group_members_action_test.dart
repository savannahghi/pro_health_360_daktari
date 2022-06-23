import 'dart:convert';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:prohealth360_daktari/application/redux/actions/communities/fetch_group_members_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:http/http.dart';

import '../../../../../mocks/mocks.dart';
import 'fetch_group_members_action_test.mocks.dart';

@GenerateMocks(<Type>[IGraphQlClient])
void main() {
  group('FetchGroupMembersAction', () {
    late StoreTester<AppState> storeTester;

    setUp(() {
      storeTester = StoreTester<AppState>(
        initialState: AppState.initial(),
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );
    });

    test('should complete normally', () async {
      final MockShortGraphQlClient client = MockShortGraphQlClient.withResponse(
        '',
        '',
        Response(
          jsonEncode(<String, dynamic>{'data': groupStateMock}),
          200,
        ),
      );

      storeTester.dispatch(
        FetchGroupMembersAction(client: client, channelId: 'channel-id'),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(FetchGroupMembersAction);

      expect(info.state.miscState?.groupState?.groupMembers?.length, 1);
    });

    test('should handle api error', () async {
      final MockShortGraphQlClient client = MockShortGraphQlClient.withResponse(
        '',
        '',
        Response(
          jsonEncode(<String, dynamic>{'error': 'error'}),
          200,
        ),
      );

      int errors = 0;

      storeTester.dispatch(
        FetchGroupMembersAction(
          client: client,
          channelId: 'channel-id',
          onError: (_) => errors++,
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(FetchGroupMembersAction);

      expect(info.state.miscState?.groupState?.groupMembers?.length, 0);
      expect(errors, 1);
    });

    test('should handle exception', () async {
      final MockIGraphQlClient client = MockIGraphQlClient();

      when(
        client.query(any, any),
      ).thenThrow(MyAfyaException(cause: 'cause', message: 'message'));

      storeTester.dispatch(
        FetchGroupMembersAction(client: client, channelId: 'channel-id'),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(FetchGroupMembersAction);

      expect(info.errors.removeFirst().msg, getErrorMessage());
    });
  });
}
