import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mycarehubpro/application/redux/actions/core/batch_update_misc_state_action.dart';
import 'package:mycarehubpro/application/redux/actions/flags/app_flags.dart';
import 'package:mycarehubpro/application/redux/actions/terms/update_terms_action.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';
import 'package:mycarehubpro/presentation/onboarding/terms/terms_and_conditions_page.dart';

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
        graphQlClient: mockGraphQlClient,
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

      expect(find.byType(PlatformLoader), findsOneWidget);
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

      final Finder retryButton = find.byType(MyAfyaHubPrimaryButton);

      expect(retryButton, findsOneWidget);
      await tester.tap(retryButton);
      await tester.pumpAndSettle();
      expect(retryButton, findsOneWidget);
    });
  });
}
