import 'dart:convert';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myharehubpro/application/redux/actions/complete_onboarding_tour.dart';
import 'package:myharehubpro/application/redux/states/app_state.dart';
import 'package:http/http.dart';

import '../../../../../mocks/mocks.dart';

void main() {
  group('CompleteOnboardingTourAction', () {
    late StoreTester<AppState> storeTester;

    setUp(() {
      storeTester = StoreTester<AppState>(
        initialState: AppState.initial(),
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );
    });

    test('should throw error if api call returns error', () async {
      storeTester.dispatch(
        CompleteOnboardingTourAction(
          userID: 'some-user-id',
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
          await storeTester.waitUntil(CompleteOnboardingTourAction);

      expect(
        (info.error as UserException?)?.msg,
        getErrorMessage('completing the onbaording tour'),
      );
    });
  });
}
