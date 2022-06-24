import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prohealth360_daktari/application/redux/actions/update_connectivity_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/states/connectivity_state.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/onboarding/staff/add_new_staff_page.dart';

import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  group('AddNewStaffPage', () {
    late Store<AppState> store;

    setUp(() async {
      store = Store<AppState>(
        initialState: AppState.initial()
            .copyWith(connectivityState: ConnectivityState(isConnected: true)),
      );
      setupFirebaseAnalyticsMocks();
      await Firebase.initializeApp();
    });

    testWidgets('register button calls RegisterStaffAction',
        (WidgetTester tester) async {
      await buildTestWidget(
        store: store,
        tester: tester,
        widget: const AddNewStaffPage(),
        graphQlClient: MockTestGraphQlClient(),
      );
      await tester.pumpAndSettle();

      final Finder fNameFieldFinder = find.byKey(firstNameKey);
      expect(fNameFieldFinder, findsOneWidget);
      await tester.tap(fNameFieldFinder);
      await tester.enterText(fNameFieldFinder, 'John');

      final Finder lNameFieldFinder = find.byKey(lastNameKey);
      expect(lNameFieldFinder, findsOneWidget);
      await tester.tap(lNameFieldFinder);
      await tester.enterText(lNameFieldFinder, 'Doe');

      final Finder facilityFieldFinder =
          find.byKey(facilitySelectOptionFieldKey);
      expect(facilityFieldFinder, findsOneWidget);
      await tester.tap(facilityFieldFinder);
      await tester.pumpAndSettle();
      await tester.tap(find.text('Kanairo').last);
      await tester.pumpAndSettle();

      // Dob field
      final Finder dobField = find.byKey(dobKey);
      await tester.ensureVisible(dobField);
      await tester.tap(dobField);
      await tester.pumpAndSettle();
      expect(find.text(currentYear.toString()), findsOneWidget);
      await tester.tap(find.text(currentYear.toString()));
      await tester.pumpAndSettle();
      expect(find.text(currentDay.toString()), findsOneWidget);
      await tester.tap(find.text(currentDay.toString()));
      await tester.tap(find.text('OK'));
      await tester.pumpAndSettle();

      final Finder genderFieldFinder = find.byKey(genderOptionFieldKey);
      expect(genderFieldFinder, findsOneWidget);
      await tester.tap(genderFieldFinder);
      await tester.pumpAndSettle();
      await tester.tap(find.text('Male').last);
      await tester.pumpAndSettle();

      final Finder phoneNumberFieldFinder = find.byKey(patientNumberField);
      expect(phoneNumberFieldFinder, findsOneWidget);
      await tester.tap(phoneNumberFieldFinder);
      await tester.enterText(phoneNumberFieldFinder, '+254798000000');

      final Finder idNumberFinder = find.byKey(const Key('id_number_key'));
      expect(idNumberFinder, findsOneWidget);
      await tester.tap(idNumberFinder);
      await tester.enterText(idNumberFinder, '12345678');

      final Finder staffNumberFinder =
          find.byKey(const Key('staff_number_key'));
      expect(staffNumberFinder, findsOneWidget);
      await tester.ensureVisible(staffNumberFinder);
      await tester.tap(staffNumberFinder);
      await tester.enterText(staffNumberFinder, '12345678');

      final Finder roleTypeFinder = find.byKey(const Key('role_key'));
      expect(roleTypeFinder, findsOneWidget);
      await tester.tap(roleTypeFinder);
      await tester.pumpAndSettle();
      await tester.tap(find.text('Client management').last);
      await tester.pumpAndSettle();

      final Finder appInviteCheckBox = find.byKey(myAfyaHubInviteKey);
      expect(appInviteCheckBox, findsOneWidget);
      await tester.ensureVisible(appInviteCheckBox);

      final Checkbox checkBox =
          tester.firstWidget(appInviteCheckBox) as Checkbox;

      expect(checkBox.value, false);

      await tester.tap(appInviteCheckBox);
      await tester.pumpAndSettle();

      final Finder registerBtnFinder =
          find.byKey(const Key('staffRegisterButton'));
      await tester.ensureVisible(registerBtnFinder);
      await tester.tap(registerBtnFinder);

      await tester.pump(const Duration(seconds: 2));
      expect(find.text(registerStaffSuccess), findsOneWidget);
    });

    testWidgets('register button should show error if no connection',
        (WidgetTester tester) async {
      await buildTestWidget(
        store: store,
        tester: tester,
        widget: const AddNewStaffPage(),
        graphQlClient: MockTestGraphQlClient(),
      );
      await tester.pumpAndSettle();

      final Finder fNameFieldFinder = find.byKey(firstNameKey);
      expect(fNameFieldFinder, findsOneWidget);
      await tester.tap(fNameFieldFinder);
      await tester.enterText(fNameFieldFinder, 'John');

      final Finder lNameFieldFinder = find.byKey(lastNameKey);
      expect(lNameFieldFinder, findsOneWidget);
      await tester.tap(lNameFieldFinder);
      await tester.enterText(lNameFieldFinder, 'Doe');

      final Finder facilityFieldFinder =
          find.byKey(facilitySelectOptionFieldKey);
      expect(facilityFieldFinder, findsOneWidget);
      await tester.tap(facilityFieldFinder);
      await tester.pumpAndSettle();
      await tester.tap(find.text('Kanairo').last);
      await tester.pumpAndSettle();

      // Dob field
      final Finder dobField = find.byKey(dobKey);
      await tester.ensureVisible(dobField);
      await tester.tap(dobField);
      await tester.pumpAndSettle();
      expect(find.text(currentYear.toString()), findsOneWidget);
      await tester.tap(find.text(currentYear.toString()));
      await tester.pumpAndSettle();
      expect(find.text(currentDay.toString()), findsOneWidget);
      await tester.tap(find.text(currentDay.toString()));
      await tester.tap(find.text('OK'));
      await tester.pumpAndSettle();

      final Finder genderFieldFinder = find.byKey(genderOptionFieldKey);
      expect(genderFieldFinder, findsOneWidget);
      await tester.tap(genderFieldFinder);
      await tester.pumpAndSettle();
      await tester.tap(find.text('Male').last);
      await tester.pumpAndSettle();

      final Finder phoneNumberFieldFinder = find.byKey(patientNumberField);
      expect(phoneNumberFieldFinder, findsOneWidget);
      await tester.tap(phoneNumberFieldFinder);
      await tester.enterText(phoneNumberFieldFinder, '+254798000000');

      final Finder idNumberFinder = find.byKey(const Key('id_number_key'));
      expect(idNumberFinder, findsOneWidget);
      await tester.tap(idNumberFinder);
      await tester.enterText(idNumberFinder, '12345678');

      final Finder staffNumberFinder =
          find.byKey(const Key('staff_number_key'));
      expect(staffNumberFinder, findsOneWidget);
      await tester.ensureVisible(staffNumberFinder);
      await tester.tap(staffNumberFinder);
      await tester.enterText(staffNumberFinder, '12345678');

      final Finder roleTypeFinder = find.byKey(const Key('role_key'));
      expect(roleTypeFinder, findsOneWidget);
      await tester.tap(roleTypeFinder);
      await tester.pumpAndSettle();
      await tester.tap(find.text('Client management').last);
      await tester.pumpAndSettle();

      final Finder appInviteCheckBox = find.byKey(myAfyaHubInviteKey);
      expect(appInviteCheckBox, findsOneWidget);
      await tester.ensureVisible(appInviteCheckBox);

      final Checkbox checkBox =
          tester.firstWidget(appInviteCheckBox) as Checkbox;

      expect(checkBox.value, false);

      await tester.tap(appInviteCheckBox);
      await tester.pumpAndSettle();

      store.dispatch(UpdateConnectivityAction(hasConnection: false));
      await tester.pumpAndSettle();

      final Finder registerBtnFinder =
          find.byKey(const Key('staffRegisterButton'));
      await tester.ensureVisible(registerBtnFinder);
      await tester.tap(registerBtnFinder);

      await tester.pump(const Duration(seconds: 2));
      expect(find.text(connectionLostText), findsOneWidget);
    });

    testWidgets('ID number field should show error',
        (WidgetTester tester) async {
      await buildTestWidget(
        store: store,
        tester: tester,
        widget: const AddNewStaffPage(),
      );
      await tester.pumpAndSettle();

      final Finder idFieldFinder = find.byKey(const Key('id_number_key'));
      expect(idFieldFinder, findsOneWidget);
      await tester.enterText(idFieldFinder, 'test');
      expect(find.text('test'), findsOneWidget);

      await tester.enterText(idFieldFinder, '');
      await tester.pump();

      expect(find.text(fieldCannotBeEmptyText), findsOneWidget);
    });

    testWidgets('staff number field should show error',
        (WidgetTester tester) async {
      await buildTestWidget(
        store: store,
        tester: tester,
        widget: const AddNewStaffPage(),
      );
      await tester.pumpAndSettle();

      final Finder staffFieldFinder = find.byKey(const Key('staff_number_key'));
      expect(staffFieldFinder, findsOneWidget);
      await tester.enterText(staffFieldFinder, 'test');
      expect(find.text('test'), findsOneWidget);

      await tester.enterText(staffFieldFinder, '');
      await tester.pump();

      expect(find.text(fieldCannotBeEmptyText), findsOneWidget);
    });

    testWidgets('first name field should show error',
        (WidgetTester tester) async {
      await buildTestWidget(
        store: store,
        tester: tester,
        widget: const AddNewStaffPage(),
      );
      await tester.pumpAndSettle();

      final Finder fNameFieldFinder = find.byKey(firstNameKey);
      expect(fNameFieldFinder, findsOneWidget);
      await tester.enterText(fNameFieldFinder, 'John');

      await tester.enterText(fNameFieldFinder, '');
      await tester.pump();

      expect(find.text(fieldCannotBeEmptyText), findsOneWidget);
    });

    testWidgets('last name field should show error',
        (WidgetTester tester) async {
      await buildTestWidget(
        store: store,
        tester: tester,
        widget: const AddNewStaffPage(),
      );
      await tester.pumpAndSettle();

      final Finder lNameFieldFinder = find.byKey(lastNameKey);
      expect(lNameFieldFinder, findsOneWidget);
      await tester.enterText(lNameFieldFinder, 'Doe');

      await tester.enterText(lNameFieldFinder, '');
      await tester.pump();

      expect(find.text(fieldCannotBeEmptyText), findsOneWidget);
    });

    testWidgets('phone number field should show error',
        (WidgetTester tester) async {
      await buildTestWidget(
        store: store,
        tester: tester,
        widget: const AddNewStaffPage(),
      );
      await tester.pumpAndSettle();

      final Finder phoneNumberFieldFinder = find.byKey(staffNumberField);
      expect(phoneNumberFieldFinder, findsOneWidget);
      await tester.enterText(phoneNumberFieldFinder, '+254798000000');

      await tester.enterText(phoneNumberFieldFinder, '');
      await tester.pump();

      expect(find.text('Phone number is required'), findsOneWidget);
    });
  });
}
