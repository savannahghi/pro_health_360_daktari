// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:healthcloud/application/redux/actions/core/afyamoja_logout_action.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';

void main() {
  group('AfyaMojaLogoutAction', () {
    late StoreTester<CoreState> storeTester;

    setUp(() {
      storeTester = StoreTester<CoreState>(
        initialState: AppState.initial(),
        // this suppresses the verbose logs in the terminal
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );
    });

    test('should reset app state to initial state', () async {
      await storeTester.dispatch(AfyaMojaLogoutAction());

      final TestInfo<CoreState> info =
          await storeTester.waitUntil(AfyaMojaLogoutAction);

      expect(info.state, AppState.initial());
    });

    test('should dispatch navigation action after resetting state', () async {
      await storeTester.dispatch(AfyaMojaLogoutAction());

      final TestInfo<CoreState> info =
          await storeTester.waitUntil(NavigateAction);

      expect(info.dispatchCount, 2);
      expect(info.state, AppState.initial());
    });
  });
}
