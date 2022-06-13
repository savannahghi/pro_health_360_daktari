import 'dart:convert';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mycarehubpro/application/redux/actions/onboarding/update_onboarding_state_action.dart';
import 'package:mycarehubpro/application/redux/actions/security_questions/verify_security_questions_action.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_enums.dart';
import 'package:mycarehubpro/presentation/service_requests/pages/verify_security_questions_help_page.dart';

import '../../../mocks/mocks.dart';
import '../../../mocks/test_helpers.dart';

void main() {
  group('VerifySecurityQuestionAction', () {
    late StoreTester<AppState> storeTester;

    setUp(() async {
      storeTester = StoreTester<AppState>(
        initialState: AppState.initial(),
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );
      setupFirebaseAnalyticsMocks();
      await Firebase.initializeApp();
    });

    test('should not update state if error occurs during API call', () async {
      storeTester.dispatch(
        VerifySecurityQuestionAction(
          client: MockShortGraphQlClient.withResponse(
            'idToken',
            'endpoint',
            Response(
              json.encode(<String, dynamic>{'errors': 'error'}),
              400,
            ),
          ),
          verifySecurityQuestionsEndpoint: '',
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(VerifySecurityQuestionAction);

      expect(info.state.onboardingState?.hasVerifiedSecurityQuestions, false);
    });

    test('should not update state if a response does not match', () async {
      storeTester.dispatch(
        VerifySecurityQuestionAction(
          client: MockShortGraphQlClient.withResponse(
            'idToken',
            'endpoint',
            Response(
              json.encode(<String, dynamic>{
                'error': <String, dynamic>{},
                'message': 'the security question response does not match'
              }),
              400,
            ),
          ),
          verifySecurityQuestionsEndpoint: '',
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(VerifySecurityQuestionAction);

      expect(info.state.onboardingState?.hasVerifiedSecurityQuestions, false);
    });

    test('should not update state if a response does not match', () async {
      storeTester.dispatch(
        VerifySecurityQuestionAction(
          client: MockShortGraphQlClient.withResponse(
            'idToken',
            'endpoint',
            Response(
              json.encode(<String, dynamic>{
                'error': <String, dynamic>{},
                'message': 'the security question response does not match'
              }),
              400,
            ),
          ),
          verifySecurityQuestionsEndpoint: '',
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(VerifySecurityQuestionAction);

      expect(info.state.onboardingState?.hasVerifiedSecurityQuestions, false);
    });

    testWidgets('should navigate to help page if more than 3 attempts are made',
        (WidgetTester tester) async {
      storeTester.dispatch(
        UpdateOnboardingStateAction(
          securityQuestions: <SecurityQuestion>[
            SecurityQuestion.initial(),
            SecurityQuestion.initial(),
            SecurityQuestion.initial(),
          ],
          securityQuestionsResponses: <SecurityQuestionResponse>[
            SecurityQuestionResponse.initial(),
            SecurityQuestionResponse.initial().copyWith(response: ''),
            SecurityQuestionResponse.initial(),
          ],
          currentOnboardingStage: CurrentOnboardingStage.PINExpired,
        ),
      );

      final MockShortGraphQlClient _client =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{
            'code': '77',
            'error': <String, dynamic>{},
            'message': 'the security question response does not match'
          }),
          400,
        ),
      );

      await buildTestWidget(
        tester: tester,
        widget: Builder(
          builder: (BuildContext context) {
            return GestureDetector(
              onTap: () async {
                await storeTester.dispatch(
                  VerifySecurityQuestionAction(
                    verifySecurityQuestionsEndpoint: '',
                    client: _client,
                  ),
                );
              },
            );
          },
        ),
      );

      expect(find.byType(GestureDetector), findsOneWidget);

      await tester.tap(find.byType(GestureDetector));
      await tester.pumpAndSettle();

      expect(find.byType(VerifySecurityQuestionsHelpPage), findsOneWidget);
    });

    test('verifies security questions successfully', () async {
      storeTester.dispatch(
        UpdateOnboardingStateAction(
          securityQuestions: <SecurityQuestion>[
            SecurityQuestion.initial(),
            SecurityQuestion.initial(),
            SecurityQuestion.initial(),
          ],
          securityQuestionsResponses: <SecurityQuestionResponse>[
            SecurityQuestionResponse.initial(),
            SecurityQuestionResponse.initial().copyWith(response: ''),
            SecurityQuestionResponse.initial(),
          ],
          currentOnboardingStage: CurrentOnboardingStage.PINExpired,
        ),
      );
      storeTester.dispatch(
        VerifySecurityQuestionAction(
          client: MockShortGraphQlClient.withResponse(
            'idToken',
            'endpoint',
            Response(
              json.encode(<String, dynamic>{
                'data': <String, dynamic>{
                  'verifySecurityQuestionResponses': true,
                },
              }),
              201,
            ),
          ),
          verifySecurityQuestionsEndpoint: '',
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(VerifySecurityQuestionAction);

      expect(info.state.onboardingState?.hasVerifiedSecurityQuestions, true);
    });
  });
}
