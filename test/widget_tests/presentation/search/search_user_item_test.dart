import 'package:flutter_test/flutter_test.dart';
import 'package:mycarehubpro/domain/core/entities/profile/client_response.dart';
import 'package:mycarehubpro/presentation/client_details/widgets/search_user_item.dart';
import 'package:mycarehubpro/presentation/search/widgets/staff_search_widget.dart';

import '../../../mocks/test_helpers.dart';

void main() {
  group('Search User Item', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        widget: SearchUserItem(
          clientDetails: ClientResponse.initial(),
          number: '123',
        ),
      );
      await tester.pumpAndSettle();
      await tester.tap(find.byType(SearchUserItem));
      await tester.pumpAndSettle();

      expect(find.byType(StaffSearchWidget), findsOneWidget);
    });
  });
}
