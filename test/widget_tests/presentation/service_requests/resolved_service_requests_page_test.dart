// Package imports:
import 'dart:convert';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';

// Project imports:
import 'package:mycarehubpro/domain/core/value_objects/app_widget_keys.dart';
import 'package:mycarehubpro/presentation/core/app_bar/custom_app_bar.dart';
import 'package:mycarehubpro/presentation/engagement/home/widgets/action_card.dart';
import 'package:mycarehubpro/presentation/service_requests/pages/resolved_service_requests_list_page.dart';
import 'package:mycarehubpro/presentation/service_requests/pages/resolved_service_requests_page.dart';
import '../../../mocks/mocks.dart';
import '../../../mocks/test_helpers.dart';

void main() {
  group('ResolvedServiceRequestsPage', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
    });
    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: const ResolvedServiceRequestsPage(),
      );
      await tester.pumpAndSettle();
      final Finder actionCard = find.byType(ActionCard);

      expect(find.byType(CustomAppBar), findsOneWidget);
      expect(actionCard, findsNWidgets(2));
    });
    testWidgets(
        'staff action card launches ResolvedServiceRequestsListPage correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: const ResolvedServiceRequestsPage(),
      );
      await tester.pumpAndSettle();
      final Finder staffActionCard =
          find.byKey(resolvedStaffRequestsActionCardKey);
      expect(staffActionCard, findsOneWidget);

      await tester.tap(staffActionCard);
      await tester.pumpAndSettle();
      expect(find.byType(ResolvedServiceRequestsListPage), findsOneWidget);
      expect(
        find.text(getResolvedServiceRequestsListTitle(Flavour.pro)),
        findsOneWidget,
      );
    });
    testWidgets(
        'client action card launches ResolvedServiceRequestsListPage correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: const ResolvedServiceRequestsPage(),
      );
      await tester.pumpAndSettle();
      final Finder clientActionCard =
          find.byKey(resolvedClientRequestsActionCardKey);
      expect(clientActionCard, findsOneWidget);

      await tester.tap(clientActionCard);
      await tester.pumpAndSettle();
      expect(find.byType(ResolvedServiceRequestsListPage), findsOneWidget);
      expect(
        find.text(getResolvedServiceRequestsListTitle(Flavour.consumer)),
        findsOneWidget,
      );
    });
    testWidgets(
        'ResolvedServiceRequestsListPage routes back to ResolvedServiceRequestsPage correctly if there are no items ',
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
        widget: const ResolvedServiceRequestsPage(),
      );
      await tester.pumpAndSettle();
      final Finder clientActionCard =
          find.byKey(resolvedClientRequestsActionCardKey);

      final Finder genericNoDataButton = find.byKey(helpNoDataWidgetKey);
      expect(clientActionCard, findsOneWidget);

      await tester.tap(clientActionCard);
      await tester.pumpAndSettle();
      expect(genericNoDataButton, findsOneWidget);

      await tester.tap(genericNoDataButton);
      await tester.pumpAndSettle();
      expect(find.byType(ResolvedServiceRequestsPage), findsOneWidget);
    });
  });
}
