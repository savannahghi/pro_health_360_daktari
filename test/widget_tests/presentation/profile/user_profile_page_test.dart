// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:healthcloud/domain/core/value_objects/app_widget_keys.dart';
import 'package:healthcloud/presentation/profile/pages/user_profile_page.dart';
import 'package:healthcloud/presentation/profile/widgets/user_details_card_widget.dart'
    as local;

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
      expect(find.byType(local.UserDetailsCard), findsWidgets);
      final Finder userProfileListItem = find.byType(InformationListCard);
      final Finder backButton = find.byKey(appBarBackButtonKey);
      expect(userProfileListItem, findsNWidgets(4));
      expect(backButton, findsOneWidget);
    });
  });

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
    expect(find.byType(local.UserDetailsCard), findsWidgets);
    final Finder userProfileListItem = find.byType(InformationListCard);
    final Finder backButton = find.byKey(appBarBackButtonKey);
    expect(userProfileListItem, findsNWidgets(4));
    expect(backButton, findsOneWidget);

    await tester.tap(find.text(helpContactAdminString));
    expect(find.byType(ScaffoldMessenger), findsOneWidget);

    await tester.tap(find.text(resolvedRequestsString));
    expect(find.byType(ScaffoldMessenger), findsOneWidget);

    await tester.tap(find.text(faqsString));
    expect(find.byType(ScaffoldMessenger), findsOneWidget);

    await tester.tap(find.text(settingsString));
    expect(find.byType(ScaffoldMessenger), findsOneWidget);
  });
}
