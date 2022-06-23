// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prohealth360_daktari/domain/core/entities/service_requests/pending_service_request_count.dart';
import 'package:prohealth360_daktari/domain/core/entities/service_requests/service_request.dart';

part 'service_request_response.freezed.dart';
part 'service_request_response.g.dart';

@freezed
class ServiceRequestResponse with _$ServiceRequestResponse {
  factory ServiceRequestResponse({
    @JsonKey(name: 'getServiceRequests') List<ServiceRequest>? serviceRequests,
    @JsonKey(name: 'getPendingServiceRequestsCount')
        PendingServiceRequestCount? pendingServiceRequests,
    bool? errorFetchingServiceRequests,
  }) = _ServiceRequestResponse;

  factory ServiceRequestResponse.fromJson(Map<String, dynamic> json) =>
      _$ServiceRequestResponseFromJson(json);
}
