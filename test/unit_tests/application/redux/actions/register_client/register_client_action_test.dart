import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prohealth360_daktari/application/redux/actions/register_client/register_client_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/entities/register_client/register_client_payload.dart';
import 'package:http/http.dart';

import '../../../../../mocks/mocks.dart';

void main() {
  group('RegisterClientAction', () {
    late StoreTester<AppState> storeTester;

    setUp(() {
      storeTester = StoreTester<AppState>(
        initialState: AppState.initial(),
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );
    });

    test('should run successfully', () async {
      int called = 0;

      storeTester.dispatch(
        RegisterClientAction(
          registerClientPayload: RegisterClientPayload(),
          client: MockTestGraphQlClient(),
          onSuccess: () => called++,
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(RegisterClientAction);

      expect(info.state, AppState.initial());
      expect(called, 1);
    });

    test('should throw error if api call is not 200', () async {
      int called = 0;

      storeTester.dispatch(
        RegisterClientAction(
          registerClientPayload: RegisterClientPayload(),
          client: MockShortGraphQlClient.withResponse(
            '',
            '',
            Response(
              jsonEncode(<String, String>{'error': 'error occurred'}),
              500,
            ),
          ),
          onSuccess: () => called++,
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(RegisterClientAction);

      expect(info.state, AppState.initial());
      expect(called, 0);
      expect(
        (info.error! as UserException).msg,
        'Sorry, an unknown error occurred, please try again or get help from our '
        'help center.',
      );
    });

    test('should throw error if response has error', () async {
      int called = 0;

      storeTester.dispatch(
        RegisterClientAction(
          registerClientPayload: RegisterClientPayload(),
          client: MockShortGraphQlClient.withResponse(
            '',
            '',
            Response(
              jsonEncode(<String, String>{'error': 'error occurred'}),
              200,
            ),
          ),
          onSuccess: () => called++,
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(RegisterClientAction);

      expect(info.state, AppState.initial());
      expect(called, 0);
      expect(
        (info.error! as UserException).msg,
        'Sorry, an unknown error occurred, please try again or get help from our '
        'help center.',
      );
    });

    test('should throw error if client exists', () async {
      storeTester.dispatch(
        RegisterClientAction(
          registerClientPayload: RegisterClientPayload(),
          client: MockShortGraphQlClient.withResponse(
            '',
            '',
            Response(
              jsonEncode(<String, String>{
                'error':
                    'a client with this identifier type and value already exists'
              }),
              200,
            ),
          ),
          onSuccess: () {},
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(RegisterClientAction);

      expect(info.state, AppState.initial());
      expect(
        (info.error! as UserException).msg,
        'A client with that ccc number already exists',
      );
    });
  });
}
