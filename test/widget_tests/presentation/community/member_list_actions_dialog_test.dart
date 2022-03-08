import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myharehubpro/domain/core/value_objects/app_widget_keys.dart';
import 'package:myharehubpro/presentation/community/group_info/widgets/member_list_actions_dialog.dart';

import '../../../mocks/test_helpers.dart';

void main() {
  group('MemberListActionsDialog', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        widget: const MemberListActionsDialog(memberID: ''),
      );

      expect(find.byType(Dialog), findsOneWidget);
      expect(find.byType(MyAfyaHubPrimaryButton), findsNWidgets(2));
      expect(find.byKey(promoteButtonKey), findsOneWidget);
      expect(find.byKey(removeButtonKey), findsOneWidget);
    });

    testWidgets('promote button works correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        widget: const MemberListActionsDialog(memberID: ''),
      );
      final Finder promoteKeyFinder = find.byKey(promoteButtonKey);
      expect(find.byType(Dialog), findsOneWidget);
      expect(find.byType(MyAfyaHubPrimaryButton), findsNWidgets(2));
      expect(promoteKeyFinder, findsOneWidget);

      await tester.tap(promoteKeyFinder);
      await tester.pumpAndSettle();

      expect(find.byType(SnackBar, skipOffstage: false), findsOneWidget);
    });

    testWidgets('remove button works correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        widget: const MemberListActionsDialog(memberID: ''),
      );
      final Finder removeButtonFinder = find.byKey(removeButtonKey);
      expect(find.byType(Dialog), findsOneWidget);
      expect(find.byType(MyAfyaHubPrimaryButton), findsNWidgets(2));
      expect(removeButtonFinder, findsOneWidget);

      await tester.tap(removeButtonFinder);
      await tester.pumpAndSettle();

      expect(find.byType(SnackBar), findsOneWidget);
    });
  });
}
