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

import 'fetch_service_request_count_action.dart';

class ResolveStaffPinRequestAction extends ReduxAction<AppState> {
  final IGraphQlClient httpClient;
  final String staffId;
  final String serviceRequestId;
  final String phoneNumber;
  final PinResetState pinResetState;
  final VoidCallback? onPinVerified;

  ResolveStaffPinRequestAction({
    required this.staffId,
    required this.pinResetState,
    required this.serviceRequestId,
    required this.phoneNumber,
    required this.httpClient,
    this.onPinVerified,
  });

  @override
  void before() {
    super.before();
    dispatch(
      WaitAction<AppState>.add(
        '${pinResetRequestFlag}_$serviceRequestId',
      ),
    );
  }

  @override
  void after() {
    dispatch(
      WaitAction<AppState>.remove(
        '${pinResetRequestFlag}_$serviceRequestId',
      ),
    );
    super.after();
  }

  @override
  Future<AppState?> reduce() async {
    final Map<String, dynamic> variables = <String, dynamic>{
      'serviceRequestID': serviceRequestId,
      'phoneNumber': phoneNumber,
      'verificationStatus': pinResetState.name,
    };

    final Response result = await httpClient.query(
      verifyStaffPinResetServiceRequestQuery,
      variables,
    );

    final ProcessedResponse processedResponse = processHttpResponse(result);
    httpClient.close();

    if (processedResponse.ok) {
      final Map<String, dynamic> body =
          httpClient.toMap(processedResponse.response);

      final String? error = httpClient.parseError(body);

      if (error != null) {
        Sentry.captureException(
          error,
          hint: 'Error while accepting pin request',
        );
        throw UserException(getErrorMessage());
      }

      final bool isRequestApproved =
          body['data']['verifyStaffPinResetServiceRequest'] as bool? ?? false;

      if (isRequestApproved) {
        final List<ServiceRequest>? serviceRequests =
            state.serviceRequestState?.staffServiceRequests;

        if (serviceRequests != null) {
          serviceRequests.removeWhere(
            (ServiceRequest request) => request.id == serviceRequestId,
          );

          dispatch(
            UpdateServiceRequestsStateAction(
              staffServiceRequests: serviceRequests,
            ),
          );

          dispatch(FetchServiceRequestsCountAction(client: httpClient));
        }

        onPinVerified?.call();
      }
    } else {
      Sentry.captureException(
        processedResponse.message,
        hint: 'Error while accepting pin request',
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
