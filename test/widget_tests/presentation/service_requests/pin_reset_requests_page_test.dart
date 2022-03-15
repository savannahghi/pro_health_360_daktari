import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mycarehubpro/presentation/service_requests/pages/pin_reset_requests_page.dart';
import '../../../mocks/test_helpers.dart';

void main() {
  group('PinResetRequestsPage', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        widget: const PinResetRequestsPage(),
      );

      expect(find.byType(PinResetRequestsPage), findsOneWidget);

      final Finder acceptFinder = find.byKey(const Key('accept_key'));
      final Finder rejectFinder = find.byKey(const Key('reject_key'));

      expect(acceptFinder, findsOneWidget);
      expect(rejectFinder, findsOneWidget);

      await tester.tap(acceptFinder);
      await tester.tap(rejectFinder);
    });
  });
}
