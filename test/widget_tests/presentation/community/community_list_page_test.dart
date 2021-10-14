import 'package:flutter_test/flutter_test.dart';
import 'package:healthcloud/domain/core/value_objects/app_widget_keys.dart';
import 'package:healthcloud/presentation/community/community_list_page.dart';

import '../../../mocks/test_helpers.dart';

void main() {
  group('CommunityListItem', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        widget: const CommunityListViewPage(),
      );

      expect(find.byKey(communityListViewKey), findsOneWidget);
    });
  });
}
