import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:healthcloud/domain/core/value_objects/app_widget_keys.dart';
import 'package:healthcloud/presentation/engagement/home/widgets/action_card.dart';
import 'package:healthcloud/presentation/service_requests/pages/service_requests_page.dart';
import 'package:healthcloud/presentation/service_requests/widgets/service_request_action_card.dart';
import 'package:http/http.dart';
import 'package:shared_ui_components/platform_loader.dart';

import '../../../mocks/mocks.dart';
import '../../../mocks/test_helpers.dart';

void main() {
  group('ServiceRequestActionCard', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        graphQlClient: MockTestGraphQlClient(),
        widget: ServiceRequestActionCard(),
      );
      await tester.pumpAndSettle();
      final Finder actionCardWidget = find.byType(ActionCard);

      await tester.tap(actionCardWidget);
      await tester.pumpAndSettle();
      expect(find.byType(ServiceRequestsPage), findsOneWidget);
    });
    testWidgets(
      'should show an error widget when fetching a quote',
      (WidgetTester tester) async {
        final MockShortGraphQlClient mockShortGraphQlClient =
            MockShortGraphQlClient.withResponse(
          'idToken',
          'endpoint',
          Response(
            json.encode(<String, dynamic>{'error': 'some error occurred'}),
            201,
          ),
        );

        await buildTestWidget(
          tester: tester,
          graphQlClient: mockShortGraphQlClient,
          widget: ServiceRequestActionCard(),
        );

        final Finder actionCardWidget = find.byType(ActionCard);
        final Finder genericNoDataButton = find.byKey(genericNoDataButtonKey);

        await tester.pumpAndSettle();

        expect(actionCardWidget, findsOneWidget);

        await tester.tap(actionCardWidget);
        await tester.pumpAndSettle();
        expect(genericNoDataButton, findsOneWidget);

        await tester.tap(genericNoDataButton);
        await tester.pumpAndSettle();
        expect(actionCardWidget, findsOneWidget);
      },
    );
    testWidgets('should show a loading indicator when service requests count',
        (WidgetTester tester) async {
      final MockShortGraphQlClient mockShortGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{'loading': true}
          }),
          201,
        ),
      );
      await buildTestWidget(
        tester: tester,
        graphQlClient: mockShortGraphQlClient,
        widget: ServiceRequestActionCard(),
      );
      await tester.pump();
      expect(find.byType(SILPlatformLoader), findsOneWidget);
    });
  });
}
