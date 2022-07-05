// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prohealth360_daktari/application/redux/states/service_requests/screening_tools_state.dart';
import 'package:prohealth360_daktari/domain/core/entities/service_requests/pending_service_request_count.dart';
import 'package:prohealth360_daktari/domain/core/entities/service_requests/service_request.dart';

part 'service_requests_state.freezed.dart';
part 'service_requests_state.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class ServiceRequestState with _$ServiceRequestState {
  factory ServiceRequestState({
    // Client service requests
    List<ServiceRequest>? clientServiceRequests,

    // Staff service requests
    List<ServiceRequest>? staffServiceRequests,

    // Resolved service requests
    List<ServiceRequest>? resolvedServiceRequests,

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
        resolvedServiceRequests: <ServiceRequest>[],
        pendingServiceRequestsCount: PendingServiceRequestCount.initial(),
        screeningToolsState: ScreeningToolsState.initial(),
        errorFetchingPendingServiceRequests: false,
      );
}
