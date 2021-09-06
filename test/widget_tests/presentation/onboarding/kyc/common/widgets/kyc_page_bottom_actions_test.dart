import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/domain/core/value_objects/app_widget_keys.dart';
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/common/widgets/kyc_page_bottom_actions.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../../../../mocks/test_helpers.dart';

void main() {
  group('KYCLicenceAndRegistrationNumber', () {
    Store<AppState> store;
    final AppState state = AppState.initial();
    store = Store<AppState>(initialState: state);

    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
          tester: tester,
          store: store,
          widget: Builder(builder: (BuildContext context) {
            return KYCPagesBottomActions(
              onNextOrFinish: () {},
            );
          }));

      expect(find.byType(KYCPagesBottomActions), findsOneWidget);
      expect(find.byKey(kycBackButtonKey), findsOneWidget);
      expect(find.byKey(kycNextButtonKey), findsOneWidget);
    });

    testWidgets('back button works correctly', (WidgetTester tester) async {
      await buildTestWidget(
          tester: tester,
          store: store,
          widget: Builder(builder: (BuildContext context) {
            return KYCPagesBottomActions(
              onNextOrFinish: () {},
            );
          }));

      expect(find.byType(KYCPagesBottomActions), findsOneWidget);
      expect(find.byKey(kycBackButtonKey), findsOneWidget);

      await tester.tap(find.byKey(kycBackButtonKey));
      await tester.pumpAndSettle();

      expect(find.byKey(kycBackButtonKey), findsNothing);
    });
  });
}
