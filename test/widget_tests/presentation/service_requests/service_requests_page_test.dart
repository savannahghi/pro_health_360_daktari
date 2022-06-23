// Package imports:
import 'dart:convert';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
// Project imports:
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/core/app_bar/custom_app_bar.dart';
import 'package:prohealth360_daktari/presentation/engagement/home/pages/home_page.dart';
import 'package:prohealth360_daktari/presentation/router/routes.dart';
import 'package:prohealth360_daktari/presentation/service_requests/pages/pin_reset_requests_page.dart';
import 'package:prohealth360_daktari/presentation/service_requests/pages/red_flags_page.dart';
import 'package:prohealth360_daktari/presentation/service_requests/pages/screening_tools_list_page.dart';
import 'package:prohealth360_daktari/presentation/service_requests/pages/service_requests_page.dart';
import 'package:prohealth360_daktari/presentation/service_requests/pages/staff_pin_reset_requests_page.dart';

import '../../../mocks/mocks.dart';
import '../../../mocks/test_helpers.dart';

void main() {
  group('ServiceRequestsPage', () {
    late Store<AppState> store;

    setUp(() async {
      store = Store<AppState>(initialState: AppState.initial());

      setupFirebaseMessagingMocks();
      await Firebase.initializeApp();
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

      await tester.tap(find.text('${redFlagString}s'));
      await tester.pumpAndSettle();

      expect(find.text(serviceRequestString), findsNothing);
      await tester.tap(find.byKey(appBarBackButtonKey));
      await tester.pumpAndSettle();
      expect(find.text(serviceRequestString), findsOneWidget);
    });

    testWidgets('should refresh service request items correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        widget: const ServiceRequestsPage(),
        graphQlClient: MockTestGraphQlClient(),
      );
      await tester.pumpAndSettle();

      await tester.fling(
        find.text('${redFlagString}s'),
        const Offset(0.0, 300.0),
        1000.0,
      );
      await tester.pumpAndSettle();
      expect(find.text('${redFlagString}s'), findsOneWidget);
    });

    testWidgets('should show pin reset requests', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        widget: const ServiceRequestsPage(),
        graphQlClient: MockTestGraphQlClient(),
      );

      await tester.pumpAndSettle();

      final Finder clientPINReset = find.text(clientPINResetString);
      final Finder screeningToolsActionCard =
          find.byKey(screeningToolsActionCardKey);

      await tester.ensureVisible(clientPINReset);
      await tester.tap(clientPINReset);
      await tester.pumpAndSettle();
      expect(find.byType(PinResetRequestsPage), findsOneWidget);

      await tester.tap(find.byKey(appBarBackButtonKey));
      await tester.pumpAndSettle();
      await tester.ensureVisible(screeningToolsActionCard);
      await tester.tap(screeningToolsActionCard);
      await tester.pumpAndSettle();
      expect(find.byType(ScreeningToolsListPage), findsOneWidget);
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
        store: store,
        graphQlClient: mockShortGraphQlClient,
        widget: Builder(
          builder: (BuildContext context) {
            return MaterialButton(
              onPressed: () => Navigator.pushNamed(
                context,
                AppRoutes.serviceRequestsPage,
              ),
            );
          },
        ),
      );
      await tester.pumpAndSettle();
      await tester.tap(find.byType(MaterialButton));
      await tester.pumpAndSettle();

      expect(find.text(actionTextGenericNoData), findsOneWidget);
      await tester.tap(find.text(actionTextGenericNoData));
      await tester.pumpAndSettle();
      expect(find.byType(RedFlagsPage), findsNothing);
    });
    testWidgets('genericNoData widget is tappable and routes to HomePage',
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
        store: store,
        graphQlClient: mockShortGraphQlClient,
        widget: const ServiceRequestsPage(),
      );
      await tester.pumpAndSettle();

      expect(find.text(actionTextGenericNoData), findsOneWidget);
      await tester.tap(find.byKey(helpNoDataWidgetKey));
      await tester.pumpAndSettle();
      expect(find.byType(HomePage), findsOneWidget);
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

      await tester.pumpAndSettle();

      final Finder staffPinResetActionCard =
          find.byKey(staffPINResetActionCardKey);
      await tester.scrollUntilVisible(staffPinResetActionCard, 500);
      await tester.pumpAndSettle();
      expect(staffPinResetActionCard, findsOneWidget);

      await tester.tap(staffPinResetActionCard);
      await tester.pumpAndSettle();

      expect(find.byType(StaffPinResetRequestsPage), findsOneWidget);
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
