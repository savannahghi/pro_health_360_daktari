import 'dart:convert';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/actions/update_connectivity_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/onboarding/core/search_facilities_page.dart';
import 'package:prohealth360_daktari/presentation/onboarding/core/widgets/facility_list_item.dart';

import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  final Store<AppState> store =
      Store<AppState>(initialState: AppState.initial());

  group('SearchFacilitiesPage', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      store.dispatch(UpdateConnectivityAction(hasConnection: true));

      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: SearchFacilitiesPage(),
      );
      await tester.pumpAndSettle();

      expect(find.byType(CustomTextField), findsOneWidget);
      expect(find.byType(FacilityListItem), findsWidgets);
      await tester.tap(find.text('Kanairo'));

      await tester.pumpAndSettle();
      expect(find.byType(SvgPicture), findsWidgets);

      final Finder searchNameFinder = find.byType(CustomTextField);
      expect(searchNameFinder, findsOneWidget);
      await tester.tap(searchNameFinder);
      await tester.enterText(searchNameFinder, '1234');

      final Finder searchBtn = find.byType(IconButton);
      await tester.tap(searchBtn);
      await tester.pumpAndSettle();

      expect(find.byType(FacilityListItem), findsNWidgets(2));
    });

    testWidgets(
        'displays error if there is no internet connection when fetching facilities by search',
        (WidgetTester tester) async {
      store.dispatch(UpdateConnectivityAction(hasConnection: false));

      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: SearchFacilitiesPage(),
      );
      
      await tester.pumpAndSettle();
      final Finder searchNameFinder = find.byType(CustomTextField);
      expect(searchNameFinder, findsOneWidget);
      await tester.tap(searchNameFinder);
      await tester.enterText(searchNameFinder, '1234');

      final Finder searchBtn = find.byType(IconButton);
      await tester.tap(searchBtn);
      await tester.pumpAndSettle();

      expect(find.text(connectionLostText), findsOneWidget);
    });

    testWidgets(
        'displays error if there is no internet connection when fetching facilities',
        (WidgetTester tester) async {
      store.dispatch(UpdateConnectivityAction(hasConnection: false));

      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: SearchFacilitiesPage(),
      );
      await tester.pumpAndSettle();

      expect(find.text(connectionLostText), findsOneWidget);
    });

    testWidgets(
      'should show GenericErrorWidget when there is no content',
      (WidgetTester tester) async {
        final MockShortGraphQlClient mockShortGraphQlClient =
            MockShortGraphQlClient.withResponse(
          'idToken',
          'endpoint',
          Response(
            json.encode(<String, dynamic>{
              'data': <String, dynamic>{'searchFacility': <dynamic>[]}
            }),
            201,
          ),
        );

        await buildTestWidget(
          tester: tester,
          graphQlClient: mockShortGraphQlClient,
          widget: SearchFacilitiesPage(),
        );

        await tester.pumpAndSettle();
        final Finder genericNoDataButton = find.byKey(helpNoDataWidgetKey);

        expect(genericNoDataButton, findsOneWidget);
      },
    );
    testWidgets(
      'should show GenericErrorWidget when there is no content when searching',
      (WidgetTester tester) async {
        final MockShortGraphQlClient mockShortGraphQlClient =
            MockShortGraphQlClient.withResponse(
          'idToken',
          'endpoint',
          Response(
            json.encode(<String, dynamic>{
              'data': <String, dynamic>{'searchFacility': <dynamic>[]}
            }),
            201,
          ),
        );

        await buildTestWidget(
          tester: tester,
          graphQlClient: mockShortGraphQlClient,
          widget: SearchFacilitiesPage(),
        );
        await tester.pumpAndSettle();
        final Finder searchNameFinder = find.byType(CustomTextField);
        expect(searchNameFinder, findsOneWidget);
        await tester.tap(searchNameFinder);
        await tester.enterText(searchNameFinder, '1234');

        final Finder searchBtn = find.byType(IconButton);
        await tester.tap(searchBtn);
        await tester.pumpAndSettle();
        await tester.pumpAndSettle();
        final Finder searchNotFound = find.byKey(searchNotFoundKey);
        final Finder retryButton = find.text('Retry');

        expect(searchNotFound, findsOneWidget);
        expect(retryButton, findsOneWidget);

        store.dispatch(UpdateConnectivityAction(hasConnection: false));

        await tester.tap(retryButton);
        await tester.pumpAndSettle();
        expect(find.text(connectionLostText), findsOneWidget);
      },
    );

    testWidgets(
      'should show GenericErrorWidget when there is no data',
      (WidgetTester tester) async {
        final MockShortGraphQlClient mockShortGraphQlClient =
            MockShortGraphQlClient.withResponse(
          'idToken',
          'endpoint',
          Response(
            json.encode(<String, dynamic>{
              'data': <String, dynamic>{'searchFacility': <dynamic>[]}
            }),
            201,
          ),
        );

        await buildTestWidget(
          tester: tester,
          graphQlClient: mockShortGraphQlClient,
          widget: SearchFacilitiesPage(),
        );
        await tester.pumpAndSettle();

        final Finder genericNoDataButton = find.byKey(helpNoDataWidgetKey);

        expect(genericNoDataButton, findsOneWidget);
        await tester.tap(genericNoDataButton);
        expect(genericNoDataButton, findsOneWidget);
      },
    );

    testWidgets('Shows loading indicator when fetching members',
        (WidgetTester tester) async {
      store.dispatch(WaitAction<AppState>.add(fetchFacilitiesFlag));

      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: SearchFacilitiesPage(),
      );

      expect(find.byType(PlatformLoader), findsOneWidget);
    });
  });
}
