// Package imports:
import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/domain/core/entities/service_requests/pending_service_requests.dart';

// Project imports:
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:healthcloud/domain/core/value_objects/app_widget_keys.dart';
import 'package:healthcloud/presentation/core/app_bar/custom_app_bar.dart';
import 'package:healthcloud/presentation/engagement/home/widgets/action_card.dart';
import 'package:healthcloud/presentation/service_requests/pages/red_flags_page.dart';
import 'package:healthcloud/presentation/service_requests/pages/service_requests_page.dart';
import 'package:http/http.dart';
import '../../../mocks/mocks.dart';
import '../../../mocks/test_helpers.dart';

void main() {
  group('ServiceRequestsPage', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
    });
    testWidgets('should render correctly with default values',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        widget: ServiceRequestsPage(
          pendingServiceRequest:
              PendingServiceRequest.fromJson(mockPendingServiceRequests),
        ),
        graphQlClient: MockTestGraphQlClient(),
      );

      expect(find.byType(CustomAppBar), findsOneWidget);
      expect(find.text(serviceRequestString), findsOneWidget);
      expect(find.byType(ActionCard), findsNWidgets(2));

      await tester.tap(find.byType(ActionCard).first);
      await tester.pumpAndSettle();
      expect(find.text(serviceRequestString), findsNothing);
      await tester.tap(find.byKey(appBarBackButtonKey));
      await tester.pumpAndSettle();
      expect(find.text(serviceRequestString), findsOneWidget);

      await tester.tap(find.byType(ActionCard).last);
      await tester.pumpAndSettle();
      expect(find.text(serviceRequestString), findsNothing);
    });
    testWidgets('profile updates is tappable', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        widget: ServiceRequestsPage(
          pendingServiceRequest:
              PendingServiceRequest.fromJson(<String, dynamic>{
            'total': 2,
            'requestsTypeCount': <dynamic>[
              <String, dynamic>{'requestType': 'PROFILE_UPDATE', 'total': 2},
            ],
          }),
        ),
      );
      expect(find.byType(ActionCard), findsOneWidget);

      await tester.tap(find.byType(ActionCard));
      await tester.pumpAndSettle();
      expect(find.text(serviceRequestString), findsNothing);
    });
    testWidgets('red flags is tappable', (WidgetTester tester) async {
      final MockShortGraphQlClient mockShortGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{'getServiceRequests': <dynamic>[]}
          }),
          201,
        ),
      );
      await buildTestWidget(
        tester: tester,
        graphQlClient: mockShortGraphQlClient,
        store: store,
        widget: ServiceRequestsPage(
          pendingServiceRequest:
              PendingServiceRequest.fromJson(<String, dynamic>{
            'total': 2,
            'requestsTypeCount': <dynamic>[
              <String, dynamic>{'requestType': 'RED_FLAG', 'total': 2},
            ],
          }),
        ),
      );
      final Finder genericNoDataButton = find.byKey(genericNoDataButtonKey);

      await tester.tap(find.byType(ActionCard));
      await tester.pumpAndSettle();

      await tester.tap(genericNoDataButton);
      await tester.pumpAndSettle();
      expect(find.byType(RedFlagsPage), findsNothing);
    });
  });
}
