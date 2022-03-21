import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/presentation/onboarding/login/pages/pin_request_sent_page.dart';
import 'package:mycarehubpro/presentation/router/routes.dart';

import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  final Store<AppState> store = Store<AppState>(
    initialState: AppState.initial(),
  );

  group('PinRequestSentPage', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
          graphQlClient: MockTestGraphQlClient(),
        widget: const PinRequestSentPage(),
      );

      expect(find.byType(PinRequestSentPage), findsOneWidget);
      expect(find.byType(MyAfyaHubPrimaryButton), findsOneWidget);
    });

    testWidgets('pop functions correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
          graphQlClient: MockTestGraphQlClient(),
        widget: Builder(
          builder: (BuildContext context) {
            return SizedBox(
              child: MyAfyaHubPrimaryButton(
                text: 'tap',
                onPressed: () {
                  Navigator.of(context).pushNamed(AppRoutes.pinRequestSentPage);
                },
              ),
            );
          },
        ),
      );
      expect(find.byType(MyAfyaHubPrimaryButton), findsOneWidget);
      await tester.tap(find.byType(MyAfyaHubPrimaryButton));

      await tester.pumpAndSettle();
      expect(find.byType(PinRequestSentPage), findsOneWidget);
      expect(find.byType(MyAfyaHubPrimaryButton), findsOneWidget);

      await tester.tap(find.byType(MyAfyaHubPrimaryButton));
      await tester.pumpAndSettle();

      expect(find.text('tap'), findsOneWidget);
    });
  });
}
