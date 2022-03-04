import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myharehubpro/application/redux/actions/create_pin_action.dart';
import 'package:myharehubpro/application/redux/states/app_state.dart';
import 'package:http/http.dart';

import '../../../../mocks/mocks.dart';

void main() {
  group('CreatePINAction', () {
    late StoreTester<AppState> storeTester;

    setUp(() {
      storeTester = StoreTester<AppState>(
        initialState: AppState.initial(),
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );
    });

    test('should not update state if error occurs during API call', () async {
      storeTester.dispatch(
        CreatePINAction(
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
          await storeTester.waitUntil(CreatePINAction);

      expect(info.state.onboardingState?.isPINSet, false);
    });
  });
}
