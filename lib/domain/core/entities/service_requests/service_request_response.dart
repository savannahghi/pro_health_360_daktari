// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mycarehubpro/domain/core/entities/service_requests/pending_service_requests.dart';
import 'package:mycarehubpro/domain/core/entities/service_requests/service_request_content.dart';

part 'service_request_response.freezed.dart';
part 'service_request_response.g.dart';

@freezed
class ServiceRequestResponse with _$ServiceRequestResponse {
  factory ServiceRequestResponse({
    @JsonKey(name: 'getServiceRequests')
        List<ServiceRequestContent>? serviceRequestContent,
    @JsonKey(name: 'getPendingServiceRequestsCount')
        PendingServiceRequest? pendingServiceRequests,
    bool? errorFetchingServiceRequests,
  }) = _ServiceRequestResponse;

  factory ServiceRequestResponse.fromJson(Map<String, dynamic> json) =>
      _$ServiceRequestResponseFromJson(json);
}
