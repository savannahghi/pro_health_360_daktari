import 'package:flutter_test/flutter_test.dart';

import 'package:healthcloud/presentation/core/app_bar/custom_app_bar.dart';
import 'package:healthcloud/presentation/service_requests/pages/profile_update_requests_page.dart';

import '../../../mocks/test_helpers.dart';

void main() {
  group('ProfileUpdateRequestsPage', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        widget: ProfileUpdateRequestsPage(),
      );

      expect(find.byType(CustomAppBar), findsOneWidget);
    });
  });
}
