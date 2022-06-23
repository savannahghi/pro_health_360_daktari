import 'package:async_redux/async_redux.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prohealth360_daktari/application/redux/actions/core/batch_update_misc_state_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/presentation/core/widgets/handle_deep_link.dart';
import 'package:prohealth360_daktari/presentation/engagement/home/pages/home_page.dart';
import 'package:prohealth360_daktari/presentation/router/routes.dart';

import '../../../mocks/mocks.dart';
import '../../../mocks/test_helpers.dart';

void main() {
  group('HandleDeepLink', () {
    setUp(() async {
      setupFirebaseMessagingMocks();
      await Firebase.initializeApp();
    });
    testWidgets('should dispatch DeepLinkAction', (WidgetTester tester) async {
      final Store<AppState> store =
          Store<AppState>(initialState: AppState.initial());

      store.dispatch(
        BatchUpdateMiscStateAction(initialRoute: AppRoutes.homePage),
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: const HandleDeepLink(),
      );
      await tester.pumpAndSettle();

      expect(find.byType(HomePage), findsOneWidget);
    });
  });
}
