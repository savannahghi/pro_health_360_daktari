import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:healthcloud/application/redux/actions/core/batch_update_misc_state_action.dart';
import 'package:healthcloud/application/redux/actions/core/update_credentials_action.dart';
import 'package:healthcloud/application/redux/actions/terms/accept_terms_action.dart';
import 'package:healthcloud/application/redux/actions/update_onboarding_state.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:healthcloud/infrastructure/endpoints.dart';
import 'package:healthcloud/presentation/onboarding/security_questions/security_questions_page.dart';
import 'package:healthcloud/presentation/router/routes.dart';
import 'package:http/http.dart';

import '../../../../../mocks/mocks.dart';

void main() {
  group('AcceptTermAction', () {
    late StoreTester<AppState> storeTester;

    setUp(() {
      storeTester = StoreTester<AppState>(
        initialState: AppState.initial(),
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );
    });

    test('updates staff state after user accepts', () async {
      storeTester.dispatch(AcceptTermAction(client: MockTestGraphQlClient()));

      final TestInfo<AppState> info =
          await storeTester.waitUntil(AcceptTermAction);

      expect(info.state.staffState?.user?.termsAccepted, true);
    });

    test('updates httpError if error occurs', () async {
      storeTester.dispatch(
        AcceptTermAction(
          client: MockShortGraphQlClient.withResponse(
            'idToken',
            kTestGraphqlEndpoint,
            Response(
              json.encode(<String, String>{'error': 'error occured'}),
              201,
            ),
          ),
        ),
      );

      final TestInfo<AppState> info = await storeTester.waitAllUnorderedGetLast(
        <Type>[
          BatchUpdateMiscStateAction,
          AcceptTermAction,
          BatchUpdateMiscStateAction,
        ],
        ignore: <Type>[WaitAction],
      );

      expect(info.state.miscState?.error, somethingWentWrongText);
    });

    test('description', () async {
      storeTester.dispatch(UpdateCredentialsAction(isSignedIn: true));
      storeTester.dispatch(UpdateOnboardingStateAction(isPhoneVerified: true));
      storeTester.dispatch(AcceptTermAction(client: MockTestGraphQlClient()));

      final TestInfo<AppState> info =
          await storeTester.waitUntil(NavigateAction);

      final NavigateAction<AppState>? actionDispatched =
          info.action as NavigateAction<AppState>?;

      final NavigatorDetails_PushNamedAndRemoveUntil? navDetails =
          actionDispatched?.details
              as NavigatorDetails_PushNamedAndRemoveUntil?;

      expect(navDetails?.newRouteName, AppRoutes.securityQuestionsPage);
      expect(
        navDetails?.predicate.call(
          MaterialPageRoute<SecurityQuestionsPage>(
            builder: (BuildContext context) => const SecurityQuestionsPage(),
          ),
        ),
        false,
      );
    });
  });
}
