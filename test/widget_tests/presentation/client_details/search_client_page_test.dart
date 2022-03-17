import 'dart:convert';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mycarehubpro/application/redux/actions/flags/app_flags.dart';
import 'package:mycarehubpro/application/redux/actions/update_connectivity_action.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';
import 'package:mycarehubpro/presentation/client_details/pages/search_client_page.dart';
import 'package:mycarehubpro/presentation/client_details/widgets/search_client_item.dart';
import 'package:mycarehubpro/presentation/onboarding/patient/add_new_patient_page.dart';
import 'package:mycarehubpro/presentation/search/pages/search_page_detail_view.dart';

import '../../../mocks/mocks.dart';
import '../../../mocks/test_helpers.dart';

void main() {
  final Store<AppState> store =
      Store<AppState>(initialState: AppState.initial());

  group('SearchClientPage', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      store.dispatch(
        UpdateConnectivityAction(hasConnection: true),
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: const SearchClientPage(),
      );

      final Finder searchNameFinder = find.byType(CustomTextField);
      expect(searchNameFinder, findsOneWidget);
      await tester.tap(searchNameFinder);
      await tester.enterText(searchNameFinder, '1234');

      await tester.tap(find.byType(IconButton));
      await tester.pumpAndSettle();

      expect(find.byType(SearchClientItem), findsWidgets);
      await tester.tap(find.text('Username'));

      await tester.pumpAndSettle();
      expect(find.byType(SearchPageDetailView), findsWidgets);
    });

    testWidgets(
        'displays error if there is no internet connection when invite is tapped',
        (WidgetTester tester) async {
      store.dispatch(
        UpdateConnectivityAction(hasConnection: false),
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: const SearchClientPage(),
      );

      final Finder searchNameFinder = find.byType(CustomTextField);
      expect(searchNameFinder, findsOneWidget);
      await tester.tap(searchNameFinder);
      await tester.enterText(searchNameFinder, '1234');

      await tester.tap(find.byType(IconButton));
      await tester.pumpAndSettle();
      expect(find.text(connectionLostText), findsOneWidget);
    });

    testWidgets(
      'should show GenericErrorWidget when there is client details',
      (WidgetTester tester) async {
        final MockShortGraphQlClient mockShortGraphQlClient =
            MockShortGraphQlClient.withResponse(
          'idToken',
          'endpoint',
          Response(
            json.encode(<String, dynamic>{'error': 'error occured'}),
            201,
          ),
        );

        store.dispatch(
          UpdateConnectivityAction(hasConnection: true),
        );

        await buildTestWidget(
          tester: tester,
          store: store,
          graphQlClient: mockShortGraphQlClient,
          widget: const SearchClientPage(),
        );

        final Finder searchNameFinder = find.byType(CustomTextField);
        expect(searchNameFinder, findsOneWidget);
        await tester.tap(searchNameFinder);
        await tester.enterText(searchNameFinder, '1234');

        await tester.tap(find.byType(IconButton));
        await tester.pumpAndSettle();

        final Finder genericNoDataButton =
            find.byKey(const Key('search_not_found_key'));
        expect(genericNoDataButton, findsOneWidget);

        await tester.tap(genericNoDataButton);
        await tester.pumpAndSettle();
        expect(find.byType(AddNewPatientPage), findsOneWidget);
      },
    );

    testWidgets('Shows loading indicator when fetching client',
        (WidgetTester tester) async {
      store.dispatch(WaitAction<AppState>.add(searchClientFlag));

      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: const SearchClientPage(),
      );

      expect(find.byType(PlatformLoader), findsOneWidget);
    });
  });
}
