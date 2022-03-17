import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mycarehubpro/application/redux/actions/flags/app_flags.dart';
import 'package:mycarehubpro/application/redux/actions/update_connectivity_action.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/presentation/client_details/pages/search_staff_member_page.dart';

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
        widget: const SearchStaffMemberPage(),
      );

      final Finder searchNameFinder = find.byType(CustomTextField);
      expect(searchNameFinder, findsOneWidget);
      await tester.tap(searchNameFinder);
      await tester.enterText(searchNameFinder, '1234');

      await tester.tap(find.byType(IconButton));
      await tester.pumpAndSettle();

      await tester.pumpAndSettle();
      expect(find.byType(SnackBar), findsOneWidget);
    });

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
  });
}
