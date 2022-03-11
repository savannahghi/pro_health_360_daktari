import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_enums.dart';

part 'service_request_content.freezed.dart';
part 'service_request_content.g.dart';

@freezed
class ServiceRequestContent with _$ServiceRequestContent {
  factory ServiceRequestContent({
    @JsonKey(name: 'Request') String? description,
    @JsonKey(name: 'ClientName') String? clientName,
    @JsonKey(name: 'ClientContact') String? clientPhoneNumber,
    @JsonKey(name: 'RequestType') ServiceRequestType? serviceRequestType,
    @JsonKey(name: 'ResolvedAt') String? resolvedTime,
    @JsonKey(name: 'ResolvedBy') String? resolvedBy,
  }) = _ServiceRequestContent;

  factory ServiceRequestContent.fromJson(Map<String, dynamic> json) =>
      _$ServiceRequestContentFromJson(json);

  factory ServiceRequestContent.initial() => ServiceRequestContent(
        description: UNKNOWN,
        clientName: UNKNOWN,
        clientPhoneNumber: UNKNOWN,
        serviceRequestType: ServiceRequestType.UNKNOWN,
        resolvedTime: UNKNOWN,
        resolvedBy: UNKNOWN,
      );
}
