// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prohealth360_daktari/application/redux/actions/onboarding/update_onboarding_state_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/security_questions/get_security_questions_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:http/http.dart' as http;
import 'package:prohealth360_daktari/domain/core/value_objects/app_enums.dart';

import '../../../../../../mocks/mocks.dart';
import '../../../../../../mocks/test_helpers.dart';

void main() {
  group('GetSecurityQuestionsAction', () {
    late Store<AppState> store;

    setUpAll(() {
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets('should dispatch action and catch error',
        (WidgetTester tester) async {
      final MockShortGraphQlClient mockShortSILGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        http.Response(
          json.encode(<String, dynamic>{
            'errors': <Object>[
              <String, dynamic>{'message': '4: error'}
            ]
          }),
          401,
        ),
      );
      late dynamic err;
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: mockShortSILGraphQlClient,
        widget: Builder(
          builder: (BuildContext context) {
            return MyAfyaHubPrimaryButton(
              onPressed: () async {
                try {
                  await store.dispatch(
                    GetSecurityQuestionsAction(
                      context: context,
                    ),
                  );
                } catch (e) {
                  err = e;
                }
              },
            );
          },
        ),
      );

      await tester.pump();
      await tester.tap(find.byType(MyAfyaHubPrimaryButton));
      await tester.pumpAndSettle();
      expect(err, isA<Future<dynamic>>());
    });

    testWidgets(
        'should fetch security questions correctly ans save them to state '
        'when resetting a PIN', (WidgetTester tester) async {
      store.dispatch(
        UpdateOnboardingStateAction(
          phoneNumber: '+2547123456',
          otp: '123456',
          currentOnboardingStage: CurrentOnboardingStage.ResetPIN,
        ),
      );

      final MockShortGraphQlClient mockShortSILGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'getUserRespondedSecurityQuestions': <dynamic>[
                mockSecurityQuestion,
              ]
            }
          }),
          200,
        ),
      );
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: mockShortSILGraphQlClient,
        widget: Builder(
          builder: (BuildContext context) {
            return MyAfyaHubPrimaryButton(
              onPressed: () async {
                await store.dispatch(
                  GetSecurityQuestionsAction(context: context),
                );
              },
            );
          },
        ),
      );

      expect(find.byType(MyAfyaHubPrimaryButton), findsOneWidget);

      await tester.tap(find.byType(MyAfyaHubPrimaryButton));
      await tester.pumpAndSettle();

      expect(store.state.onboardingState?.securityQuestions?.length, 1);
      expect(
        store.state.onboardingState?.securityQuestions?.first.description,
        'description',
      );

      expect(store.state.onboardingState?.securityQuestionResponses?.length, 1);
    });
  });
}
