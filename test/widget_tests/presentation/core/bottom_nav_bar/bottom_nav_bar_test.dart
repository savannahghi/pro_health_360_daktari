// Dart imports:

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:firebase_core/firebase_core.dart';
// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/core/bottom_nav/bottom_nav_bar.dart';
import 'package:prohealth360_daktari/presentation/notifications/notifications_page.dart';

import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  group('bottom navigation bar', () {
    final Store<AppState> store =
        Store<AppState>(initialState: AppState.initial());

    setUp(() async {
      setupFirebaseAnalyticsMocks();
      await Firebase.initializeApp();
    });
    testWidgets(
        'renders all bottom navigation items correctly '
        'and navigates to at least one of the bottom navigation items',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        widget: Builder(
          builder: (BuildContext context) {
            return Scaffold(
              body: Container(),
              bottomNavigationBar: const BottomNavBar(
                bottomNavIndex: 0,
              ),
            );
          },
        ),
      );

      await tester.pumpAndSettle();

      // verify the bottom navigation bar exists
      expect(find.byKey(bottomNavKey), findsOneWidget);
      expect(find.text('Notifications'), findsWidgets);
      await tester.tap(find.text('Notifications').first);
      await tester.pumpAndSettle();
      expect(find.byType(NotificationsPage), findsWidgets);
    });
  });
}
