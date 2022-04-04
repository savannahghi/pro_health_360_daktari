import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_enums.dart';

// Project imports:
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_widget_keys.dart';
import 'package:mycarehubpro/presentation/service_requests/pages/screening_tools_assessment_page.dart';
import 'package:mycarehubpro/presentation/service_requests/pages/screening_tools_list_page.dart';
import 'package:mycarehubpro/presentation/service_requests/widgets/assessment_request_item_widget.dart';
import '../../../mocks/mocks.dart';
import '../../../mocks/test_helpers.dart';

void main() {
  group('ScreeningToolsListPage', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets('should render correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        widget: const ScreeningToolsListPage(),
        graphQlClient: MockTestGraphQlClient(),
      );

      final Finder violenceOption = find.text('Violence');
      final Finder contraceptiveOption = find.text('Contraceptives');
      final Finder tbOption = find.text('Tuberculosis');
      final Finder alcoholOption = find.text(alcoholUseAssessmentString);

      expect(violenceOption, findsOneWidget);
      expect(contraceptiveOption, findsOneWidget);
      expect(tbOption, findsOneWidget);
      expect(alcoholOption, findsOneWidget);

      await tester.tap(violenceOption);
      await tester.pumpAndSettle();
      expect(
        find.text(
          getAssessmentScorePageTitle(
            screeningToolsType: ScreeningToolsType.VIOLENCE_ASSESSMENT,
          ),
        ),
        findsOneWidget,
      );

      await tester.tap(find.byKey(appBarBackButtonKey));
      await tester.pumpAndSettle();
      await tester.tap(contraceptiveOption);
      await tester.pumpAndSettle();
      expect(
        find.text(
          getAssessmentScorePageTitle(
            screeningToolsType: ScreeningToolsType.CONTRACEPTIVE_ASSESSMENT,
          ),
        ),
        findsOneWidget,
      );

      await tester.tap(find.byKey(appBarBackButtonKey));
      await tester.pumpAndSettle();
      await tester.tap(tbOption);
      await tester.pumpAndSettle();
      expect(
        find.text(
          getAssessmentScorePageTitle(
            screeningToolsType: ScreeningToolsType.TB_ASSESSMENT,
          ),
        ),
        findsOneWidget,
      );

      await tester.tap(find.byKey(appBarBackButtonKey));
      await tester.pumpAndSettle();
      await tester.ensureVisible(alcoholOption);
      await tester.pumpAndSettle();

      await tester.tap(alcoholOption);
      await tester.pumpAndSettle();
      expect(
        find.text(
          getAssessmentScorePageTitle(
            screeningToolsType: ScreeningToolsType.ALCOHOL_SUBSTANCE_ASSESSMENT,
          ),
        ),
        findsOneWidget,
      );
      await tester.tap(
        find.byType(AssessmentRequestItemWidget).first,
      );
      await tester.pumpAndSettle();
      expect(find.byType(ScreeningToolsAssessmentPage), findsOneWidget);
    });
  });
}
