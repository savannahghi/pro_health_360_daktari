import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:healthcloud/domain/core/value_objects/app_widget_keys.dart';
import 'package:healthcloud/presentation/community/pages/add_new_group_page.dart';

import '../../../mocks/test_helpers.dart';

void main() {
  group('AddNewGroupPage', () {
    testWidgets('band dropdown work correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        widget: const AddNewGroupPage(),
      );

      final Finder bandPickerFinder =
          find.byKey(bandDropdownKey, skipOffstage: false);
      expect(bandPickerFinder, findsOneWidget);
      await tester.ensureVisible(bandPickerFinder);
      await tester.pump();
      await tester.tap(bandPickerFinder);
      await tester.pump();

      final Finder dropdownValueFinder =
          find.byKey(const ValueKey<String>('Female')).first;
      expect(dropdownValueFinder, findsOneWidget);
      await tester.tap(dropdownValueFinder);
      await tester.pumpAndSettle();

      expect(find.text('Female'), findsOneWidget);
    });

    testWidgets('location dropdown work correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        widget: const AddNewGroupPage(),
      );

      final Finder locationPickerFinder =
          find.byKey(locationDropdownKey, skipOffstage: false);
      expect(locationPickerFinder, findsOneWidget);
      await tester.ensureVisible(locationPickerFinder);
      await tester.pump();
      await tester.tap(locationPickerFinder);
      await tester.pump();

      final Finder dropdownValueFinder =
          find.byKey(const ValueKey<String>('Kiambu')).first;
      expect(dropdownValueFinder, findsOneWidget);
      await tester.tap(dropdownValueFinder);
      await tester.pumpAndSettle();

      expect(find.text('Kiambu'), findsOneWidget);
    });

    testWidgets('age dropdown work correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        widget: const AddNewGroupPage(),
      );

      final Finder agePickerFinder =
          find.byKey(ageDropdownKey, skipOffstage: false);
      expect(agePickerFinder, findsOneWidget);
      await tester.ensureVisible(agePickerFinder);
      await tester.pump();
      await tester.tap(agePickerFinder);
      await tester.pump();

      final Finder dropdownValueFinder =
          find.byKey(const ValueKey<String>('26-30')).first;
      expect(dropdownValueFinder, findsOneWidget);
      await tester.tap(dropdownValueFinder);
      await tester.pumpAndSettle();

      expect(find.text('26-30 yo'), findsOneWidget);
    });

    testWidgets('clinic dropdown work correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        widget: const AddNewGroupPage(),
      );

      final Finder clinicPickerFinder =
          find.byKey(clinicDropdownKey, skipOffstage: false);
      expect(clinicPickerFinder, findsOneWidget);
      await tester.ensureVisible(clinicPickerFinder);
      await tester.pump();
      await tester.tap(clinicPickerFinder);
      await tester.pump();

      final Finder dropdownValueFinder =
          find.byKey(const ValueKey<String>('2')).first;
      expect(dropdownValueFinder, findsOneWidget);
      await tester.tap(dropdownValueFinder);
      await tester.pumpAndSettle();

      expect(find.text('Kiambu level iv Hospital'), findsOneWidget);
    });

    testWidgets('moderation switch dropdown work correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        widget: const AddNewGroupPage(),
      );

      final Finder moderationSwitch = find.byKey(moderationActiveSwitchKey);
      expect(moderationSwitch, findsOneWidget);

      Switch moderationSwitchElement =
          moderationSwitch.evaluate().single.widget as Switch;
      expect(moderationSwitchElement.value, false);

      await tester.ensureVisible(moderationSwitch);
      await tester.tap(moderationSwitch);
      await tester.pumpAndSettle();

      moderationSwitchElement =
          moderationSwitch.evaluate().single.widget as Switch;

      expect(moderationSwitchElement.value, true);
    });
  });
}
