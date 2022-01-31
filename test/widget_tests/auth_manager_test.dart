// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:healthcloud/application/core/services/helpers.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/presentation/core/afya_moja_app.dart';
import '../mocks/mock_utils.dart';

void main() {
  group('AuthManager', () {
    FlutterConfig.loadValueForTesting(<String, String>{
      'DEV_SENTRY_DNS': 'test_dev_sentry_dns',
      'PROD_SENTRY_DNS': 'test_prod_sentry_dns',
    });

    setUpAll(() async {
      setupFirebaseAuthMocks();
      await Firebase.initializeApp();
    });

    final Store<AppState> store =
        Store<AppState>(initialState: AppState.initial());

    final Widget _beWellProApp =
        AfyaMojaApp(store: store, appSetupData: devAppSetupData);

    testWidgets('tests if didChangeAppLifecycleState executes correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(_beWellProApp);

      tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.detached);
      await tester.pump(const Duration(milliseconds: 50));
      tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.resumed);
      expect(
        store.state.staffState!.userState!.inActivitySetInTime!.isNotEmpty,
        true,
      );
    });
  });
}
