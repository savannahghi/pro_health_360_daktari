// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_asset_strings.dart';

part 'notification_details.freezed.dart';
part 'notification_details.g.dart';

@freezed
class NotificationDetails with _$NotificationDetails {
  factory NotificationDetails({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'body') String? body,
    @JsonKey(name: 'type') String? type,
    @JsonKey(name: 'isRead', defaultValue: false) bool? isRead,
    @JsonKey(name: 'icon') IconDetails? icon,
    @JsonKey(name: 'date') String? date,
    @JsonKey(name: 'actions') List<NotificationActions>? actions,
    @JsonKey(name: 'status') String? status,
  }) = _NotificationDetails;

  factory NotificationDetails.fromJson(Map<String, dynamic> json) =>
      _$NotificationDetailsFromJson(json);

  factory NotificationDetails.initial() => NotificationDetails(
        id: UNKNOWN,
        title: UNKNOWN,
        body: UNKNOWN,
        type: UNKNOWN,
        isRead: false,
        date: UNKNOWN,
        icon: IconDetails(iconUrlSvgPath: notificationIconSvgPath),
        actions: <NotificationActions>[],
        status: UNKNOWN,
      );
}
