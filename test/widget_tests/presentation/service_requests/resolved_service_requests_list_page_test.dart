// Package imports:
import 'dart:convert';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mycarehubpro/application/redux/actions/flags/app_flags.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';

// Project imports:
import 'package:mycarehubpro/domain/core/value_objects/app_widget_keys.dart';
import 'package:mycarehubpro/presentation/core/app_bar/custom_app_bar.dart';
import 'package:http/http.dart';
import 'package:mycarehubpro/presentation/service_requests/pages/resolved_service_requests_list_page.dart';
import 'package:mycarehubpro/presentation/service_requests/widgets/resolved_service_request_list_item.dart';
import '../../../mocks/mocks.dart';
import '../../../mocks/test_helpers.dart';

void main() {
  group('ResolvedServiceRequestsListPage', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
    });
    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: const ResolvedServiceRequestsListPage(
          flavour: Flavour.pro,
        ),
      );
      await tester.pumpAndSettle();
      final Finder redFlagItem = find.byType(ResolvedServiceRequestListItem);

      expect(find.byType(CustomAppBar), findsOneWidget);
      expect(redFlagItem, findsNWidgets(5));
    });
    testWidgets(
      'should show an error widget when fetching service requests',
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
          widget: const ResolvedServiceRequestsListPage(
            flavour: Flavour.consumer,
          ),
        );

        await tester.pumpAndSettle();
        final Finder genericNoDataButton = find.byKey(helpNoDataWidgetKey);

        expect(genericNoDataButton, findsOneWidget);

        /// Refresh and expect the same thing
        await tester.ensureVisible(genericNoDataButton);
        await tester.pumpAndSettle();
        await tester.tap(genericNoDataButton);
        await tester.pumpAndSettle();
        expect(genericNoDataButton, findsOneWidget);
      },
    );
    testWidgets(
      'should show GenericErrorWidget when there is no content',
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
          widget: const ResolvedServiceRequestsListPage(
            flavour: Flavour.consumer,
          ),
        );

        await tester.pumpAndSettle();
        final Finder genericNoDataButton = find.byKey(helpNoDataWidgetKey);

        expect(genericNoDataButton, findsOneWidget);
      },
    );
    testWidgets('shows loading indicator when fetching service requests',
        (WidgetTester tester) async {
      store.dispatch(WaitAction<AppState>.add(fetchServiceRequestFlag));
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: const ResolvedServiceRequestsListPage(
          flavour: Flavour.consumer,
        ),
      );

      expect(find.byType(PlatformLoader), findsOneWidget);
    });
  });
}
