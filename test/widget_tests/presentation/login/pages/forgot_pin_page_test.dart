// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:healthcloud/presentation/onboarding/login/pages/forgot_pin_page.dart';
import 'package:healthcloud/presentation/onboarding/verify_phone/pages/verify_phone_page.dart';
import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';

//Project Imports

void main() {
  group('PhoneLogin', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: mockSILGraphQlClient,
        widget: ForgotPinPage(),
      );

      // Enter phone number
      await tester.enterText(find.byType(MyAfyaHubPhoneInput), '0712345678');

      expect(find.byType(ForgotPinPage), findsOneWidget);
      expect(find.text(resetPassword), findsOneWidget);
    });

    testWidgets('navigates to verifyOTPPage ', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: mockSILGraphQlClient,
        widget: ForgotPinPage(),
      );

      // Enter phone number
      await tester.enterText(find.byType(MyAfyaHubPhoneInput), '712345678');

      // Tap Button
      await tester.tap(find.byType(MyAfyaHubPrimaryButton));
      await tester.pumpAndSettle();

      expect(find.byType(VerifyPhonePage), findsOneWidget);
    });
  });
}
