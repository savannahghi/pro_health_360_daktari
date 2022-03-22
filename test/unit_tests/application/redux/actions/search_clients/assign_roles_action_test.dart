import 'dart:convert';
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mycarehubpro/application/redux/actions/search_users/assign_roles_action.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/application/redux/states/connectivity_state.dart';
import 'package:mycarehubpro/domain/core/entities/search_user/search_user_response.dart';

import '../../../../../mocks/mocks.dart';

void main() {
  group('AssignRolesAction', () {
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
        AssignRolesAction(
          searchUserResponse: SearchUserResponse.initial(),
          client: mockShortSILGraphQlClient,
          onSuccess: (String name) {},
          onFailure: () {},
          roles: <String, bool>{},
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(AssignRolesAction);

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
        AssignRolesAction(
          searchUserResponse: SearchUserResponse.initial(),
          client: mockShortSILGraphQlClient,
          onSuccess: (String name) {},
          onFailure: () {},
          roles: <String, bool>{},
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(AssignRolesAction);

      expect(
        info.state,
        AppState.initial()
            .copyWith(connectivityState: ConnectivityState(isConnected: true)),
      );
      expect(
        (info.error! as UserException).msg,
        getErrorMessage('assigning roles'),
      );
    });
  });
}
