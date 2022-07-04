import 'dart:convert';
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:prohealth360_daktari/application/redux/actions/retrieve_facility_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/states/connectivity_state.dart';
import 'package:prohealth360_daktari/domain/core/entities/core/facility.dart';
import 'package:prohealth360_daktari/domain/core/entities/core/staff_state.dart';

import '../../../../../mocks/mocks.dart';

void main() {
  group('RetrieveFacilityAction', () {
    late StoreTester<AppState> storeTester;

    setUp(() {
      storeTester = StoreTester<AppState>(
        initialState: AppState.initial().copyWith(
          connectivityState: ConnectivityState(isConnected: true),
          staffState: StaffState(
            facilities: <Facility>[Facility(name: 'test', phone: '071234')],
            defaultFacilityName: 'test',
          ),
        ),
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
        RetrieveFacilityAction(
          client: mockShortSILGraphQlClient,
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(RetrieveFacilityAction);

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
        RetrieveFacilityAction(
          client: mockShortSILGraphQlClient,
        ),
      );
      final TestInfo<AppState> info =
          await storeTester.waitUntil(RetrieveFacilityAction);

      expect(
        info.state,
        AppState.initial().copyWith(
          connectivityState: ConnectivityState(isConnected: true),
          staffState: StaffState(
            facilities: <Facility>[Facility(name: 'test', phone: '071234')],
            defaultFacilityName: 'test',
          ),
        ),
      );
      expect(
        (info.error! as UserException).msg,
        getErrorMessage('getting updated facility information'),
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
              'retrieveFacility': <String, dynamic>{
                'ID': 'test',
                'name': 'test',
                'code': 1234,
                'phone': '0712345678'
              },
            }
          }),
          200,
        ),
      );
      storeTester.dispatch(
        RetrieveFacilityAction(
          client: mockShortSILGraphQlClient,
        ),
      );
      final TestInfo<AppState> info =
          await storeTester.waitUntil(RetrieveFacilityAction);

      expect(
        info.state.staffState!.facilities!.first.phone,
        '0712345678',
      );
    });
  });
}
