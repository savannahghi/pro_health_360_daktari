import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:healthcloud/domain/core/value_objects/app_widget_keys.dart';
import 'package:healthcloud/presentation/create_group/invite_members/invite_members_page.dart';
import 'package:healthcloud/presentation/create_group/invite_members/widgets/member_list_item.dart';

import '../../../mocks/test_helpers.dart';

void main() {
  group('InviteMembersPage', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(tester: tester, widget: const InviteMembersPage());

      expect(find.byType(CustomTextField), findsOneWidget);
      expect(find.byType(MemberListItem), findsWidgets);

      final Finder searchNameFinder = find.byType(CustomTextField);
      expect(searchNameFinder, findsOneWidget);
      await tester.tap(searchNameFinder);
      await tester.enterText(searchNameFinder, 'David');

      final Finder submitBtn = find.byKey(inviteMembersBtnKey);
      await tester.ensureVisible(submitBtn);
      await tester.tap(submitBtn);
      await tester.pumpAndSettle();
      // TODO (paul) to implement submit button expectation
    });
  });
}
