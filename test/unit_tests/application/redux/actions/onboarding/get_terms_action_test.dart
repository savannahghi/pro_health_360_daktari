import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mycarehubpro/application/redux/actions/core/batch_update_misc_state_action.dart';
import 'package:mycarehubpro/application/redux/actions/terms/get_terms_action.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';
import 'package:mycarehubpro/infrastructure/endpoints.dart';
import 'package:http/http.dart';

import '../../../../../mocks/mocks.dart';

void main() {
  group('GetTermsAction', () {
    late StoreTester<AppState> storeTester;

    setUp(() {
      storeTester = StoreTester<AppState>(
        initialState: AppState.initial(),
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );
    });

    test('updates onboarding state with new terms', () async {
      storeTester.dispatch(GetTermsAction(client: MockTestGraphQlClient()));

      final TestInfo<AppState> info =
          await storeTester.waitUntil(GetTermsAction);

      expect(info.state.onboardingState?.termsAndConditions?.termsId, 10001);
      expect(
        info.state.onboardingState?.termsAndConditions?.text,
        'Dummy PRO Terms',
      );
    });

    test('updates httpError if error occurs', () async {
      storeTester.dispatch(
        GetTermsAction(
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
          GetTermsAction,
          BatchUpdateMiscStateAction,
        ],
        ignore: <Type>[WaitAction],
      );

      expect(info.state.miscState?.error, somethingWentWrongText);
    });
  });
}
