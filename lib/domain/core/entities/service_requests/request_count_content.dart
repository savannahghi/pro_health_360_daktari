import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:healthcloud/domain/core/value_objects/app_enums.dart';

part 'request_count_content.freezed.dart';
part 'request_count_content.g.dart';

@freezed
class RequestCountContent with _$RequestCountContent {
  factory RequestCountContent({
    @JsonKey(name: 'requestType') ServiceRequestType? requestType,
    @JsonKey(name: 'total') int? count,
  }) = _RequestCountContent;

  factory RequestCountContent.fromJson(Map<String, dynamic> json) =>
      _$RequestCountContentFromJson(json);

  factory RequestCountContent.initial() => RequestCountContent(
        count: 0,
        requestType: ServiceRequestType.UNKNOWN,
      );
}
