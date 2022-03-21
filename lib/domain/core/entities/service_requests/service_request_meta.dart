import 'package:freezed_annotation/freezed_annotation.dart';

part 'service_request_meta.freezed.dart';
part 'service_request_meta.g.dart';

@freezed
class ServiceRequestMeta with _$ServiceRequestMeta {
  factory ServiceRequestMeta({
    @JsonKey(name: 'ccc_number') String? cccNumber,
    @JsonKey(name: 'is_ccc_number_valid') bool? isCccNumberValid,
  }) = _ServiceRequestMeta;

  factory ServiceRequestMeta.fromJson(Map<String, dynamic> json) =>
      _$ServiceRequestMetaFromJson(json);
}
