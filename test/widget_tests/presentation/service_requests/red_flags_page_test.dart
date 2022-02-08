// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:healthcloud/application/core/services/utils.dart';
import 'package:healthcloud/domain/core/value_objects/app_widget_keys.dart';
import 'package:healthcloud/presentation/core/app_bar/custom_app_bar.dart';
import 'package:healthcloud/presentation/service_requests/pages/red_flags_page.dart';
import '../../../mocks/test_helpers.dart';

void main() {
  group('PINResetRequestsPage', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        widget: RedFlagsPage(),
      );
      final Finder redFlagItem = find.byKey(redFlagItemKey);

      expect(find.byType(CustomAppBar), findsOneWidget);
      expect(redFlagItem, findsNWidgets(reFlagItems.length));
    });
    testWidgets('ScheduleMeetDialog renders correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        widget: RedFlagsPage(),
      );
      final Finder redFlagItem = find.byKey(redFlagItemKey);
      final Finder callButton = find.byKey(dialogCallButtonKey);

      await tester.tap(redFlagItem.first);
      await tester.pumpAndSettle();

      expect(callButton, findsOneWidget);
  
      await tester.tap(callButton);
      await tester.pumpAndSettle();
      expect(callButton, findsNothing);
    });
  });
}
