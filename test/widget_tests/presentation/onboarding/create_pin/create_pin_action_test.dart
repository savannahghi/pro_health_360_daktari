// Dart imports:
import 'dart:convert';

// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:prohealth360_daktari/application/redux/actions/core/update_credentials_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/core/update_user_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/create_pin_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/onboarding/update_onboarding_state_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/update_connectivity_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/entities/core/user.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_enums.dart';

import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  group('CreatePINAction', () {
    late Store<AppState> store;

    setUp(() async {
      store = Store<AppState>(initialState: AppState.initial());
      store.dispatch(UpdateConnectivityAction(hasConnection: true));
      store.dispatch(UpdateCredentialsAction(isSignedIn: true));
      store.dispatch(
        UpdateUserAction(
          user: User.initial().copyWith.call(userId: 'some-user-id'),
        ),
      );
      store.dispatch(
        UpdateOnboardingStateAction(
          currentOnboardingStage: CurrentOnboardingStage.Login,
          isPhoneVerified: true,
          hasAcceptedTerms: true,
          hasSetSecurityQuestions: true,
          phoneNumber: '+2547123456',
        ),
      );
      store.dispatch(
        UpdateUserAction(
          user: store.state.staffState!.user!.copyWith.call(
            termsAccepted: true,
            isPhoneVerified: true,
            hasSetSecurityQuestions: true,
          ),
        ),
      );
      setupFirebaseAnalyticsMocks();
      await Firebase.initializeApp();
    });

    testWidgets(
        'should dispatch action and catch error when updating a user PIN',
        (WidgetTester tester) async {
      final MockShortGraphQlClient mockShortSILGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        http.Response(json.encode(<String, dynamic>{'error': '4: error'}), 401),
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
                  store.dispatch(
                    UpdateOnboardingStateAction(
                      confirmPIN: '0000',
                      pin: '0000',
                    ),
                  );
                  await store.dispatch(
                    CreatePINAction(
                      client: mockShortSILGraphQlClient,
                      onSuccess: () {},
                      onError: (String? error) => true,
                      resetPinEndpoint: '',
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

    testWidgets('should dispatch action and catch error when resetting a PIN',
        (WidgetTester tester) async {
      final MockShortGraphQlClient mockShortSILGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        http.Response(json.encode(<String, dynamic>{'error': '4: error'}), 401),
      );

      store.dispatch(
        UpdateOnboardingStateAction(
          currentOnboardingStage: CurrentOnboardingStage.ResetPIN,
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
                  store.dispatch(
                    UpdateOnboardingStateAction(
                      confirmPIN: '0000',
                      pin: '0000',
                    ),
                  );
                  await store.dispatch(
                    CreatePINAction(
                      client: mockShortSILGraphQlClient,
                      onSuccess: () {},
                      onError: (String? error) => true,
                      resetPinEndpoint: '',
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
  });
}
