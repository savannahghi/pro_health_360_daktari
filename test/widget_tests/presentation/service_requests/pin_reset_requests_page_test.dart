// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:healthcloud/application/core/services/utils.dart';
import 'package:healthcloud/domain/core/value_objects/app_widget_keys.dart';
import 'package:healthcloud/presentation/core/app_bar/custom_app_bar.dart';
import 'package:healthcloud/presentation/service_requests/pages/pin_reset_requests_page.dart';
import '../../../mocks/test_helpers.dart';

void main() {
  group('PINResetRequestsPage', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        widget: PINResetRequestsPage(),
      );
      expect(find.byType(CustomAppBar), findsOneWidget);

      final Finder approveButton = find.byKey(pinRequestApproveButtonKey);
      final Finder checkBox = find.byKey(pinRequestApproveCheckboxKey);
      expect(approveButton, findsNWidgets(pinResetRequests.length));
      expect(checkBox, findsNWidgets(pinResetRequests.length));

      final Checkbox checkbox = tester.firstWidget(checkBox.last) as Checkbox;

      expect(checkbox.value, false);
      await tester.tap(approveButton.last);
      await tester.pumpAndSettle();
      await tester.tap(checkBox.first);
      await tester.pumpAndSettle();

      expect(checkbox.value, false);
    });
  });
}
