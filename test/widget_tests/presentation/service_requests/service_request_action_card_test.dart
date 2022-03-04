import 'package:flutter_test/flutter_test.dart';
import 'package:myharehubpro/presentation/engagement/home/widgets/action_card.dart';
import 'package:myharehubpro/presentation/service_requests/pages/service_requests_page.dart';
import 'package:myharehubpro/presentation/service_requests/widgets/service_request_action_card.dart';

import '../../../mocks/mocks.dart';
import '../../../mocks/test_helpers.dart';

void main() {
  group('ServiceRequestActionCard', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        graphQlClient: MockTestGraphQlClient(),
        widget: const ServiceRequestActionCard(),
      );
      await tester.pumpAndSettle();
      final Finder actionCardWidget = find.byType(ActionCard);

      await tester.tap(actionCardWidget);
      await tester.pumpAndSettle();
      expect(find.byType(ServiceRequestsPage), findsOneWidget);
    });
  });
}
