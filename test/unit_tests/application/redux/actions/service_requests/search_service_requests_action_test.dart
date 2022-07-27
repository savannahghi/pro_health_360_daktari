import 'dart:convert';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:prohealth360_daktari/application/redux/actions/service_requests/search_service_requests_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:http/http.dart';

import '../../../../../mocks/mocks.dart';

@GenerateMocks(<Type>[IGraphQlClient])
void main() {
  group('SearchServiceRequestsAction', () {
    late StoreTester<AppState> storeTester;

    setUp(() {
      storeTester = StoreTester<AppState>(
        initialState: AppState.initial(),
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );
    });

    test('should throw error if api call is not 200', () async {
      storeTester.dispatch(
        SearchServiceRequestsAction(
          client: MockShortGraphQlClient.withResponse(
            '',
            '',
            Response(
              jsonEncode(<String, String>{'error': 'error occurred'}),
              500,
            ),
          ),
          searchTerm: 'test',
          flavour: Flavour.pro,
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(SearchServiceRequestsAction);

      expect(info.state, AppState.initial());
      expect(
        (info.error! as UserException).msg,
        getErrorMessage('searching'),
      );
    });

    test('should throw error if response has error', () async {
      storeTester.dispatch(
        SearchServiceRequestsAction(
          client: MockShortGraphQlClient.withResponse(
            '',
            '',
            Response(
              jsonEncode(<String, String>{'error': 'error occurred'}),
              200,
            ),
          ),
          flavour: Flavour.pro,
          searchTerm: 'test',
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(SearchServiceRequestsAction);

      expect(info.state, AppState.initial());
      expect(
        (info.error! as UserException).msg,
        getErrorMessage('searching'),
      );
    });
  });
}
