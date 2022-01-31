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
      final Finder reachOutButton = find.byKey(reachOutButtonKey);
      final Finder cancelButton = find.byKey(dialogCancelButtonKey);

      expect(find.byType(CustomAppBar), findsOneWidget);
      expect(reachOutButton, findsNWidgets(reFlagItems.length));

      await tester.tap(reachOutButton.first);
      await tester.pumpAndSettle();
      expect(cancelButton, findsOneWidget);

      await tester.tap(cancelButton);
      await tester.pumpAndSettle();
      expect(reachOutButton, findsNWidgets(reFlagItems.length));
    });
    testWidgets('ScheduleMeetDialog renders correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        widget: RedFlagsPage(),
      );
      final Finder reachOutButton = find.byKey(reachOutButtonKey);
      final Finder zoomButton = find.byKey(zoomButtonKey);
      final Finder googleMeetButton = find.byKey(googleMeetButtonKey);
      final Finder confirmButton = find.byKey(dialogConfirmButtonKey);

      await tester.tap(reachOutButton.first);
      await tester.pumpAndSettle();

      expect(googleMeetButton, findsOneWidget);
      expect(zoomButton, findsOneWidget);

      await tester.tap(zoomButton);
      await tester.pumpAndSettle();
      await tester.tap(googleMeetButton);
      await tester.pumpAndSettle();
      await tester.tap(confirmButton);
      await tester.pumpAndSettle();
      expect(reachOutButton, findsNWidgets(reFlagItems.length));
    });
  });
}
