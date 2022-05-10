import 'dart:convert';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:mycarehubpro/application/redux/actions/set_push_token/set_push_token_action.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/domain/core/entities/core/auth_credentials.dart';
import 'package:firebase_messaging_platform_interface/firebase_messaging_platform_interface.dart';

import '../../../../../mocks/mocks.dart';
import 'set_push_token_action_test.mocks.dart';

@GenerateMocks(<Type>[IGraphQlClient])
void main() {
  group('SetPushToken', () {
    late StoreTester<AppState> storeTester;
    late FirebaseMessaging messaging;

    setUp(() async {
      setupFirebaseMessagingMocks();
      await Firebase.initializeApp();
      FirebaseMessagingPlatform.instance = kMockMessagingPlatform;
      messaging = FirebaseMessaging.instance;

      storeTester = StoreTester<AppState>(
        initialState: AppState.initial().copyWith(
          credentials: AuthCredentials(isSignedIn: true),
        ),
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );
    });

    test('should handle error', () async {
      storeTester.dispatch(
        SetPushToken(
          firebaseMessaging: messaging,
          client: MockShortGraphQlClient.withResponse(
            'idToken',
            'endpoint',
            Response(
              jsonEncode(
                <String, dynamic>{'error': 'some error'},
              ),
              200,
            ),
          ),
        ),
      );

      final TestInfo<AppState> info = await storeTester.waitUntil(SetPushToken);

      expect(info.dispatchCount, 1);
    });

    test('should handle unexpected error', () async {
      storeTester.dispatch(
        SetPushToken(
          firebaseMessaging: messaging,
          client: MockShortGraphQlClient.withResponse(
            'idToken',
            'endpoint',
            Response(
              jsonEncode(
                <String, dynamic>{'error': 'some error'},
              ),
              400,
            ),
          ),
        ),
      );

      final TestInfo<AppState> info = await storeTester.waitUntil(SetPushToken);

      expect(info.dispatchCount, 1);
    });

    test('should handle uncaught errors', () async {
      final MockIGraphQlClient client = MockIGraphQlClient();

      when(
        client.query(any, any),
      ).thenThrow(MyAfyaException(cause: 'cause', message: 'message'));

      storeTester.dispatch(
        SetPushToken(
          firebaseMessaging: messaging,
          client: client,
        ),
      );

      final TestInfo<AppState> info = await storeTester.waitUntil(SetPushToken);

      expect(info.errors.removeFirst().msg, getErrorMessage());
    });
  });
}
