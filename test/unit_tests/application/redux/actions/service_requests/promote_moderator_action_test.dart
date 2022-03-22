import 'dart:convert';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:mycarehubpro/application/redux/actions/communities/promote_to_moderator_action.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';

import '../../../../../mocks/mocks.dart';
import 'promote_moderator_action_test.mocks.dart';

@GenerateMocks(<Type>[IGraphQlClient])
void main() {
  group('PromoteToModeratorAction', () {
    late IGraphQlClient client;
    late StoreTester<AppState> storeTester;

    setUp(() {
      client = MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          jsonEncode(<String, dynamic>{
            'data': <String, bool>{'addModerators': true}
          }),
          200,
        ),
      );

      storeTester = StoreTester<AppState>(
        initialState: AppState.initial(),
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );
    });

    test('runs successfully if API call is successful', () async {
      int successCounter = 0;

      storeTester.dispatch(
        PromoteToModeratorAction(
          client: client,
          memberIds: <String>['memberId'],
          communityId: 'communityId',
          successCallback: () => successCounter++,
        ),
      );

      await storeTester.waitUntil(PromoteToModeratorAction);

      expect(successCounter, 1);
    });

    test('throws error if API call returns error', () async {
      client = MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          jsonEncode(<String, dynamic>{}),
          400,
        ),
      );

      int successCounter = 0;

      storeTester.dispatch(
        PromoteToModeratorAction(
          client: client,
          memberIds: <String>['memberId'],
          communityId: 'communityId',
          successCallback: () => successCounter++,
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(PromoteToModeratorAction);

      expect(successCounter, 0);
      expect(
        info.errors.removeFirst(),
        const UserException(somethingWentWrongText),
      );
    });

    test('should throw user exception if response is false', () async {
      client = MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          jsonEncode(<String, dynamic>{
            'data': <String, bool>{'addModerators': false}
          }),
          200,
        ),
      );

      int successCounter = 0;

      storeTester.dispatch(
        PromoteToModeratorAction(
          client: client,
          memberIds: <String>['memberId'],
          communityId: 'communityId',
          successCallback: () => successCounter++,
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntilErrorGetLast(error: UserException);

      expect(successCounter, 0);
      expect(
        info.errors.removeFirst(),
        const UserException(errorPromotingAdminText),
      );
    });

    test('should throw user exception if response contains error', () async {
      client = MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          jsonEncode(<String, dynamic>{'error': 'some-error'}),
          200,
        ),
      );

      int successCounter = 0;

      storeTester.dispatch(
        PromoteToModeratorAction(
          client: client,
          memberIds: <String>['memberId'],
          communityId: 'communityId',
          successCallback: () => successCounter++,
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntilErrorGetLast(error: UserException);

      expect(successCounter, 0);
      expect(
        info.errors.removeFirst(),
        const UserException(errorPromotingAdminText),
      );
    });

    test('should handle unexpected error', () async {
      final MockIGraphQlClient client = MockIGraphQlClient();

      when(
        client.query(any, any),
      ).thenThrow(MyAfyaException(cause: 'cause', message: 'message'));

      int successCounter = 0;

      storeTester.dispatch(
        PromoteToModeratorAction(
          client: client,
          memberIds: <String>['memberId'],
          communityId: 'communityId',
          successCallback: () => successCounter++,
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(PromoteToModeratorAction);

      expect(successCounter, 0);
      expect(
        info.errors.removeFirst(),
        const UserException(somethingWentWrongText),
      );
    });
  });
}
