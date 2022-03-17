import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart';
import 'package:mycarehubpro/application/core/graphql/mutations.dart';
import 'package:mycarehubpro/application/redux/actions/flags/app_flags.dart';
import 'package:mycarehubpro/application/redux/actions/service_requests/update_service_requests_state_action.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/domain/core/entities/service_requests/service_request_content.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class AcceptPinRequestAction extends ReduxAction<AppState> {
  final IGraphQlClient httpClient;
  final String clientId;
  final String serviceRequestId;
  final String cccNumber;
  final String phoneNumber;
  final bool physicalIdentityVerified;
  final VoidCallback? onPinVerified;

  AcceptPinRequestAction({
    required this.clientId,
    required this.serviceRequestId,
    required this.cccNumber,
    required this.phoneNumber,
    required this.physicalIdentityVerified,
    required this.httpClient,
    this.onPinVerified,
  });

  @override
  void before() {
    super.before();
    dispatch(
      WaitAction<AppState>.add('${pinResetAcceptFlag}_$serviceRequestId'),
    );
  }

  @override
  void after() {
    dispatch(
      WaitAction<AppState>.remove('${pinResetAcceptFlag}_$serviceRequestId'),
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
    };

    final Response result =
        await httpClient.query(pinResetRequestMutation, variables);

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
          body['data']['approvePinResetServiceRequest'] as bool? ?? false;

      if (isRequestApproved) {
        final Map<String, ServiceRequestContent>? serviceRequests =
            state.serviceRequestState?.serviceRequestContent;

        if (serviceRequests != null) {
          final ServiceRequestContent? removed =
              serviceRequests.remove(serviceRequestId);

          if (removed != null) {
            final List<ServiceRequestContent> newRequests =
                <ServiceRequestContent>[];

            for (final MapEntry<String, ServiceRequestContent> entry
                in serviceRequests.entries) {
              newRequests.add(entry.value);
            }

            dispatch(
              UpdateServiceRequestsStateAction(
                serviceRequestContent: newRequests,
              ),
            );
          }
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
