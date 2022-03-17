import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_enums.dart';

part 'service_request_content.freezed.dart';
part 'service_request_content.g.dart';

@freezed
class ServiceRequestContent with _$ServiceRequestContent {
  factory ServiceRequestContent({
    @JsonKey(name: 'ID') String? id,
    @JsonKey(name: 'Request') String? description,
    @JsonKey(name: 'RequestType') ServiceRequestType? serviceRequestType,
    @JsonKey(name: 'ClientID') String? clientId,
    @JsonKey(name: 'ClientName') String? clientName,
    @JsonKey(name: 'ClientContact') String? clientPhoneNumber,
    @JsonKey(name: 'Status') RequestStatus? status,
    @JsonKey(name: 'CCCNumber') String? cccNumber,
    @JsonKey(name: 'ResolvedAt') String? resolvedTime,
    @JsonKey(name: 'ResolvedBy') String? resolvedBy,
  }) = _ServiceRequestContent;

  factory ServiceRequestContent.fromJson(Map<String, dynamic> json) =>
      _$ServiceRequestContentFromJson(json);

  factory ServiceRequestContent.initial() => ServiceRequestContent(
        id: UNKNOWN,
        description: UNKNOWN,
        serviceRequestType: ServiceRequestType.UNKNOWN,
        clientId: UNKNOWN,
        clientName: UNKNOWN,
        clientPhoneNumber: UNKNOWN,
        status: RequestStatus.PENDING,
        cccNumber: UNKNOWN,
      );
}
