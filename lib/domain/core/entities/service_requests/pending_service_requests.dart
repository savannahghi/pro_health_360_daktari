import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prohealth360_daktari/domain/core/entities/service_requests/service_request_count.dart';

part 'pending_service_requests.freezed.dart';
part 'pending_service_requests.g.dart';

@freezed
class PendingServiceRequest with _$PendingServiceRequest {
  factory PendingServiceRequest({
    @JsonKey(name: 'total') int? total,
    @JsonKey(name: 'requestsTypeCount')
        List<ServiceRequestCount>? serviceRequestsCount,
  }) = _PendingServiceRequest;

  factory PendingServiceRequest.fromJson(Map<String, dynamic> json) =>
      _$PendingServiceRequestFromJson(json);

  factory PendingServiceRequest.initial() => PendingServiceRequest(
        total: 0,
        serviceRequestsCount: <ServiceRequestCount>[],
      );
}
