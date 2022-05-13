// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_asset_strings.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_widget_keys.dart';
import 'package:mycarehubpro/presentation/notifications/notification_list_item.dart' as local;
import 'package:mycarehubpro/presentation/service_requests/pages/service_requests_page.dart';

import '../../../mocks/mocks.dart';
import '../../../mocks/test_helpers.dart';

void main() {
  final Store<AppState> store = Store<AppState>(
    initialState: AppState.initial(),
  );
  group('NotificationListItem', () {
    testWidgets('should render NotificationListItem without actions',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: local.NotificationListItem(
          notificationDetails: NotificationDetails(
            body: 'Your Teleconsult with Dr Tibu for 11am has been set. '
                'Click this link to join ',
            createdAt: 'July 12 2021',
            type: NotificationType.COMMUNITIES,
          ),
        ),
      );

      // verify Notification List Item renders correctly
      expect(find.byType(local.NotificationListItem), findsOneWidget);

      expect(find.text('Add to Calendar'), findsNothing);
    });

    testWidgets('should render NotificationListItem with actions',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: local.NotificationListItem(
          notificationDetails: NotificationDetails(
            body: 'Your Teleconsult with Dr Tibu for 11am has been set. '
                'Click this link to join ',
            createdAt: 'July 12 2021',
            type: NotificationType.SERVICE_REQUEST,
            actions: <NotificationActions>[
              NotificationActions(
                icon: IconDetails(iconUrlSvgPath: homeLocationIcon),
                name: 'Add to Calendar',
                route: '',
              )
            ],
          ),
        ),
      );
      // verify Notification List Item renders correctly
      expect(find.byType(local.NotificationListItem), findsOneWidget);

      await tester.tap(find.byKey(notificationItemActionKey));
      await tester.pumpAndSettle();
      expect(find.byType(ServiceRequestsPage), findsOneWidget);
    });
  });
}
