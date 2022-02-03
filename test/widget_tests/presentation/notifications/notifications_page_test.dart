// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:healthcloud/application/core/services/utils.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/presentation/notifications/notifications_page.dart';
import '../../../mocks/test_helpers.dart';

void main() {
  group('NotificationsPage', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets('should render notifications as a list',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        widget: NotificationsPage(
          notifications: notifications,
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(NotificationListItem), findsNWidgets(3));
    });
  });
}
