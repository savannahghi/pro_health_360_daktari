// Package imports:
import 'dart:convert';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mycarehubpro/application/redux/actions/flags/app_flags.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';

// Project imports:
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_widget_keys.dart';
import 'package:mycarehubpro/presentation/core/app_bar/custom_app_bar.dart';
import 'package:mycarehubpro/presentation/service_requests/pages/pin_reset_requests_page.dart';
import 'package:mycarehubpro/presentation/service_requests/pages/red_flags_page.dart';
import 'package:mycarehubpro/presentation/service_requests/pages/service_requests_page.dart';
import 'package:http/http.dart';
import '../../../mocks/mocks.dart';
import '../../../mocks/test_helpers.dart';

void main() {
  group('ServiceRequestsPage', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets('should show red flags requests', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        widget: const ServiceRequestsPage(),
        graphQlClient: MockTestGraphQlClient(),
      );
      await tester.pumpAndSettle();

      expect(find.byType(CustomAppBar), findsOneWidget);
      expect(find.text(serviceRequestString), findsOneWidget);

      await tester.tap(find.text(redFlagString));
      await tester.pumpAndSettle();

      expect(find.text(serviceRequestString), findsNothing);
      await tester.tap(find.byKey(appBarBackButtonKey));
      await tester.pumpAndSettle();
      expect(find.text(serviceRequestString), findsOneWidget);
    });

    testWidgets('should show pin reset requests', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        widget: const ServiceRequestsPage(),
        graphQlClient: MockTestGraphQlClient(),
      );

      await tester.pumpAndSettle();

      await tester.tap(find.text(clientPINResetString));
      await tester.pumpAndSettle();
      expect(find.byType(PinResetRequestsPage), findsOneWidget);
    });

    testWidgets('genericNoData widget is tappable',
        (WidgetTester tester) async {
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
        widget: const ServiceRequestsPage(),
      );
      await tester.pumpAndSettle();

      expect(find.text(actionTextGenericNoData), findsOneWidget);
      await tester.tap(find.text(actionTextGenericNoData));
      await tester.pumpAndSettle();
      expect(find.byType(RedFlagsPage), findsNothing);
    });

    testWidgets('profile updates ActionCard is tappable',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        graphQlClient: MockTestGraphQlClient(),
        store: store,
        widget: const ServiceRequestsPage(),
      );
      final Finder profileUpdateActionCard =
          find.byKey(profileUpdateActionCardKey);
      await tester.scrollUntilVisible(profileUpdateActionCard, 500);
      await tester.pumpAndSettle();
      expect(profileUpdateActionCard, findsOneWidget);

      await tester.tap(profileUpdateActionCard);
      await tester.pumpAndSettle();
      expect(profileUpdateActionCard, findsNothing);
    });

    testWidgets(
        'should navigate to client service requests page when the '
        'staff PIN resets card is tapped', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        graphQlClient: MockTestGraphQlClient(),
        store: store,
        widget: const ServiceRequestsPage(),
      );
      final Finder staffPinResetActionCard =
          find.byKey(staffPINResetActionCardKey);
      await tester.scrollUntilVisible(staffPinResetActionCard, 500);
      await tester.pumpAndSettle();
      expect(staffPinResetActionCard, findsOneWidget);

      await tester.tap(staffPinResetActionCard);
      await tester.pumpAndSettle();

      expect(find.byType(PinResetRequestsPage), findsOneWidget);
    });

    testWidgets(
      'should show an error widget when fetching service request count',
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
          store: store,
          graphQlClient: mockShortGraphQlClient,
          widget: const ServiceRequestsPage(),
        );

        await tester.pumpAndSettle();
        final Finder genericNoDataButton = find.byKey(helpNoDataWidgetKey);

        expect(genericNoDataButton, findsOneWidget);

        /// Refresh and expect the same thing
        await tester.ensureVisible(genericNoDataButton);
        await tester.pumpAndSettle();
        await tester.tap(find.byKey(helpNoDataWidgetKey));

        await tester.pumpAndSettle();
        expect(genericNoDataButton, findsOneWidget);
      },
    );

    testWidgets(
        'should show a loading indicator when fetching service request count',
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
      store.dispatch(WaitAction<AppState>.add(fetchServiceRequestsCountFlag));
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: mockShortGraphQlClient,
        widget: const ServiceRequestsPage(),
      );

      expect(find.byType(PlatformLoader), findsOneWidget);
    });
  });
}
