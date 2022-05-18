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
          onSuccess: () => success++,
          variables: <String, dynamic>{},
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
          variables: <String, dynamic>{},
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
          variables: <String, dynamic>{},
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(SendSurveysAction);

      expect(info.errors.removeFirst().msg, getErrorMessage());
    });
  });
}
