// Package imports:
import 'dart:convert';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';

// Project imports:
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/core/app_bar/custom_app_bar.dart';
import 'package:prohealth360_daktari/presentation/service_requests/pages/red_flag_actions_page.dart';
import 'package:prohealth360_daktari/presentation/service_requests/pages/red_flags_page.dart';
import 'package:prohealth360_daktari/presentation/service_requests/widgets/red_flag_list_item.dart';
import 'package:http/http.dart';
import '../../../mocks/mocks.dart';
import '../../../mocks/test_helpers.dart';

void main() {
  group('RedFlagsPage', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: RedFlagsPage(),
      );
      await tester.pumpAndSettle();
      final Finder redFlagItem = find.byType(RedFlagListItem);

      expect(find.byType(CustomAppBar), findsOneWidget);
      expect(redFlagItem, findsNWidgets(5));

      final Finder searchNameFinder = find.byType(CustomTextField);
      expect(searchNameFinder, findsOneWidget);
      await tester.tap(searchNameFinder);
      await tester.enterText(searchNameFinder, 'test');

      final Finder searchBtn = find.byType(IconButton);
      await tester.tap(searchBtn);
      await tester.pumpAndSettle();

      expect(redFlagItem, findsNWidgets(5));
    });

    testWidgets('should refresh red flags correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: RedFlagsPage(),
      );
      await tester.pumpAndSettle();

      final Finder redFlagItem = find.byType(RedFlagListItem);

      expect(find.byType(CustomAppBar), findsOneWidget);
      expect(redFlagItem, findsNWidgets(5));

      await tester.fling(
        find.byType(RedFlagListItem).first,
        const Offset(0.0, 300.0),
        1000.0,
      );

      await tester.pumpAndSettle();

      expect(find.byType(CustomAppBar), findsOneWidget);
      expect(redFlagItem, findsNWidgets(5));
    });

    testWidgets('Routes to RedFlagActionsPage correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: RedFlagsPage(),
      );
      await tester.pumpAndSettle();
      final Finder redFlagListItem = find.byType(RedFlagListItem);

      await tester.tap(redFlagListItem.first);
      await tester.pumpAndSettle();

      expect(find.byType(RedFlagActionsPage), findsOneWidget);
    });

    testWidgets(
      'should show GenericErrorWidget when there is no red flags when searching',
      (WidgetTester tester) async {
        final MockShortGraphQlClient mockShortGraphQlClient =
            MockShortGraphQlClient.withResponse(
          'idToken',
          'endpoint',
          Response(
            json.encode(<String, dynamic>{
              'data': <String, dynamic>{
                'getServiceRequests': mockServiceRequestsResponse,
                'searchServiceRequests': <dynamic>[]
              }
            }),
            201,
          ),
        );

        await buildTestWidget(
          tester: tester,
          graphQlClient: mockShortGraphQlClient,
          store: store,
          widget: RedFlagsPage(),
        );
        await tester.pumpAndSettle();
        final Finder redFlagItem = find.byType(RedFlagListItem);

        expect(find.byType(CustomAppBar), findsOneWidget);
        expect(redFlagItem, findsNWidgets(5));

        final Finder searchNameFinder = find.byType(CustomTextField);
        expect(searchNameFinder, findsOneWidget);
        await tester.tap(searchNameFinder);
        await tester.enterText(searchNameFinder, 'test');

        final Finder searchBtn = find.byType(IconButton);
        await tester.tap(searchBtn);
        await tester.pumpAndSettle();

        expect(redFlagItem, findsNothing);
        expect(find.byType(GenericErrorWidget), findsOneWidget);
      },
    );

    testWidgets(
      'should show an error widget when fetching red flags',
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
          widget: RedFlagsPage(),
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

    testWidgets('should show a loading indicator when fetching red flags',
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
      store.dispatch(WaitAction<AppState>.add(fetchServiceRequestFlag));
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: mockShortGraphQlClient,
        widget: RedFlagsPage(),
      );

      expect(find.byType(PlatformLoader), findsOneWidget);
    });

    testWidgets('genericNoData widget if no data present',
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
        widget: RedFlagsPage(),
      );
      await tester.pumpAndSettle();

      expect(find.text(actionTextGenericNoData), findsOneWidget);
      await tester.tap(find.text(actionTextGenericNoData));
      await tester.pumpAndSettle();
      expect(find.byType(RedFlagsPage), findsNothing);
    });
  });
}
