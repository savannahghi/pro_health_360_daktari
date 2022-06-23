import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prohealth360_daktari/domain/core/entities/service_requests/service_request_count.dart';

part 'service_request_type_count.g.dart';
part 'service_request_type_count.freezed.dart';

@freezed
class ServiceRequestTypeCount with _$ServiceRequestTypeCount {
  factory ServiceRequestTypeCount({
    @JsonKey(name: 'requestsTypeCount')
        List<ServiceRequestCount>? requestsTypeCount,
  }) = _ServiceRequestTypeCount;

  factory ServiceRequestTypeCount.fromJson(Map<String, dynamic> json) =>
      _$ServiceRequestTypeCountFromJson(json);

  factory ServiceRequestTypeCount.initial() => ServiceRequestTypeCount(
        requestsTypeCount: <ServiceRequestCount>[],
      );
}
