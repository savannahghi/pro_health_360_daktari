// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mycarehubpro/application/redux/states/service_requests/screening_tools_state.dart';
import 'package:mycarehubpro/domain/core/entities/service_requests/pending_service_request_count.dart';
import 'package:mycarehubpro/domain/core/entities/service_requests/service_request.dart';

part 'service_requests_state.freezed.dart';
part 'service_requests_state.g.dart';

@freezed
class ServiceRequestState with _$ServiceRequestState {
  factory ServiceRequestState({
    // Client service requests
    List<ServiceRequest>? clientServiceRequests,

    // Staff service requests
    List<ServiceRequest>? staffServiceRequests,

    // Service requests count
    PendingServiceRequestCount? pendingServiceRequestsCount,

    // Screening tools
    ScreeningToolsState? screeningToolsState,

    /// Other booleans
    bool? errorFetchingPendingServiceRequests,
  }) = _ServiceRequestState;

  factory ServiceRequestState.fromJson(Map<String, dynamic> json) =>
      _$ServiceRequestStateFromJson(json);
  factory ServiceRequestState.initial() => ServiceRequestState(
        clientServiceRequests: <ServiceRequest>[],
        staffServiceRequests: <ServiceRequest>[],
        pendingServiceRequestsCount: PendingServiceRequestCount.initial(),

        screeningToolsState: ScreeningToolsState.initial(),
        errorFetchingPendingServiceRequests: false,
      );
}
