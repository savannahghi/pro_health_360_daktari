// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:mycarehubpro/domain/core/value_objects/app_widget_keys.dart';
import 'package:mycarehubpro/presentation/client_details/widgets/client_details_card_widget.dart';
import 'package:mycarehubpro/presentation/core/app_bar/custom_app_bar.dart';
import 'package:mycarehubpro/presentation/service_requests/pages/profile_update_requests_page.dart';
import '../../../mocks/test_helpers.dart';

void main() {
  group('ProfileUpdateRequestsPage', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        widget: ProfileUpdateRequestsPage(),
      );

      expect(find.byType(CustomAppBar), findsOneWidget);
      await tester.tap(find.byKey(reachOutButtonKey).first);
      await tester.pumpAndSettle();
      expect(find.byType(ClientDetailsCard), findsOneWidget);
    });
  });
}
