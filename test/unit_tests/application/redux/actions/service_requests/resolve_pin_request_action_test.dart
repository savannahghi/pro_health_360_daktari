import 'dart:convert';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:mycarehubpro/application/redux/actions/service_requests/resolve_pin_request_action.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/application/redux/states/service_requests_state.dart';
import 'package:mycarehubpro/domain/core/entities/service_requests/service_request_content.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_enums.dart';

import '../../../../../mocks/mocks.dart';

import 'resolve_pin_request_action_test.mocks.dart';

@GenerateMocks(<Type>[IGraphQlClient])
void main() {
  group('ResolvePinRequestAction', () {
    late StoreTester<AppState> storeTester;

    setUp(() {
      storeTester = StoreTester<AppState>(
        initialState: AppState.initial(),
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );
    });

    test('should run successfully', () async {
      int pinVerified = 0;

      storeTester.dispatch(
        ResolvePinRequestAction(
          clientId: '',
          serviceRequestId: '',
          cccNumber: '',
          phoneNumber: '',
          physicalIdentityVerified: true,
          httpClient: MockTestGraphQlClient(),
          onPinVerified: () => pinVerified++,
          pinResetState: PinResetState.APPROVED,
        ),
      );

      await storeTester.waitUntil(ResolvePinRequestAction);

      expect(pinVerified, 1);
    });

    test('should remove accepted service request from state', () async {
      final Store<AppState> store = Store<AppState>(
        initialState: AppState.initial().copyWith(
          serviceRequestState: ServiceRequestState(
            serviceRequestContent: <String, ServiceRequestContent>{
              'service-request-id':
                  ServiceRequestContent(id: 'service-request-id'),
              'service-request-id2':
                  ServiceRequestContent(id: 'service-request-id2')
            },
          ),
        ),
      );

      storeTester = StoreTester<AppState>.from(
        store,
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );

      expect(
        store.state.serviceRequestState
            ?.serviceRequestContent?['service-request-id'],
        ServiceRequestContent(id: 'service-request-id'),
      );

      int pinVerified = 0;

      storeTester.dispatch(
        ResolvePinRequestAction(
          clientId: '',
          serviceRequestId: 'service-request-id',
          cccNumber: '',
          phoneNumber: '',
          physicalIdentityVerified: true,
          httpClient: MockTestGraphQlClient(),
          onPinVerified: () => pinVerified++,
          pinResetState: PinResetState.APPROVED,
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(ResolvePinRequestAction);

      expect(
        info.state.serviceRequestState
            ?.serviceRequestContent?['service-request-id'],
        null,
      );
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
        ResolvePinRequestAction(
          clientId: '',
          serviceRequestId: '',
          cccNumber: '',
          phoneNumber: '',
          physicalIdentityVerified: true,
          httpClient: client,
          onPinVerified: () => pinVerified++,
          pinResetState: PinResetState.APPROVED,
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(ResolvePinRequestAction);

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
        ResolvePinRequestAction(
          clientId: '',
          serviceRequestId: '',
          cccNumber: '',
          phoneNumber: '',
          physicalIdentityVerified: true,
          httpClient: client,
          onPinVerified: () => pinVerified++,
          pinResetState: PinResetState.APPROVED,
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(ResolvePinRequestAction);

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
        ResolvePinRequestAction(
          clientId: '',
          serviceRequestId: '',
          cccNumber: '',
          phoneNumber: '',
          physicalIdentityVerified: true,
          httpClient: client,
          onPinVerified: () => pinVerified++,
          pinResetState: PinResetState.APPROVED,
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(ResolvePinRequestAction);

      expect(pinVerified, 0);
      expect(info.errors.removeFirst(), UserException(getErrorMessage()));
    });
  });
}
