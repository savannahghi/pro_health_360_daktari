import 'package:domain_objects/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'service_request_content.freezed.dart';
part 'service_request_content.g.dart';

@freezed
class ServiceRequestContent with _$ServiceRequestContent {
  factory ServiceRequestContent({
    @JsonKey(name: 'Request') String? description,
    @JsonKey(name: 'ClientName') String? clientName,
    @JsonKey(name: 'ClientContact') String? clientPhoneNumber,
  }) = _ServiceRequestContent;

  factory ServiceRequestContent.fromJson(Map<String, dynamic> json) =>
      _$ServiceRequestContentFromJson(json);

  factory ServiceRequestContent.initial() => ServiceRequestContent(
        description: UNKNOWN,
        clientName: UNKNOWN,
        clientPhoneNumber: UNKNOWN,
      );
}
