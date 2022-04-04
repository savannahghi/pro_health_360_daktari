// Package imports:

import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/presentation/service_requests/pages/screening_tools_assessment_page.dart';
import 'package:mycarehubpro/presentation/service_requests/widgets/assessment_card.dart';
import 'package:mycarehubpro/presentation/service_requests/widgets/reach_out_widget.dart';

import '../../../mocks/mocks.dart';
import '../../../mocks/test_helpers.dart';

void main() {
  group('ScreeningToolsAssessmentPage', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
    });
    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: const ScreeningToolsAssessmentPage(),
      );

      expect(find.byType(AssessmentCard), findsOneWidget);
      expect(find.byType(ReachOutWidget), findsOneWidget);
    });
  });
}
