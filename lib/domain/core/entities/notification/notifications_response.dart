// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mycarehubpro/domain/core/entities/notification/notifications_data.dart';

part 'notifications_response.freezed.dart';
part 'notifications_response.g.dart';

@freezed
class NotificationsResponse with _$NotificationsResponse {
  factory NotificationsResponse({
    @JsonKey(name: 'fetchNotifications') required NotificationsData data,
  }) = _NotificationsResponse;

  factory NotificationsResponse.fromJson(Map<String, dynamic> json) =>
      _$NotificationsResponseFromJson(json);
}
