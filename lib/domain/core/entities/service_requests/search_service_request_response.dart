// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prohealth360_daktari/domain/core/entities/service_requests/service_request.dart';

part 'search_service_request_response.freezed.dart';
part 'search_service_request_response.g.dart';

@freezed
class SearchServiceRequestResponse with _$SearchServiceRequestResponse {
  factory SearchServiceRequestResponse({
    @JsonKey(name: 'searchServiceRequests') List<ServiceRequest>? serviceRequests,
  }) = _SearchServiceRequestResponse;

  factory SearchServiceRequestResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchServiceRequestResponseFromJson(json);
}
