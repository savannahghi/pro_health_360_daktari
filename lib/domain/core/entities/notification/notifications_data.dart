// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

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
