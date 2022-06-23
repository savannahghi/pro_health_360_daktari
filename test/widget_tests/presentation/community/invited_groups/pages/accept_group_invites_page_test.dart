import 'dart:convert';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/presentation/communities/invited_groups/pages/accept_group_invites_page.dart';
import 'package:prohealth360_daktari/presentation/profile/pages/user_profile_page.dart';
import 'package:prohealth360_daktari/presentation/router/routes.dart';

import '../../../../../mocks/mocks.dart';
import '../../../../../mocks/test_helpers.dart';

void main() {
  group('AcceptGroupInvitations Page', () {
    late Store<AppState> store;
    final MockShortGraphQlClient mockShortSILGraphQlClient =
        MockShortGraphQlClient.withResponse(
      'idToken',
      'endpoint',
      Response(
        json.encode(
          <String, dynamic>{
            'data': <String, dynamic>{
              'acceptInvitation': true,
            }
          },
        ),
        201,
      ),
    );

    final MockShortGraphQlClient rejectMockShortSILGraphQlClient =
        MockShortGraphQlClient.withResponse(
      'idToken',
      'endpoint',
      Response(
        json.encode(
          <String, dynamic>{
            'data': <String, dynamic>{
              'rejectInvitation': true,
            }
          },
        ),
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

    testWidgets('renders correctly and accepts invitation',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: mockShortSILGraphQlClient,
        widget: const AcceptGroupInvitesPage(
          groupId: '',
          groupName: '',
          numberOfMembers: 0,
          acceptInviteRoute: AppRoutes.profilePage,
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(MyAfyaHubPrimaryButton), findsNWidgets(2));
      expect(find.text(joinGroup), findsOneWidget);
      expect(find.text(declineInvite), findsOneWidget);

      await tester.tap(find.text(joinGroup));
      await tester.pumpAndSettle();

      expect(find.byType(UserProfilePage), findsOneWidget);
    });
    testWidgets('renders correctly and rejects an invitation',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: rejectMockShortSILGraphQlClient,
        widget: const AcceptGroupInvitesPage(
          groupId: '',
          groupName: '',
          numberOfMembers: 0,
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(MyAfyaHubPrimaryButton), findsNWidgets(2));
      expect(find.text(joinGroup), findsOneWidget);
      expect(find.text(declineInvite), findsOneWidget);

      await tester.tap(find.text(declineInvite));
      await tester.pumpAndSettle();

      expect(find.byType(UserProfilePage), findsOneWidget);
    });
  });
}
