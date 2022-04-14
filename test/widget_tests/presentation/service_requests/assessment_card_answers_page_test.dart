import 'dart:convert';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mycarehubpro/application/redux/actions/flags/app_flags.dart';
import 'package:mycarehubpro/application/redux/actions/service_requests/resolve_screening_tool_service_request_action.dart';
import 'package:mycarehubpro/application/redux/actions/service_requests/update_screening_tools_state_action.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/application/redux/states/service_requests/assessment_question_response.dart';
import 'package:mycarehubpro/application/redux/states/service_requests/screening_tools_state.dart';
import 'package:mycarehubpro/application/redux/states/service_requests/tool_assessment_response.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_enums.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';

// Project imports:
import 'package:mycarehubpro/domain/core/value_objects/app_widget_keys.dart';
import 'package:mycarehubpro/presentation/service_requests/pages/assessment_card_answers_page.dart';
import 'package:mycarehubpro/presentation/service_requests/widgets/assessment_card.dart';
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
        widget: AssessmentCardAnswersPage(
          payload: <String, dynamic>{
            'toolType': ScreeningToolsType.ALCOHOL_SUBSTANCE_ASSESSMENT,
            'assessmentResponse': ToolAssessmentResponse.fromJson(
              mockAssessmentResponsesByToolType,
            ),
          },
        ),
        graphQlClient: MockTestGraphQlClient(),
      );

      expect(find.byType(AssessmentCard), findsOneWidget);
    });

    testWidgets(
        'should show a loading indicator when fetching screening tool responses',
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
        WaitAction<AppState>.add(fetchScreeningToolResponsesFlag),
      );
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: mockShortGraphQlClient,
        widget: AssessmentCardAnswersPage(
          payload: <String, dynamic>{
            'toolType': ScreeningToolsType.ALCOHOL_SUBSTANCE_ASSESSMENT,
            'assessmentResponse': ToolAssessmentResponse.fromJson(
              mockAssessmentResponsesByToolType,
            ).copyWith(
              questionsResponses: <AssessmentQuestionResponse>[
                AssessmentQuestionResponse.initial()
              ],
            )
          },
        ),
      );

      expect(find.byType(PlatformLoader), findsOneWidget);
    });
    testWidgets(
      'should show an error snackbar when fetching screening tool responses fails',
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
          widget: AssessmentCardAnswersPage(
            payload: <String, dynamic>{
              'toolType': ScreeningToolsType.ALCOHOL_SUBSTANCE_ASSESSMENT,
              'assessmentResponse': ToolAssessmentResponse.fromJson(
                mockAssessmentResponsesByToolType,
              ),
            },
          ),
        );

        await tester.pumpAndSettle();
        expect(find.byType(SnackBar), findsOneWidget);
        expect(find.text(somethingWentWrongText), findsOneWidget);
      },
    );

    testWidgets('resolve button works correctly', (WidgetTester tester) async {
      store.dispatch(
        UpdateScreeningToolsStateAction(
          toolAssessmentResponses:
              ScreeningToolsState.fromJson(mockToolAssessmentResponses)
                  .toolAssessmentResponses,
        ),
      );
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: AssessmentCardAnswersPage(
          payload: <String, dynamic>{
            'toolType': ScreeningToolsType.ALCOHOL_SUBSTANCE_ASSESSMENT,
            'assessmentResponse': ToolAssessmentResponse.fromJson(
              mockAssessmentResponsesByToolType,
            ),
          },
        ),
      );
      await tester.pumpAndSettle();
      final Finder resolveRequestButton = find.byKey(resolveRequestButtonKey);
      expect(resolveRequestButton, findsOneWidget);
      await tester.ensureVisible(resolveRequestButton);
      await tester.tap(resolveRequestButton);
      await tester.pump(const Duration(seconds: 4));
      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text(requestResolvedSuccessText), findsOneWidget);
    });

    testWidgets('shows snackbar with error message when result is not true',
        (WidgetTester tester) async {
      final MockShortGraphQlClient mockShortGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'resolveServiceRequest': false,
              'getScreeningToolServiceRequestResponses': <dynamic>[
                <String, dynamic>{
                  'toolIndex': 0,
                  'tool': 'Have you experienced a chough for any duration?',
                  'response': 'Yes',
                }
              ],
            }
          }),
          201,
        ),
      );
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: mockShortGraphQlClient,
        widget: AssessmentCardAnswersPage(
          payload: <String, dynamic>{
            'toolType': ScreeningToolsType.ALCOHOL_SUBSTANCE_ASSESSMENT,
            'assessmentResponse': ToolAssessmentResponse.fromJson(
              mockAssessmentResponsesByToolType,
            ),
          },
        ),
      );
      await tester.pumpAndSettle();
      final Finder resolveRequestButton = find.byKey(resolveRequestButtonKey);
      expect(resolveRequestButton, findsOneWidget);
      await tester.ensureVisible(resolveRequestButton);
      await tester.pumpAndSettle();
      await tester.tap(resolveRequestButton);
      await tester.pump(const Duration(seconds: 4));
      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text(somethingWentWrongText), findsOneWidget);
    });
    testWidgets('onFailure callback is called when an error occurs',
        (WidgetTester tester) async {
      final MockShortGraphQlClient mockShortGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{'errors': 'error'}),
          201,
        ),
      );
      String? testString;
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: mockShortGraphQlClient,
        widget: Builder(
          builder: (BuildContext context) {
            return MaterialButton(
              onPressed: () => StoreProvider.dispatch<AppState>(
                context,
                ResolveScreeningToolServiceRequestAction(
                  client: AppWrapperBase.of(context)!.graphQLClient,
                  serviceRequestId: 'test',
                  onFailure: () => testString = 'error',
                ),
              ),
            );
          },
        ),
      );
      await tester.pumpAndSettle();
      final Finder resolveRequestButton = find.byType(MaterialButton);
      expect(resolveRequestButton, findsOneWidget);
      await tester.tap(resolveRequestButton);
      await tester.pumpAndSettle();
      expect(testString, 'error');
    });
  });
}
