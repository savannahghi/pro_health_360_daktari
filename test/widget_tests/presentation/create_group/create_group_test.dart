import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/create_group/create_group.dart';

import '../../../mocks/mocks.dart';
import '../../../mocks/test_helpers.dart';

void main() {
  group('CreateGroup', () {
    setUp(() async {
      setupFirebaseAnalyticsMocks();
      await Firebase.initializeApp();
    });
    testWidgets('renders correctly', (WidgetTester tester) async {
      int popped = 0;

      final TestNavigatorObserver observer = TestNavigatorObserver(
        onPop: (Route<dynamic>? route, Route<dynamic>? previousRoute) =>
            popped++,
      );

      await buildTestWidget(
        tester: tester,
        widget: const CreateGroupPage(),
        navigatorObservers: <NavigatorObserver>[observer],
      );

      bool enabled = (find.byKey(createGroupBtnKey).evaluate().first.widget
              as ElevatedButton)
          .enabled;
      expect(enabled, false);

      final Finder groupName = find.byKey(groupNameKey);
      await tester.enterText(groupName, 'Test');
      await tester.pumpAndSettle();

      final Finder groupDesc = find.byKey(groupDescriptionKey);
      await tester.enterText(groupDesc, 'Test');
      await tester.pumpAndSettle();

      await tester.ensureVisible(find.text('PMTCT'));
      await tester.tap(find.text('PMTCT'));
      await tester.pumpAndSettle();

      final Finder lowerBoundField = find.byKey(lowerBoundKey);
      final Finder higherBoundField = find.byKey(higherBoundKey);

      await tester.ensureVisible(lowerBoundField);
      await tester.ensureVisible(higherBoundField);

      await tester.tap(lowerBoundField);
      await tester.enterText(lowerBoundField, '1');
      await tester.pumpAndSettle();
      expect(find.text(ageMustBeWithinRange), findsOneWidget);
      await tester.tap(higherBoundField);
      await tester.enterText(higherBoundField, '2');
      await tester.pumpAndSettle();
      expect(find.text(ageMustBeWithinRange), findsNWidgets(2));

      await tester.tap(lowerBoundField);
      await tester.enterText(lowerBoundField, '16');
      await tester.pumpAndSettle();
      await tester.tap(higherBoundField);
      await tester.enterText(higherBoundField, '25');
      await tester.pumpAndSettle();

      await tester.tap(find.text('Male'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Female'));
      await tester.pumpAndSettle();

      final Finder inviteOnlyBox = find.byKey(inviteOnlyKey);
      await tester.ensureVisible(inviteOnlyBox.first);
      await tester.tap(inviteOnlyBox);
      await tester.pumpAndSettle();

      enabled = (find.byKey(createGroupBtnKey).evaluate().first.widget
              as ElevatedButton)
          .enabled;
      expect(enabled, true);

      final Finder submitBtn = find.byKey(createGroupBtnKey);
      await tester.ensureVisible(submitBtn);
      await tester.tap(submitBtn);
      await tester.pumpAndSettle();

      expect(popped, 1);
    });

    testWidgets('group name field should show errors',
        (WidgetTester tester) async {
      await buildTestWidget(tester: tester, widget: const CreateGroupPage());

      final Finder groupName = find.byKey(groupNameKey);
      expect(groupName, findsOneWidget);
      await tester.enterText(groupName, 'test');
      expect(find.text('test'), findsOneWidget);

      await tester.enterText(groupName, '');
      await tester.pump();

      expect(find.text(fieldCannotBeEmptyText), findsOneWidget);
    });

    testWidgets('group description should show errors',
        (WidgetTester tester) async {
      await buildTestWidget(tester: tester, widget: const CreateGroupPage());

      final Finder groupDesc = find.byKey(groupDescriptionKey);
      expect(groupDesc, findsOneWidget);
      await tester.enterText(groupDesc, 'test');
      expect(find.text('test'), findsOneWidget);

      await tester.enterText(groupDesc, '');
      await tester.pump();

      expect(find.text(fieldCannotBeEmptyText), findsOneWidget);
    });
  });
}
