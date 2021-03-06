import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prohealth360_daktari/domain/core/entities/service_requests/service_request_meta.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_enums.dart';

part 'service_request.freezed.dart';
part 'service_request.g.dart';

@freezed
class ServiceRequest with _$ServiceRequest {
  factory ServiceRequest({
    @JsonKey(name: 'ID') String? id,
    @JsonKey(name: 'Request') String? description,
    @JsonKey(name: 'RequestType') ServiceRequestType? serviceRequestType,
    @JsonKey(name: 'ClientID') String? clientId,
    @JsonKey(name: 'ClientName') String? clientName,
    @JsonKey(name: 'ClientContact') String? clientPhoneNumber,
    @JsonKey(name: 'Status') RequestStatus? status,
    @JsonKey(name: 'ResolvedAt') String? resolvedTime,
    @JsonKey(name: 'ResolvedBy') String? resolvedBy,
    @JsonKey(name: 'ResolvedByName') String? resolvedByName,
    @JsonKey(name: 'CreatedAt') String? createdAt,
    @JsonKey(name: 'Meta') ServiceRequestMeta? meta,
    @JsonKey(name: 'StaffID') String? staffId,
    @JsonKey(name: 'StaffName') String? staffName,
    @JsonKey(name: 'StaffContact') String? staffPhoneNumber,
  }) = _ServiceRequest;

  factory ServiceRequest.fromJson(Map<String, dynamic> json) =>
      _$ServiceRequestFromJson(json);
}
