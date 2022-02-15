import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:healthcloud/domain/core/entities/service_requests/pending_service_requests.dart';

part 'pending_service_request_count_response.freezed.dart';
part 'pending_service_request_count_response.g.dart';

@freezed
class PendingServiceRequestsCountResponse with _$PendingServiceRequestsCountResponse {
  factory PendingServiceRequestsCountResponse({
    @JsonKey(name: 'getPendingServiceRequestsCount')
        PendingServiceRequest? pendingServiceRequests,
  }) = _PendingServiceRequestsCountResponse;

  factory PendingServiceRequestsCountResponse.fromJson(Map<String, dynamic> json) =>
      _$PendingServiceRequestsCountResponseFromJson(json);
}
