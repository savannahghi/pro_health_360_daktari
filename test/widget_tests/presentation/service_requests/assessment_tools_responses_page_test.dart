import 'dart:convert';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mycarehubpro/application/redux/actions/flags/app_flags.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_enums.dart';

// Project imports:
import 'package:mycarehubpro/domain/core/value_objects/app_widget_keys.dart';
import 'package:mycarehubpro/presentation/service_requests/pages/assessment_tools_responses_page.dart';
import 'package:mycarehubpro/presentation/service_requests/pages/assessment_card_answers_page.dart';
import 'package:mycarehubpro/presentation/service_requests/widgets/assessment_request_item_widget.dart';
import '../../../mocks/mocks.dart';
import '../../../mocks/test_helpers.dart';

void main() {
  group('AssessmentToolResponsesPage', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets('should render correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        widget: const AssessmentToolResponsesPage(
          screeningToolsType: ScreeningToolsType.VIOLENCE_ASSESSMENT,
        ),
        graphQlClient: MockTestGraphQlClient(),
      );
      await tester.pumpAndSettle();
      final Finder responseItem = find.byType(AssessmentRequestItemWidget);

      expect(responseItem, findsNWidgets(2));

      await tester.tap(responseItem.first);
      await tester.pumpAndSettle();
      expect(find.byType(AssessmentCardAnswersPage), findsOneWidget);
    });

    testWidgets('should show a loading indicator when fetching screening tools',
        (WidgetTester tester) async {
      final MockShortGraphQlClient mockShortGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{'loading': true}
          }),
          201,
        ),
      );
      store.dispatch(
        WaitAction<AppState>.add(fetchAssessmentResponsesByToolFlag),
      );
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: mockShortGraphQlClient,
        widget: const AssessmentToolResponsesPage(
          screeningToolsType: ScreeningToolsType.ALCOHOL_SUBSTANCE_ASSESSMENT,
        ),
      );

      expect(find.byType(PlatformLoader), findsOneWidget);
    });
    testWidgets(
      'should show an error widget when fetching screening tools',
      (WidgetTester tester) async {
        final MockShortGraphQlClient mockShortGraphQlClient =
            MockShortGraphQlClient.withResponse(
          'idToken',
          'endpoint',
          Response(
            json.encode(<String, dynamic>{'error': 'some error occurred'}),
            201,
          ),
        );

        await buildTestWidget(
          tester: tester,
          store: store,
          graphQlClient: mockShortGraphQlClient,
          widget: const AssessmentToolResponsesPage(
            screeningToolsType: ScreeningToolsType.CONTRACEPTIVE_ASSESSMENT,
          ),
        );

        await tester.pumpAndSettle();
        final Finder genericNoDataButton = find.byKey(helpNoDataWidgetKey);

        expect(genericNoDataButton, findsOneWidget);

        /// Refresh and expect the same thing
        await tester.ensureVisible(genericNoDataButton);
        await tester.pumpAndSettle();
        await tester.tap(find.byKey(helpNoDataWidgetKey));

        await tester.pumpAndSettle();
        expect(genericNoDataButton, findsOneWidget);
      },
    );
    testWidgets(
      'should render correctly for empty responses',
      (WidgetTester tester) async {
        final MockShortGraphQlClient mockShortGraphQlClient =
            MockShortGraphQlClient.withResponse(
          'idToken',
          'endpoint',
          Response(
            json.encode(<String, dynamic>{
              'data': <String, dynamic>{
                'getAssessmentResponsesByToolType': <dynamic>[]
              }
            }),
            200,
          ),
        );

        await buildTestWidget(
          tester: tester,
          store: store,
          graphQlClient: mockShortGraphQlClient,
          widget: const AssessmentToolResponsesPage(
            screeningToolsType: ScreeningToolsType.CONTRACEPTIVE_ASSESSMENT,
          ),
        );
        final Finder responseItem = find.byType(AssessmentRequestItemWidget);

        expect(responseItem, findsNothing);
      },
    );
    
  });
}
