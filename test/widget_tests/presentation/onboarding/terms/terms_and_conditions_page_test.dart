import 'package:afya_moja_core/buttons.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:healthcloud/application/redux/actions/core/batch_update_misc_state_action.dart';
import 'package:healthcloud/application/redux/actions/flags/app_flags.dart';
import 'package:healthcloud/application/redux/actions/terms/update_terms_action.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:healthcloud/presentation/onboarding/terms/terms_and_conditions_page.dart';
import 'package:shared_ui_components/platform_loader.dart';

import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  group('TermsAndConditionsPage', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets('should render correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: mockSILGraphQlClient,
        widget: const TermsAndConditionsPage(),
      );

      expect(find.text(portalTermsText), findsOneWidget);
      expect(find.text(readAndAcceptText), findsOneWidget);
      expect(find.text(acceptTermsText), findsOneWidget);
    });

    testWidgets('accepts terms and conditions and navigates to homepage',
        (WidgetTester tester) async {
      store.dispatch(UpdateTermsAndConditionsAction(termsString: 'testTerms'));
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: const TermsAndConditionsPage(),
      );

      await tester.pumpAndSettle();
      final Finder checkBox = find.byType(Checkbox);
      final Finder proceedButton = find.byType(MyAfyaHubPrimaryButton);
      await tester.tap(checkBox);
      await tester.pumpAndSettle();
      await tester.tap(proceedButton);
      await tester.pumpAndSettle();

      expect(find.byType(TermsAndConditionsPage), findsNothing);
    });

    testWidgets('shows loading indicator when fetching terms',
        (WidgetTester tester) async {
      store.dispatch(WaitAction<AppState>.add(getTermsFlag));
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: const TermsAndConditionsPage(),
      );

      expect(find.byType(SILPlatformLoader), findsOneWidget);
    });

    testWidgets('shows error widget if error exists',
        (WidgetTester tester) async {
      store.dispatch(BatchUpdateMiscStateAction(error: somethingWentWrongText));
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: const TermsAndConditionsPage(),
      );

      expect(find.text(somethingWentWrongText), findsOneWidget);
    });
  });
}
