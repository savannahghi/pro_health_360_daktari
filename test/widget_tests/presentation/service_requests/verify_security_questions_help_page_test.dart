import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_widget_keys.dart';
import 'package:mycarehubpro/presentation/onboarding/login/pages/phone_login_page.dart';
import 'package:mycarehubpro/presentation/service_requests/pages/verify_security_questions_help_page.dart';

import '../../../mocks/mocks.dart';
import '../../../mocks/test_helpers.dart';

void main() {
  group('VerifySecurityQuestionsHelpPage', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
    });
    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: VerifySecurityQuestionsHelpPage(),
      );
      final Finder tryAgainButton = find.byKey(tryAgainButtonKey);
      final Finder askForHelpButton = find.byKey(askForHelpButtonKey);
      expect(tryAgainButton, findsOneWidget);
      expect(askForHelpButton, findsOneWidget);

      await tester.tap(askForHelpButton);
      await tester.pump(const Duration(seconds: 4));
      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text(comingSoonText), findsOneWidget);

      await tester.pumpAndSettle();
      await tester.tap(tryAgainButton);
      await tester.pumpAndSettle();
      expect(find.byType(PhoneLoginPage), findsOneWidget);
    });
  });
}
