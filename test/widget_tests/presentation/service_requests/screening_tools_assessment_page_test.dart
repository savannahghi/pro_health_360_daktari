// Package imports:

import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/states/service_requests/tool_assessment_response.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_enums.dart';
import 'package:prohealth360_daktari/presentation/service_requests/pages/assessment_card_answers_page.dart';
import 'package:prohealth360_daktari/presentation/service_requests/widgets/assessment_card.dart';
import 'package:prohealth360_daktari/presentation/service_requests/widgets/reach_out_widget.dart';

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
        widget: AssessmentCardAnswersPage(
          payload: <String, dynamic>{
            'assessmentResponse': ToolAssessmentResponse.initial(),
            'toolType': ScreeningToolsType.VIOLENCE_ASSESSMENT,
          },
        ),
      );

      expect(find.byType(AssessmentCard), findsOneWidget);
      expect(find.byType(ReachOutWidget), findsOneWidget);
    });
  });
}
