import 'dart:convert';
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mycarehubpro/application/redux/actions/search_users/fetch_staff_roles_action.dart';
import 'package:mycarehubpro/application/redux/actions/search_users/update_search_user_response_state.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/application/redux/states/connectivity_state.dart';

import '../../../../../mocks/mocks.dart';

void main() {
  group('FetchStaffRolesAction', () {
    late StoreTester<AppState> storeTester;

    setUp(() {
      storeTester = StoreTester<AppState>(
        initialState: AppState.initial()
            .copyWith(connectivityState: ConnectivityState(isConnected: true)),
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );
    });

    test('should throw error if api call is not 200', () async {
      final MockShortGraphQlClient mockShortSILGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        http.Response(
          json.encode(<String, dynamic>{
            'errors': <Object>[
              <String, dynamic>{
                'message': '4: error',
              }
            ]
          }),
          401,
        ),
      );
      storeTester.dispatch(
        FetchStaffRolesAction(
          client: mockShortSILGraphQlClient,
          onFailure: () {},
          userID: '',
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(FetchStaffRolesAction);

      expect(
        (info.error! as UserException).msg,
        'Sorry, an unknown error occurred, please try again or get help from our '
        'help center.',
      );
    });

    test('should throw error if response has error', () async {
      final MockShortGraphQlClient mockShortSILGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        http.Response(
          json.encode(<String, dynamic>{
            'errors': <Object>[
              <String, dynamic>{
                'message': '4: error',
              }
            ]
          }),
          200,
        ),
      );
      storeTester.dispatch(
        FetchStaffRolesAction(
          client: mockShortSILGraphQlClient,
          onFailure: () {},
          userID: '',
        ),
      );
      final TestInfo<AppState> info =
          await storeTester.waitUntil(FetchStaffRolesAction);

      expect(
        info.state,
        AppState.initial()
            .copyWith(connectivityState: ConnectivityState(isConnected: true)),
      );
      expect(
        (info.error! as UserException).msg,
        getErrorMessage('getting user roles'),
      );
    });

    test('should work correctly if there is no error', () async {
      final MockShortGraphQlClient mockShortSILGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'getUserRoles': <dynamic>[
                <String, dynamic>{
                  'roleID': 'some_id',
                  'name': 'CONTENT_MANAGEMENT'
                },
              ]
            }
          }),
          200,
        ),
      );
      storeTester.dispatch(
        FetchStaffRolesAction(
          client: mockShortSILGraphQlClient,
          onFailure: () {},
          userID: '',
        ),
      );
      final TestInfo<AppState> info =
          await storeTester.waitUntil(UpdateSearchUserResponseStateAction);

      expect(
        info.state.miscState!.searchUserResponseState!
            .selectedSearchUserResponse!.rolesList!.roles!.isNotEmpty,
        true,
      );
    });
  });
}
