import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mycarehubpro/domain/core/entities/service_requests/request_count_content.dart';

part 'pending_service_requests.freezed.dart';
part 'pending_service_requests.g.dart';

@freezed
class PendingServiceRequest with _$PendingServiceRequest {
  factory PendingServiceRequest({
    @JsonKey(name: 'total') int? total,
    @JsonKey(name: 'requestsTypeCount')
        List<RequestCountContent>? serviceRequestsCount,
  }) = _PendingServiceRequest;

  factory PendingServiceRequest.fromJson(Map<String, dynamic> json) =>
      _$PendingServiceRequestFromJson(json);

  factory PendingServiceRequest.initial() => PendingServiceRequest(
        total: 0,
        serviceRequestsCount: <RequestCountContent>[],
      );
}
