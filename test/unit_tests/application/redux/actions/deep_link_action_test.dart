import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prohealth360_daktari/application/redux/actions/core/batch_update_misc_state_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/deep_link_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/presentation/router/routes.dart';

void main() {
  group('DeepLinkAction', () {
    test('should navigate to home page', () async {
      final Store<AppState> store =
          Store<AppState>(initialState: AppState.initial());

      store.dispatch(
        BatchUpdateMiscStateAction(initialRoute: AppRoutes.homePage),
      );

      final StoreTester<AppState> storeTester =
          StoreTester<AppState>.from(store);

      storeTester.dispatch(DeepLinkAction());

      final TestInfo<AppState> info =
          await storeTester.waitUntil(NavigateAction);

      final NavigateAction<AppState>? actionDispatched =
          info.action as NavigateAction<AppState>?;

      final NavigatorDetails_PushReplacementNamed? navDetails =
          actionDispatched?.details as NavigatorDetails_PushReplacementNamed?;

      expect(navDetails?.routeName, AppRoutes.homePage);
    });
  });
}
