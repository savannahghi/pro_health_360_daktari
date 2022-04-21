// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mycarehubpro/domain/core/entities/notification/notification_details.dart';

part 'notifications_data.freezed.dart';
part 'notifications_data.g.dart';

@freezed
class NotificationsData with _$NotificationsData {
  factory NotificationsData({
    @JsonKey(name: 'notifications')
        required List<NotificationDetails> notifications,
  }) = _NotificationsData;

  factory NotificationsData.fromJson(Map<String, dynamic> json) =>
      _$NotificationsDataFromJson(json);
}
