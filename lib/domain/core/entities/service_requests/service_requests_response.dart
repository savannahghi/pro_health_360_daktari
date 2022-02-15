import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:healthcloud/domain/core/entities/service_requests/service_request_content.dart';

part 'service_requests_response.freezed.dart';
part 'service_requests_response.g.dart';

@freezed
class ServiceRequestsResponse with _$ServiceRequestsResponse {
  factory ServiceRequestsResponse({
    @JsonKey(name: 'getServiceRequests') List<ServiceRequestContent>? serviceRequestContent,
  }) = _ServiceRequestsResponse;

  factory ServiceRequestsResponse.fromJson(Map<String, dynamic> json) =>
      _$ServiceRequestsResponseFromJson(json);
}
