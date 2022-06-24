import 'dart:convert';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:prohealth360_daktari/application/redux/actions/service_requests/resolve_staff_pin_request_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/states/service_requests/service_requests_state.dart';
import 'package:prohealth360_daktari/domain/core/entities/service_requests/service_request.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_enums.dart';

import '../../../../../mocks/mocks.dart';

import 'resolve_staff_pin_request_action_test.mocks.dart';

@GenerateMocks(<Type>[IGraphQlClient])
void main() {
  group('ResolveStaffPinRequestAction', () {
    late StoreTester<AppState> storeTester;

    setUp(() async {
      storeTester = StoreTester<AppState>(
        initialState: AppState.initial(),
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );
      setupFirebaseAnalyticsMocks();
      await Firebase.initializeApp();
    });

    test('should run successfully', () async {
      int pinVerified = 0;

      storeTester.dispatch(
        ResolveStaffPinRequestAction(
          staffId: '',
          serviceRequestId: '',
          phoneNumber: '',
          httpClient: MockTestGraphQlClient(),
          onPinVerified: () => pinVerified++,
          pinResetState: PinResetState.APPROVED,
        ),
      );

      await storeTester.waitUntil(ResolveStaffPinRequestAction);

      expect(pinVerified, 1);
    });

    test('should remove accepted service request from state', () async {
      final Store<AppState> store = Store<AppState>(
        initialState: AppState.initial().copyWith(
          serviceRequestState: ServiceRequestState(
            staffServiceRequests: <ServiceRequest>[
              ServiceRequest(id: 'service-request-id'),
              ServiceRequest(id: 'service-request-id2')
            ],
          ),
        ),
      );

      storeTester = StoreTester<AppState>.from(
        store,
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );

      expect(
        store.state.serviceRequestState?.staffServiceRequests?.first,
        ServiceRequest(id: 'service-request-id'),
      );
      expect(store.state.serviceRequestState?.staffServiceRequests?.length, 2);

      int pinVerified = 0;

      storeTester.dispatch(
        ResolveStaffPinRequestAction(
          staffId: '',
          serviceRequestId: 'service-request-id',
          phoneNumber: '',
          httpClient: MockTestGraphQlClient(),
          onPinVerified: () => pinVerified++,
          pinResetState: PinResetState.APPROVED,
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(ResolveStaffPinRequestAction);

      expect(info.state.serviceRequestState?.staffServiceRequests?.length, 1);
      expect(pinVerified, 1);
    });

    test('should handle response error', () async {
      final MockShortGraphQlClient client = MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{'error': 'some error'}),
          201,
        ),
      );

      int pinVerified = 0;

      storeTester.dispatch(
        ResolveStaffPinRequestAction(
          staffId: '',
          serviceRequestId: '',
          phoneNumber: '',
          httpClient: client,
          onPinVerified: () => pinVerified++,
          pinResetState: PinResetState.APPROVED,
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(ResolveStaffPinRequestAction);

      expect(pinVerified, 0);
      expect(info.error, UserException(getErrorMessage()));
    });

    test('should handle http error', () async {
      final MockShortGraphQlClient client = MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{'error': 'some error'}),
          400,
        ),
      );

      int pinVerified = 0;

      storeTester.dispatch(
        ResolveStaffPinRequestAction(
          staffId: '',
          serviceRequestId: '',
          phoneNumber: '',
          httpClient: client,
          onPinVerified: () => pinVerified++,
          pinResetState: PinResetState.APPROVED,
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(ResolveStaffPinRequestAction);

      expect(pinVerified, 0);
      expect(info.error, UserException(getErrorMessage()));
    });

    test('should handle unexpected error', () async {
      final MockIGraphQlClient client = MockIGraphQlClient();

      when(
        client.query(any, any),
      ).thenThrow(MyAfyaException(cause: 'cause', message: 'message'));

      int pinVerified = 0;

      storeTester.dispatch(
        ResolveStaffPinRequestAction(
          staffId: '',
          serviceRequestId: '',
          phoneNumber: '',
          httpClient: client,
          onPinVerified: () => pinVerified++,
          pinResetState: PinResetState.APPROVED,
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(ResolveStaffPinRequestAction);

      expect(pinVerified, 0);
      expect(info.errors.removeFirst(), UserException(getErrorMessage()));
    });
  });
}
