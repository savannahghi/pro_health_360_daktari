import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/onboarding/pin_expired/pages/pin_expired_page.dart';
import 'package:prohealth360_daktari/presentation/onboarding/verify_phone/pages/verify_phone_page.dart';

import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  final Store<AppState> store = Store<AppState>(
    initialState: AppState.initial(),
  );

  group('PinExpiredPage', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: const PinExpiredPage(),
      );

      expect(find.byType(PinExpiredPage), findsOneWidget);
      expect(find.byKey(changeMyPinButtonKey), findsOneWidget);

      await tester.tap(find.byKey(changeMyPinButtonKey));
      await tester.pumpAndSettle();

      expect(find.byKey(changeMyPinButtonKey), findsNothing);
      expect(find.byType(VerifyPhonePage), findsOneWidget);
    });
  });
}
