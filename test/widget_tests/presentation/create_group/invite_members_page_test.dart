import 'dart:convert';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myharehubpro/application/redux/actions/core/batch_update_misc_state_action.dart';
import 'package:myharehubpro/application/redux/actions/flags/app_flags.dart';
import 'package:myharehubpro/application/redux/actions/update_connectivity_action.dart';
import 'package:myharehubpro/application/redux/states/app_state.dart';
import 'package:myharehubpro/domain/core/entities/community_members/member.dart';
import 'package:myharehubpro/domain/core/value_objects/app_strings.dart';
import 'package:myharehubpro/domain/core/value_objects/app_widget_keys.dart';
import 'package:myharehubpro/presentation/core/widgets/platform_loader.dart';
import 'package:myharehubpro/presentation/create_group/invite_members/invite_members_page.dart';
import 'package:myharehubpro/presentation/create_group/invite_members/widgets/member_list_item.dart';
import 'package:http/http.dart';

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
      const String testName = 'Sam Doe';

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
      const String testName = 'Sam Doe';

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
      final Finder genericNoDataButton = find.byKey(genericNoDataButtonKey);

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
      const String testName = 'Sam Doe';
      const String testFemaleName = 'Jane Doe';

      store.dispatch(
        BatchUpdateMiscStateAction(
          communityMembers: <Member>[
            Member.initial().copyWith(name: testName),
            Member.initial().copyWith(name: testFemaleName),
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
      store.dispatch(
        UpdateConnectivityAction(hasConnection: false),
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

      expect(find.text(connectionLostText), findsOneWidget);
    });

    testWidgets(
      'should show GenericNoDataWidget when there is no content',
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
        final Finder genericNoDataButton = find.byKey(genericNoDataButtonKey);

        expect(genericNoDataButton, findsOneWidget);
      },
    );

    testWidgets(
      'should show GenericNoDataWidget when there is no data',
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
        final Finder genericNoDataButton = find.byKey(genericNoDataButtonKey);

        expect(genericNoDataButton, findsOneWidget);
        await tester.tap(find.text(retryString));
        expect(genericNoDataButton, findsOneWidget);
      },
    );

    testWidgets('Shows loading indicator when fetching terms',
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
