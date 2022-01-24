//Package Imports
import 'package:afya_moja_core/buttons.dart';
import 'package:afya_moja_core/inputs.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:healthcloud/presentation/onboarding/verify_otp/pages/verify_otp_page.dart';

import '../../../mocks/mocks.dart';
import '../../../mocks/test_helpers.dart';

void main() {
  group('VerifyOTPPage', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets('should render error text if OTP is invalid',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: mockSILGraphQlClient,
        widget: const VerifyOTPPage(
          otp: 1234,
        ),
      );

      await tester.pumpAndSettle();
      await tester.showKeyboard(find.byType(VerifyOTPInput));
      await tester.enterText(find.byType(VerifyOTPInput), '5555');
      await tester.pumpAndSettle();
      await tester.tap(find.byType(MyAfyaHubPrimaryButton));

      expect(find.text(invalidOTPString), findsOneWidget);
    });

    testWidgets(
        'confirmOTP button routes to Terms and Conditions if input is valid',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: mockSILGraphQlClient,
        widget: const VerifyOTPPage(
          otp: 1234,
        ),
      );

      await tester.pumpAndSettle();
      await tester.showKeyboard(find.byType(VerifyOTPInput));
      await tester.enterText(find.byType(VerifyOTPInput), '1234');
      await tester.pumpAndSettle();

      await tester.tap(find.byType(MyAfyaHubPrimaryButton));

      expect(find.text(invalidOTPString), findsNothing);
    });
  });
}
