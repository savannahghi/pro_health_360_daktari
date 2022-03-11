// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:mycarehubpro/presentation/engagement/home/pages/search_page.dart';
import 'package:mycarehubpro/presentation/engagement/home/widgets/no_results_found.dart';
import 'package:mycarehubpro/presentation/engagement/home/widgets/patient_search_results.dart';
import '../../../../../mocks/test_helpers.dart';

void main() {
  group('SearchPage', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        widget: const SearchPage(),
      );

      expect(find.byType(CustomTextField), findsOneWidget);
      expect(find.byType(NoResultsFound), findsOneWidget);

      await tester.showKeyboard(find.byType(CustomTextField));
      await tester.enterText(find.byType(CustomTextField), 'Den');
      await tester.pumpAndSettle();

      expect(find.byType(PatientSearchResults), findsOneWidget);
    });
  });
}
