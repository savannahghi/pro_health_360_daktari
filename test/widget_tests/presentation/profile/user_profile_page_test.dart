// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:afya_moja_core/information_list_card.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:healthcloud/application/core/services/utils.dart';
import 'package:healthcloud/domain/core/value_objects/app_widget_keys.dart';
import 'package:healthcloud/presentation/profile/pages/user_profile_page.dart';
import 'package:healthcloud/presentation/profile/widgets/user_details_card_widget.dart';
import '../../../mocks/test_helpers.dart';

void main() {
  group('UserProfilePage', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        widget: Builder(
          builder: (BuildContext context) {
            return UserProfilePage();
          },
        ),
      );
      await tester.pumpAndSettle();
      expect(find.byType(UserDetailsCard), findsWidgets);
      final Finder userProfileListItem = find.byType(InformationListCard);
      final Finder backButton = find.byKey(appBarBackButtonKey);
      expect(userProfileListItem, findsNWidgets(userProfileItems.length));
      expect(backButton, findsOneWidget);

      await tester.ensureVisible(backButton);
      await tester.tap(backButton);
      await tester.pumpAndSettle();
      expect(backButton, findsNothing);
    });
  });
}
