import 'dart:convert';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:mycarehubpro/application/redux/actions/surveys/send_surveys_action.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/domain/core/entities/create_group/age_range.dart';
import 'package:mycarehubpro/domain/core/entities/surveys/client_configuration_payload.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_enums.dart';

import '../../../../../mocks/mocks.dart';
import 'send_surveys_action_test.mocks.dart';

@GenerateMocks(<Type>[IGraphQlClient])
void main() {
  group('SendSurveysAction', () {
    late StoreTester<AppState> storeTester;

    setUp(() {
      storeTester = StoreTester<AppState>(
        initialState: AppState.initial(),
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );
    });

    test('should complete normally', () async {
      final MockShortGraphQlClient client = MockShortGraphQlClient.withResponse(
        '',
        '',
        Response(
          jsonEncode(<String, dynamic>{
            'data': <String, dynamic>{'sendClientSurveyLinks': true}
          }),
          200,
        ),
      );

      int success = 0;

      storeTester.dispatch(
        SendSurveysAction(
          client: client,
          clientConfigurationPayload: ClientConfigurationPayload(
            clientTypes: <ClientType>[ClientType.PMTCT],
            ageRange: AgeRange(lowerBound: 14.0, upperBound: 25.0),
            gender: <Gender>[Gender.male],
          ),
          onSuccess: () => success++,
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(SendSurveysAction);

      expect(info.state.surveyState?.surveys?.length, 0);
      expect(success, 1);
    });

    test('should handle api error', () async {
      final MockShortGraphQlClient client = MockShortGraphQlClient.withResponse(
        '',
        '',
        Response(
          jsonEncode(<String, dynamic>{'error': 'error'}),
          200,
        ),
      );

      int errors = 0;

      storeTester.dispatch(
        SendSurveysAction(
          client: client,
          onError: (_) => errors++,
          clientConfigurationPayload: ClientConfigurationPayload(),
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(SendSurveysAction);

      expect(info.state.surveyState?.surveys?.length, 0);
      expect(errors, 1);
    });

    test('should handle exception', () async {
      final MockIGraphQlClient client = MockIGraphQlClient();

      when(
        client.query(any, any),
      ).thenThrow(MyAfyaException(cause: 'cause', message: 'message'));

      storeTester.dispatch(
        SendSurveysAction(
          client: client,
          clientConfigurationPayload: ClientConfigurationPayload(),
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(SendSurveysAction);

      expect(info.errors.removeFirst().msg, getErrorMessage());
    });
  });
}
