import 'dart:convert';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/presentation/communities/invited_groups/pages/invited_groups_page.dart';
import 'package:prohealth360_daktari/presentation/communities/invited_groups/widgets/group_invite_item.dart';
import 'package:prohealth360_daktari/presentation/profile/pages/user_profile_page.dart';

import '../../../../../mocks/mocks.dart';
import '../../../../../mocks/test_helpers.dart';

void main() {
  group('Invited groups Page', () {
    late Store<AppState> store;
    final MockShortGraphQlClient mockShortSILGraphQlClient =
        MockShortGraphQlClient.withResponse(
      'idToken',
      'endpoint',
      Response(
        json.encode(<String, dynamic>{
          'data': <String, dynamic>{
            'listPendingInvites': <dynamic>[
              <String, dynamic>{
                'id': '12345',
                'name': 'Test',
                'memberCount': 3,
                'gender': <dynamic>[],
                'description': '',
                'createdBy': null
              }
            ]
          }
        }),
        201,
      ),
    );

    final MockShortGraphQlClient mockShortSILGraphQlClientWithNoData =
        MockShortGraphQlClient.withResponse(
      'idToken',
      'endpoint',
      Response(
        json.encode(<String, dynamic>{
          'data': <String, dynamic>{'listPendingInvites': <dynamic>[]}
        }),
        201,
      ),
    );

    setUpAll(() async {
      store = Store<AppState>(
        initialState: AppState.initial(),
      );
      setupFirebaseAnalyticsMocks();
      await Firebase.initializeApp();
    });

    testWidgets('renders zero experience correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: mockShortSILGraphQlClientWithNoData,
        widget: const InvitedGroupsPage(),
      );
      await tester.pumpAndSettle();

      expect(find.text(youHaveNoInvites), findsOneWidget);
      await tester.tap(find.text(okThanksText));

      await tester.pumpAndSettle();
      expect(find.byType(UserProfilePage), findsOneWidget);
    });

    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: mockShortSILGraphQlClient,
        widget: const InvitedGroupsPage(),
      );
      await tester.pumpAndSettle();

      expect(find.byType(GroupInviteItem), findsOneWidget);
    });

    testWidgets('shows loading indicator correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: mockShortSILGraphQlClient,
        widget: const InvitedGroupsPage(),
      );

      store.dispatch(WaitAction<AppState>.add(fetchInvitedCommunitiesFlag));
      await tester.pump();

      expect(find.byType(PlatformLoader), findsOneWidget);
    });
  });
}
