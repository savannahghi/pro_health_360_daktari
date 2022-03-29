import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_enums.dart';

part 'service_request_count.freezed.dart';
part 'service_request_count.g.dart';

@freezed
class ServiceRequestCount with _$ServiceRequestCount {
  factory ServiceRequestCount({
    @JsonKey(name: 'requestType') ServiceRequestType? requestType,
    @JsonKey(name: 'total') int? count,
  }) = _ServiceRequestCount;

  factory ServiceRequestCount.fromJson(Map<String, dynamic> json) =>
      _$ServiceRequestCountFromJson(json);

  factory ServiceRequestCount.initial() => ServiceRequestCount(
        count: 0,
        requestType: ServiceRequestType.UNKNOWN,
      );
}
