// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mycarehubpro/domain/core/entities/service_requests/pending_service_requests.dart';
import 'package:mycarehubpro/domain/core/entities/service_requests/service_request_content.dart';

part 'service_requests_state.freezed.dart';
part 'service_requests_state.g.dart';

@freezed
class ServiceRequestState with _$ServiceRequestState {
  factory ServiceRequestState({
    Map<String, ServiceRequestContent>? serviceRequestContent,
    PendingServiceRequest? pendingServiceRequests,
    bool? errorFetchingServiceRequests,
  }) = _ServiceRequestState;

  factory ServiceRequestState.fromJson(Map<String, dynamic> json) =>
      _$ServiceRequestStateFromJson(json);

  factory ServiceRequestState.initial() => ServiceRequestState(
        serviceRequestContent: <String, ServiceRequestContent>{},
        errorFetchingServiceRequests: false,
        pendingServiceRequests: PendingServiceRequest.initial(),
      );
}
