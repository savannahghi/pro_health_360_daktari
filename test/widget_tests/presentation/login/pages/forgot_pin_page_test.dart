// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/onboarding/login/pages/forgot_pin_page.dart';
import 'package:prohealth360_daktari/presentation/onboarding/verify_phone/pages/verify_phone_page.dart';
import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';

//Project Imports

void main() {
  group('ForgotPinPage', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: mockGraphQlClient,
        widget: ForgotPinPage(),
      );

      final Finder resetPINButton = find.byKey(resetPINButtonKey);

      expect(resetPINButton, findsOneWidget);

      await tester.tap(resetPINButton);
      await tester.pumpAndSettle();

      expect(find.byType(VerifyPhonePage), findsOneWidget);
    });
  });
}
