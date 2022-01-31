// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:healthcloud/domain/core/value_objects/app_widget_keys.dart';
import 'package:healthcloud/presentation/onboarding/patient/add_new_patient_page.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  group('AddNewPatientPage', () {
    testWidgets('app invite checkbox', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        widget: const AddNewPatientPage(),
      );
      await tester.pumpAndSettle();

      final Finder appInviteCheckBox = find.byKey(myAfyaHubInviteKey);
      expect(appInviteCheckBox, findsOneWidget);
      await tester.ensureVisible(appInviteCheckBox);

      final Checkbox checkBox =
          tester.firstWidget(appInviteCheckBox) as Checkbox;

      expect(checkBox.value, false);

      await tester.tap(appInviteCheckBox);
      await tester.pumpAndSettle();

      expect((tester.firstWidget(appInviteCheckBox) as Checkbox).value, true);
    });

    testWidgets('groups checkboxes', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        widget: const AddNewPatientPage(),
      );
      await tester.pumpAndSettle();

      final Finder groupInviteCheckBox = find.byKey(const ValueKey<int>(1));
      expect(groupInviteCheckBox, findsOneWidget);
      await tester.ensureVisible(groupInviteCheckBox);

      final Checkbox checkBox =
          tester.firstWidget(groupInviteCheckBox) as Checkbox;

      expect(checkBox.value, false);

      await tester.tap(groupInviteCheckBox);
      await tester.pumpAndSettle();

      expect((tester.firstWidget(groupInviteCheckBox) as Checkbox).value, true);
    });

    testWidgets('register button calls onRegisterPatient',
        (WidgetTester tester) async {
      bool registered = false;

      await buildTestWidget(
        tester: tester,
        widget: AddNewPatientPage(
          onRegisterPatient: () {
            registered = true;
          },
        ),
      );
      await tester.pumpAndSettle();

      final Finder registerBtnFinder = find.byKey(patientRegisterBtnKey);
      expect(registerBtnFinder, findsOneWidget);
      await tester.ensureVisible(registerBtnFinder);

      await tester.tap(registerBtnFinder);
      await tester.pump();

      expect(registered, true);
    });
  });
}
