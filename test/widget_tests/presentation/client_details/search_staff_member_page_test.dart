import 'dart:convert';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/actions/search_users/update_search_user_response_state_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/update_connectivity_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/presentation/client_details/pages/search_staff_member_page.dart';
import 'package:prohealth360_daktari/presentation/client_details/widgets/search_user_item.dart';
import 'package:prohealth360_daktari/presentation/onboarding/staff/add_new_staff_page.dart';
import 'package:prohealth360_daktari/presentation/search/pages/search_page_detail_view.dart';

import '../../../mocks/mocks.dart';
import '../../../mocks/test_helpers.dart';

void main() {
  final Store<AppState> store =
      Store<AppState>(initialState: AppState.initial());

  setUp(() async {
    setupFirebaseAnalyticsMocks();
    await Firebase.initializeApp();
  });
  
  group('SearchClientPage', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      store.dispatch(
        UpdateConnectivityAction(hasConnection: true),
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: const SearchStaffMemberPage(),
      );

      await tester.pump();

      final Finder searchNameFinder = find.byType(CustomTextField);
      expect(searchNameFinder, findsOneWidget);
      await tester.tap(searchNameFinder);
      await tester.enterText(searchNameFinder, '1234');

      await tester.tap(find.byType(IconButton));
      await tester.pumpAndSettle();

      expect(find.byType(SearchUserItem), findsWidgets);
      await tester.tap(find.text('User Name'));

      await tester.pumpAndSettle();
      expect(find.byType(SearchPageDetailView), findsWidgets);
    });

    testWidgets(
      'should show GenericErrorWidget when there is staff members details',
      (WidgetTester tester) async {
        final MockShortGraphQlClient mockShortGraphQlClient =
            MockShortGraphQlClient.withResponse(
          'idToken',
          'endpoint',
          Response(
            json.encode(<String, dynamic>{
              'data': <String, dynamic>{'searchStaffUser': null},
            }),
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
          widget: const SearchStaffMemberPage(),
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
        expect(find.byType(AddNewStaffPage), findsOneWidget);
      },
    );

    testWidgets('Shows loading indicator when fetching client',
        (WidgetTester tester) async {
      store.dispatch(WaitAction<AppState>.add(searchStaffMemberFlag));

      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: const SearchStaffMemberPage(),
      );

      expect(find.byType(PlatformLoader), findsOneWidget);
    });

    testWidgets('Shows error widget if there was an error',
        (WidgetTester tester) async {
      store.dispatch(
        UpdateSearchUserResponseStateAction(errorSearchingUser: true),
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: const SearchStaffMemberPage(),
      );
      store.dispatch(
        UpdateSearchUserResponseStateAction(errorSearchingUser: true),
      );

      await tester.pump();
      expect(find.byType(GenericErrorWidget), findsOneWidget);
    });
  });
}
