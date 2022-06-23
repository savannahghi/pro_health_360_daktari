import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/presentation/onboarding/login/pages/phone_login_page.dart';
import 'package:prohealth360_daktari/presentation/onboarding/login/pages/pin_request_sent_page.dart';

import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  final Store<AppState> store = Store<AppState>(
    initialState: AppState.initial(),
  );

  group('StaffPinRequestSentPage', () {
    testWidgets('navigates to login page once a user dismisses the page',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: const PinRequestSentPage(),
      );

      expect(find.byType(MyAfyaHubPrimaryButton), findsOneWidget);

      await tester.tap(find.byType(MyAfyaHubPrimaryButton));
      await tester.pumpAndSettle();

      expect(find.byType(PhoneLoginPage), findsOneWidget);
    });
  });
}
