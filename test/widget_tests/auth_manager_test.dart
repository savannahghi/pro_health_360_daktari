import 'package:async_redux/async_redux.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/presentation/core/bewell_pro_app.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_contexts.dart';
import 'package:bewell_pro_core/presentation/onboarding/common/landing_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/mock_utils.dart';

void main() {
  group('AuthManager', () {
    setUpAll(() async {
      setupFirebaseAuthMocks();
      await Firebase.initializeApp();
    });

    final Store<CoreState> store =
        Store<CoreState>(initialState: AppState.initial());

    final Widget _beWellProApp = BewellProApp(
      store: store,
      appContexts: testAppContexts,
    );

    testWidgets('Renders landing page', (WidgetTester tester) async {
      await tester.pumpWidget(_beWellProApp);

      await tester.pumpAndSettle();

      expect(find.byType(MaterialApp), findsNWidgets(1));
      expect(find.byType(LandingPage), findsOneWidget);
    });

    testWidgets('tests if didChangeAppLifecycleState executes correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(_beWellProApp);

      tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.detached);
      await tester.pump(const Duration(milliseconds: 50));
      tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.resumed);
      expect(store.state.userState!.inActivitySetInTime!.isNotEmpty, true);
    });
  });
}
