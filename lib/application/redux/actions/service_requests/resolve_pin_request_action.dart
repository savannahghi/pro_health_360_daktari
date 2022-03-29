import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart';
import 'package:mycarehubpro/application/core/graphql/mutations.dart';
import 'package:mycarehubpro/application/redux/actions/flags/app_flags.dart';
import 'package:mycarehubpro/application/redux/actions/service_requests/update_service_requests_state_action.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/domain/core/entities/service_requests/service_request.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_enums.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class ResolvePinRequestAction extends ReduxAction<AppState> {
  final IGraphQlClient httpClient;
  final String clientId;
  final String serviceRequestId;
  final String cccNumber;
  final String phoneNumber;
  final bool physicalIdentityVerified;
  final PinResetState pinResetState;
  final VoidCallback? onPinVerified;

  ResolvePinRequestAction({
    required this.clientId,
    required this.serviceRequestId,
    required this.cccNumber,
    required this.phoneNumber,
    required this.physicalIdentityVerified,
    required this.httpClient,
    required this.pinResetState,
    this.onPinVerified,
  });

  @override
  void before() {
    super.before();
    dispatch(
      WaitAction<AppState>.add(
        '${pinResetRequestFlag}_${serviceRequestId}_$pinResetState',
      ),
    );
  }

  @override
  void after() {
    dispatch(
      WaitAction<AppState>.remove(
        '${pinResetRequestFlag}_${serviceRequestId}_$pinResetState',
      ),
    );
    super.after();
  }

  @override
  Future<AppState?> reduce() async {
    final Map<String, dynamic> variables = <String, dynamic>{
      'clientID': clientId,
      'serviceRequestID': serviceRequestId,
      'cccNumber': cccNumber,
      'phoneNumber': phoneNumber,
      'physicalIdentityVerified': physicalIdentityVerified,
      'state': pinResetState.name,
    };

    final Response result =
        await httpClient.query(verifyClientPinResetServiceRequestQuery, variables);

    final ProcessedResponse processedResponse = processHttpResponse(result);
    httpClient.close();

    final String acceptOrRejectText =
        pinResetState == PinResetState.APPROVED ? 'accepting' : 'rejecting';
    final String sentryHint = 'Error while $acceptOrRejectText pin request';

    if (processedResponse.ok) {
      final Map<String, dynamic> body =
          httpClient.toMap(processedResponse.response);

      final String? error = httpClient.parseError(body);

      if (error != null) {
        Sentry.captureException(
          error,
          hint: sentryHint,
        );
        throw UserException(getErrorMessage());
      }

      final bool isRequestApproved =
          body['data']['verifyPinResetServiceRequest'] as bool? ?? false;

      if (isRequestApproved) {
        final List<ServiceRequest>? serviceRequests =
            state.serviceRequestState?.clientServiceRequests;

        if (serviceRequests != null) {
          serviceRequests.removeWhere(
            (ServiceRequest request) => request.id == serviceRequestId,
          );

          dispatch(
            UpdateServiceRequestsStateAction(
              clientServiceRequests: serviceRequests,
            ),
          );
        }

        onPinVerified?.call();
      }
    } else {
      Sentry.captureException(
        processedResponse.message,
        hint: sentryHint,
      );
      throw UserException(getErrorMessage());
    }
  }

  @override
  Object? wrapError(dynamic error) {
    if (error.runtimeType == UserException) {
      return error;
    }

    Sentry.captureException(error);
    return UserException(getErrorMessage());
  }
}
