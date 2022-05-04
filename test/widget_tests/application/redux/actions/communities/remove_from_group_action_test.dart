import 'dart:convert';
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mycarehubpro/application/redux/actions/communities/remove_from_group_action.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/application/redux/states/connectivity_state.dart';

import '../../../../../mocks/mocks.dart';

void main() {
  group('RemoveFromGroupAction', () {
    late StoreTester<AppState> storeTester;

    setUp(() {
      storeTester = StoreTester<AppState>(
        initialState: AppState.initial()
            .copyWith(connectivityState: ConnectivityState(isConnected: true)),
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );
    });

    test('should throw error if api call is not 200', () async {
      final MockShortGraphQlClient mockShortSILGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        http.Response(
          json.encode(<String, dynamic>{
            'errors': <Object>[
              <String, dynamic>{
                'message': '4: error',
              }
            ]
          }),
          401,
        ),
      );
      storeTester.dispatch(
        RemoveFromGroupAction(
          client: mockShortSILGraphQlClient,
          onSuccess: () {},
          communityID: '',
          memberID: '',
          onFailure: () {},
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(RemoveFromGroupAction);

      expect(
        (info.error! as UserException).msg,
        'Sorry, an unknown error occurred, please try again or get help from our '
        'help center.',
      );
    });

    test('should throw error if response has error', () async {
      final MockShortGraphQlClient mockShortSILGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        http.Response(
          json.encode(<String, dynamic>{
            'errors': <Object>[
              <String, dynamic>{
                'message': '4: error',
              }
            ]
          }),
          200,
        ),
      );
      storeTester.dispatch(
        RemoveFromGroupAction(
          client: mockShortSILGraphQlClient,
          onSuccess: () {},
          communityID: '',
          memberID: '',
          onFailure: () {},
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(RemoveFromGroupAction);

      expect(
        info.state,
        AppState.initial()
            .copyWith(connectivityState: ConnectivityState(isConnected: true)),
      );
      expect(
        (info.error! as UserException).msg,
        getErrorMessage('removing user from group'),
      );
    });

    test('should call on success if successful', () async {
      final MockShortGraphQlClient client = MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{'removeMembersFromCommunity': true}
          }),
          200,
        ),
      );

      int called = 0;
      storeTester.dispatch(
        RemoveFromGroupAction(
          client: client,
          onSuccess: () => called++,
          communityID: '',
          memberID: '',
          onFailure: () {},
        ),
      );

      expect(called, 0);

      await storeTester.waitUntil(RemoveFromGroupAction);

      expect(called, 1);
    });

    test('should call on failure if false', () async {
      final MockShortGraphQlClient client = MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{'removeMembersFromCommunity': false}
          }),
          200,
        ),
      );

      int called = 0;
      storeTester.dispatch(
        RemoveFromGroupAction(
          client: client,
          onSuccess: () {},
          communityID: '',
          memberID: '',
          onFailure: () => called++,
        ),
      );

      expect(called, 0);

      await storeTester.waitUntil(RemoveFromGroupAction);

      expect(called, 1);
    });
  });
}
