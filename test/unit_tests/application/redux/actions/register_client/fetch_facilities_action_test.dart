import 'dart:convert';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prohealth360_daktari/application/redux/actions/register_client/search_facilities_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/states/connectivity_state.dart';
import 'package:http/http.dart';

import '../../../../../mocks/mocks.dart';

void main() {
  group('FetchFacilitiesAction', () {
    late StoreTester<AppState> storeTester;

    setUp(() {
      storeTester = StoreTester<AppState>(
        initialState: AppState.initial()
            .copyWith(connectivityState: ConnectivityState(isConnected: true)),
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );
    });

    test('should run successfully', () async {
      storeTester.dispatch(
        SearchFacilitiesAction(client: MockTestGraphQlClient(), mflCode: ''),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(SearchFacilitiesAction);

      expect(info.state.staffState?.facilities?.first.name, 'Test Facility');
    });

    test('should throw error if api call is not 200', () async {
      storeTester.dispatch(
        SearchFacilitiesAction(
          client: MockShortGraphQlClient.withResponse(
            '',
            '',
            Response(
              jsonEncode(<String, String>{'error': 'error occured'}),
              500,
            ),
          ),
          mflCode: '',
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(SearchFacilitiesAction);

      expect(
        info.state,
        AppState.initial()
            .copyWith(connectivityState: ConnectivityState(isConnected: true)),
      );
      expect(
        (info.error! as UserException).msg,
        'Sorry, an unknown error occurred, please try again or get help from our '
        'help center.',
      );
    });

    test('should throw error if response has error', () async {
      storeTester.dispatch(
        SearchFacilitiesAction(
          client: MockShortGraphQlClient.withResponse(
            '',
            '',
            Response(
              jsonEncode(<String, String>{'error': 'error occured'}),
              200,
            ),
          ),
          mflCode: '',
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(SearchFacilitiesAction);

      expect(
        info.state,
        AppState.initial()
            .copyWith(connectivityState: ConnectivityState(isConnected: true)),
      );
      expect(
        (info.error! as UserException).msg,
        getErrorMessage('fetching facilities'),
      );
    });
  });
}
