import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prohealth360_daktari/domain/core/entities/service_requests/service_request_type_count.dart';

part 'pending_service_request_count.freezed.dart';
part 'pending_service_request_count.g.dart';

@freezed
class PendingServiceRequestCount with _$PendingServiceRequestCount {
  factory PendingServiceRequestCount({
    @JsonKey(name: 'clientsServiceRequestCount')
        ServiceRequestTypeCount? clientsServiceRequestCount,
    @JsonKey(name: 'staffServiceRequestCount')
        ServiceRequestTypeCount? staffServiceRequestCount,
  }) = _PendingServiceRequestCount;

  factory PendingServiceRequestCount.fromJson(Map<String, dynamic> json) =>
      _$PendingServiceRequestCountFromJson(json);

  factory PendingServiceRequestCount.initial() => PendingServiceRequestCount(
        clientsServiceRequestCount: ServiceRequestTypeCount.initial(),
        staffServiceRequestCount: ServiceRequestTypeCount.initial(),
      );
}
