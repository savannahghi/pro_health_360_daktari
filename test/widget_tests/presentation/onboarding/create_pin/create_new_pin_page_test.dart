// Flutter imports:
import 'dart:io';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:myharehubpro/application/redux/actions/flags/app_flags.dart';
import 'package:myharehubpro/application/redux/actions/update_connectivity_action.dart';
import 'package:myharehubpro/application/redux/states/app_state.dart';
// Project imports:
import 'package:myharehubpro/domain/core/value_objects/app_strings.dart';
import 'package:myharehubpro/domain/core/value_objects/app_widget_keys.dart';
import 'package:myharehubpro/presentation/onboarding/create_pin/pages/create_new_pin_page.dart';
import 'package:myharehubpro/presentation/onboarding/set_nickname/set_nickname_page.dart';

import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  group('CreateNewPINPage', () {
    late Store<AppState> store;

    setUpAll(() {
      store = Store<AppState>(initialState: AppState.initial());
      HttpOverrides.global = null;
      store.dispatch(UpdateConnectivityAction(hasConnection: true));
    });

    testWidgets('PIN field validates correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: const CreateNewPINPage(),
      );

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
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: const CreateNewPINPage(),
      );
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

    testWidgets('Navigates to Congratulations page if PINs are valid  ',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: const CreateNewPINPage(),
      );
      await tester.pumpAndSettle();
      final Finder pinInputField = find.byKey(pinInputKey);
      final Finder confirmPinInputField = find.byKey(confirmPinInputKey);
      final Finder saveAndContinueButton =
          find.byKey(createPINContinueButtonKey);

      expect(confirmPinInputField, findsOneWidget);

      await tester.showKeyboard(pinInputField);
      await tester.enterText(pinInputField, '0000');
      await tester.showKeyboard(confirmPinInputField);
      await tester.enterText(confirmPinInputField, '0000');
      await tester.ensureVisible(saveAndContinueButton);
      await tester.tap(saveAndContinueButton);
      await tester.pumpAndSettle();
      expect(find.byType(SetNickNamePage), findsOneWidget);
    });

    testWidgets('should show No Internet text when there is no connectivity ',
        (WidgetTester tester) async {
      store.dispatch(UpdateConnectivityAction(hasConnection: false));

      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: const CreateNewPINPage(),
      );
      await tester.pumpAndSettle();
      final Finder pinInputField = find.byKey(pinInputKey);
      final Finder confirmPinInputField = find.byKey(confirmPinInputKey);
      final Finder saveAndContinueButton =
          find.byKey(createPINContinueButtonKey);

      expect(confirmPinInputField, findsOneWidget);

      await tester.showKeyboard(pinInputField);
      await tester.enterText(pinInputField, '0000');
      await tester.showKeyboard(confirmPinInputField);
      await tester.enterText(confirmPinInputField, '0000');
      await tester.ensureVisible(saveAndContinueButton);
      await tester.tap(saveAndContinueButton);
      await tester.pump(const Duration(seconds: 2));
      expect(find.text(noInternetConnection), findsOneWidget);
    });

    testWidgets('should render PlatformLoader', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: const CreateNewPINPage(),
      );

      await tester.pumpAndSettle();
      store.dispatch(WaitAction<AppState>.add(createPinFlag));
      await tester.pump(const Duration(seconds: 2));
      expect(find.byType(PlatformLoader), findsOneWidget);
    });
  });
}
