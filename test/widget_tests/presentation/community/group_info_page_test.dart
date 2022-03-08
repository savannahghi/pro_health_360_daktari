import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myharehubpro/application/redux/states/app_state.dart';
import 'package:myharehubpro/domain/core/value_objects/app_strings.dart';
import 'package:myharehubpro/domain/core/value_objects/app_widget_keys.dart';
import 'package:myharehubpro/presentation/community/group_info/pages/group_info_page.dart';
import 'package:myharehubpro/presentation/create_group/invite_members/invite_members_page.dart';

import '../../../mocks/test_helpers.dart';

void main() {
  group('Group info page', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        widget: const GroupInfoPage(channelId: ''),
      );

      expect(find.byKey(inviteMembersButtonKey), findsOneWidget);
      expect(find.text(groupTitle), findsOneWidget);
    });
    testWidgets('invite members button navigates correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        widget: const GroupInfoPage(channelId: ''),
      );

      expect(find.byKey(inviteMembersButtonKey), findsOneWidget);
      expect(find.text(groupTitle), findsOneWidget);

      await tester.tap(find.byKey(inviteMembersButtonKey));
      await tester.pumpAndSettle();

      expect(find.byType(InviteMembersPage), findsOneWidget);
    });

    testWidgets('tap function works correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        widget: const GroupInfoPage(channelId: ''),
      );

      expect(find.byKey(inviteMembersButtonKey), findsOneWidget);
      expect(find.text(groupTitle), findsOneWidget);
      final Finder memberItemFinder = find.byType(GestureDetector).first;
      expect(memberItemFinder, findsOneWidget);

      await tester.tap(memberItemFinder);
      await tester.pumpAndSettle();

      expect(find.byType(Dialog, skipOffstage: false), findsOneWidget);
    });
  });
}
