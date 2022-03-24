import 'package:flutter_test/flutter_test.dart';
import 'package:mycarehubpro/presentation/community/group_info/widgets/group_member_item.dart';

import '../../../mocks/test_helpers.dart';

void main() {
  group('GroupMemberItem', () {
    testWidgets('should display moderator badge if isModerator',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        widget: const GroupMemberItem(
          userName: 'userName',
          memberID: 'memberID',
          communityId: 'communityId',
          communityName: 'communityName',
          isModerator: true,
        ),
      );

      expect(find.text('Moderator'), findsOneWidget);
    });
  });
}
