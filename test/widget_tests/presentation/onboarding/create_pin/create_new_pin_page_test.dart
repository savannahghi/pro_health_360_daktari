// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:healthcloud/domain/core/value_objects/app_widget_keys.dart';
import 'package:healthcloud/presentation/onboarding/create_pin/pages/create_new_pin_page.dart';

void main() {
  group('CreateNewPinPage', () {
    testWidgets('PIN field validates correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: CreateNewPINPage(),
        ),
      );
      await tester.pumpAndSettle();

      final Finder pinInputField = find.byKey(pinInputKey);
      final Finder saveAndContinueButton =
          find.byKey(createPINContinueButtonKey);

      expect(pinInputField, findsOneWidget);
      expect(saveAndContinueButton, findsOneWidget);

      await tester.ensureVisible(saveAndContinueButton);
      await tester.tap(saveAndContinueButton);
      await tester.pumpAndSettle();
      expect(find.text('A PIN is required'), findsNWidgets(2));
    });
    testWidgets('confirm PIN validates correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: CreateNewPINPage(),
        ),
      );
      await tester.pumpAndSettle();
      final Finder pinInputField = find.byKey(pinInputKey);
      final Finder confirmPinInputField = find.byKey(confirmPinInputKey);
      final Finder saveAndContinueButton =
          find.byKey(createPINContinueButtonKey);

      expect(confirmPinInputField, findsOneWidget);

      await tester.showKeyboard(pinInputField);
      await tester.enterText(pinInputField, '1234');
      await tester.showKeyboard(confirmPinInputField);
      await tester.enterText(confirmPinInputField, '1243');
      await tester.ensureVisible(saveAndContinueButton);

      await tester.tap(saveAndContinueButton);
      await tester.pump(const Duration(seconds: 1));
      expect(find.text(pinMustMatchString), findsOneWidget);
    });

    testWidgets('Validates whether terms and conditions have been accepted',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: CreateNewPINPage(),
        ),
      );
      await tester.pumpAndSettle();
      final Finder pinInputField = find.byKey(pinInputKey);
      final Finder confirmPinInputField = find.byKey(confirmPinInputKey);
      final Finder saveAndContinueButton =
          find.byKey(createPINContinueButtonKey);

      expect(confirmPinInputField, findsOneWidget);

      await tester.showKeyboard(pinInputField);
      await tester.enterText(pinInputField, '1234');
      await tester.showKeyboard(confirmPinInputField);
      await tester.enterText(confirmPinInputField, '1234');

      await tester.ensureVisible(saveAndContinueButton);
      await tester.tap(saveAndContinueButton);
      await tester.pumpAndSettle();

      expect(find.text(acceptTermsString), findsOneWidget);
    });

    testWidgets('Displays coming soon of form is valid',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: CreateNewPINPage(),
        ),
      );
      await tester.pumpAndSettle();
      final Finder pinInputField = find.byKey(pinInputKey);
      final Finder confirmPinInputField = find.byKey(confirmPinInputKey);
      final Finder saveAndContinueButton =
          find.byKey(createPINContinueButtonKey);

      expect(confirmPinInputField, findsOneWidget);

      await tester.showKeyboard(pinInputField);
      await tester.enterText(pinInputField, '1234');
      await tester.showKeyboard(confirmPinInputField);
      await tester.enterText(confirmPinInputField, '1234');

      final Finder checkTile = find.byType(CheckboxListTile);

      await tester.ensureVisible(checkTile);
      await tester.tap(checkTile);
      await tester.pumpAndSettle();

      await tester.ensureVisible(saveAndContinueButton);
      await tester.tap(saveAndContinueButton);
      await tester.pumpAndSettle();

      expect(find.text(comingSoon), findsOneWidget);
    });
  });
}
