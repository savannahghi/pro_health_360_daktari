// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:mycarehubpro/application/redux/actions/user_state_actions/logout_action.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';

import '../../../../mocks/mocks.dart';

void main() {
  group('LogoutAction', () {
    late StoreTester<AppState> storeTester;

    setUp(() async {
      storeTester = StoreTester<AppState>(
        initialState: AppState.initial(),
        // this suppresses the verbose logs in the terminal
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );
      setupFirebaseAnalyticsMocks();
      await Firebase.initializeApp();
    });

    test('should reset app state to initial state', () async {
      await storeTester.dispatch(LogoutAction());

      final TestInfo<AppState> info = await storeTester.waitUntil(LogoutAction);

      expect(info.state, AppState.initial());
    });

    test('should dispatch navigation action after resetting state', () async {
      await storeTester.dispatch(LogoutAction());

      final TestInfo<AppState> info =
          await storeTester.waitUntil(NavigateAction);

      expect(info.dispatchCount, 2);
      expect(info.state, AppState.initial());
    });
  });
}
