// Package imports:
import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:healthcloud/application/redux/actions/flags/app_flags.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';

// Project imports:
import 'package:healthcloud/domain/core/value_objects/app_widget_keys.dart';
import 'package:healthcloud/presentation/core/app_bar/custom_app_bar.dart';
import 'package:healthcloud/presentation/core/widgets/platform_loader.dart';
import 'package:healthcloud/presentation/service_requests/pages/resolved_service_requests_page.dart';
import 'package:healthcloud/presentation/service_requests/widgets/red_flag_list_item.dart';
import 'package:http/http.dart';
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
        widget: ResolvedServiceRequestsPage(),
      );
      await tester.pumpAndSettle();
      final Finder redFlagItem = find.byType(RedFlagListItem);

      expect(find.byType(CustomAppBar), findsOneWidget);
      expect(redFlagItem, findsOneWidget);
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
          widget: ResolvedServiceRequestsPage(),
        );

        await tester.pumpAndSettle();
        final Finder genericNoDataButton = find.byKey(genericNoDataButtonKey);

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
      'should show GenericNoDataWidget when there is no content',
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
          widget: ResolvedServiceRequestsPage(),
        );

        await tester.pumpAndSettle();
        final Finder genericNoDataButton = find.byKey(genericNoDataButtonKey);

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
        widget: ResolvedServiceRequestsPage(),
      );

      expect(find.byType(PlatformLoader), findsOneWidget);
    });
  });
}
