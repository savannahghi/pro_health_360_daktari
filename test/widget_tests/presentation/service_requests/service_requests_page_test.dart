// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:healthcloud/domain/core/value_objects/app_widget_keys.dart';
import 'package:healthcloud/presentation/core/app_bar/custom_app_bar.dart';
import 'package:healthcloud/presentation/core/category_item_card.dart';
import 'package:healthcloud/presentation/service_requests/pages/service_requests_page.dart';
import '../../../mocks/test_helpers.dart';

void main() {
  group('CustomAppBar', () {
    testWidgets('should render correctly with default values',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        widget: ServiceRequestsPage(),
      );

      expect(find.byType(CustomAppBar), findsOneWidget);
      expect(find.text(serviceRequestString), findsOneWidget);
      expect(find.byType(CategoryItemCard), findsNWidgets(3));

      await tester.tap(find.byType(CategoryItemCard).first);
      await tester.pumpAndSettle();
      expect(find.text(serviceRequestString), findsNothing);

      await tester.tap(find.byKey(appBarBackButtonKey));
      await tester.pumpAndSettle();
      expect(find.text(serviceRequestString), findsOneWidget);
    });
  });
}
