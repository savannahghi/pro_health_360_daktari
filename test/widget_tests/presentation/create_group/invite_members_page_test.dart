import 'dart:convert';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mycarehubpro/application/redux/actions/core/batch_update_misc_state_action.dart';
import 'package:mycarehubpro/application/redux/actions/flags/app_flags.dart';
import 'package:mycarehubpro/application/redux/actions/update_connectivity_action.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/domain/core/entities/community_members/member.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_widget_keys.dart';
import 'package:mycarehubpro/presentation/create_group/invite_members/invite_members_page.dart';
import 'package:mycarehubpro/presentation/create_group/invite_members/widgets/member_list_item.dart';

import '../../../mocks/mocks.dart';
import '../../../mocks/test_helpers.dart';

void main() {
  final Store<AppState> store =
      Store<AppState>(initialState: AppState.initial());

  group('InviteMembersPage', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      store.dispatch(
        UpdateConnectivityAction(hasConnection: true),
      );
      const String testName = 'Sam';

      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: const InviteMembersPage(
          channelId: 'some-channel-id',
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(CustomTextField), findsOneWidget);
      expect(find.byType(MemberListItem), findsWidgets);
      await tester.tap(find.text(testName));

      await tester.pumpAndSettle();
      expect(find.byType(SvgPicture), findsWidgets);

      final Finder searchNameFinder = find.byType(CustomTextField);
      expect(searchNameFinder, findsOneWidget);
      await tester.tap(searchNameFinder);
      await tester.enterText(searchNameFinder, 'David');

      final Finder submitBtn = find.byKey(inviteMembersBtnKey);
      await tester.ensureVisible(submitBtn);
      await tester.tap(submitBtn);
      await tester.pumpAndSettle();

      expect(find.byType(ScaffoldMessenger), findsOneWidget);
    });

    testWidgets('search renders correctly', (WidgetTester tester) async {
      store.dispatch(
        UpdateConnectivityAction(hasConnection: true),
      );
      const String testName = 'Sam';

      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: const InviteMembersPage(channelId: 'some-channel-id'),
      );

      await tester.pumpAndSettle();

      expect(find.byType(CustomTextField), findsOneWidget);

      final Finder searchNameFinder = find.byType(CustomTextField);
      expect(searchNameFinder, findsOneWidget);
      await tester.tap(searchNameFinder);
      await tester.enterText(searchNameFinder, testName);

      await tester.tap(find.byType(IconButton));
      await tester.pumpAndSettle();

      expect(find.byType(MemberListItem), findsWidgets);

      expect(searchNameFinder, findsOneWidget);
      await tester.tap(searchNameFinder);
      await tester.enterText(searchNameFinder, 'Martin Luther');

      await tester.tap(find.byType(IconButton));
      await tester.pumpAndSettle();
      expect(find.byType(ScaffoldMessenger), findsOneWidget);

      store.dispatch(
        BatchUpdateMiscStateAction(
          communityMembers: <Member>[],
        ),
      );

      store.dispatch(
        UpdateConnectivityAction(hasConnection: false),
      );

      expect(searchNameFinder, findsOneWidget);
      await tester.tap(searchNameFinder);
      await tester.enterText(searchNameFinder, 'Martin Luther');

      await tester.tap(find.byType(IconButton));
      await tester.pumpAndSettle();
      expect(find.byType(ScaffoldMessenger), findsOneWidget);
      await tester.pumpAndSettle();

      // close snackbar
      await tester.tap(find.text(closeString));
      await tester.pumpAndSettle();

      final Finder genericNoDataButton =
          find.byKey(const Key('search_not_found_key'));

      expect(genericNoDataButton, findsOneWidget);
      await tester.ensureVisible(genericNoDataButton);
      await tester.tap(genericNoDataButton);
      await tester.pumpAndSettle();
      expect(genericNoDataButton, findsOneWidget);
    });

    testWidgets(
        'displays error if there is no internet connection when invite is tapped',
        (WidgetTester tester) async {
      store.dispatch(
        UpdateConnectivityAction(hasConnection: true),
      );
      const String testName = 'Sam';
      const String testFemaleName = 'Jane';

      store.dispatch(
        BatchUpdateMiscStateAction(
          communityMembers: <Member>[
            Member.initial().copyWith(username: testName),
            Member.initial().copyWith(username: testFemaleName),
            Member.initial(),
          ],
        ),
      );
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: const InviteMembersPage(
          channelId: 'some-channel-id',
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(CustomTextField), findsOneWidget);
      expect(find.byType(MemberListItem), findsWidgets);
      await tester.tap(find.text(testName));
      await tester.pumpAndSettle();
      await tester.tap(find.text(testFemaleName));
      await tester.pumpAndSettle();
      await tester.tap(find.text(testFemaleName));
      await tester.pumpAndSettle();
      await tester.tap(find.text(testFemaleName));
      await tester.pumpAndSettle();
      expect(find.byType(SvgPicture), findsWidgets);

      final Finder searchNameFinder = find.byType(CustomTextField);
      expect(searchNameFinder, findsOneWidget);
      await tester.tap(searchNameFinder);
      await tester.enterText(searchNameFinder, 'David');

      store.dispatch(
        UpdateConnectivityAction(hasConnection: false),
      );

      final Finder submitBtn = find.byKey(inviteMembersBtnKey);
      await tester.ensureVisible(submitBtn);
      await tester.tap(submitBtn);
      await tester.pumpAndSettle();

      expect(find.byType(ScaffoldMessenger), findsOneWidget);
    });

    testWidgets(
        'displays error if there is no internet connection when fetching members',
        (WidgetTester tester) async {
      store.dispatch(UpdateConnectivityAction(hasConnection: false));

      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: const InviteMembersPage(channelId: 'some-channel-id'),
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
              'data': <String, dynamic>{'listMembers': <dynamic>[]}
            }),
            201,
          ),
        );

        await buildTestWidget(
          tester: tester,
          graphQlClient: mockShortGraphQlClient,
          widget: const InviteMembersPage(
            channelId: 'some-channel-id',
          ),
        );

        await tester.pumpAndSettle();
        final Finder genericNoDataButton = find.byKey(helpNoDataWidgetKey);

        expect(genericNoDataButton, findsOneWidget);
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
              'data': <String, dynamic>{'listMembers': <dynamic>[]}
            }),
            201,
          ),
        );

        await buildTestWidget(
          tester: tester,
          graphQlClient: mockShortGraphQlClient,
          widget: const InviteMembersPage(
            channelId: 'some-channel-id',
          ),
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
      store.dispatch(WaitAction<AppState>.add(fetchMembersFlag));

      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: const InviteMembersPage(
          channelId: 'some-channel-id',
        ),
      );

      expect(find.byType(PlatformLoader), findsOneWidget);
    });
  });
}
