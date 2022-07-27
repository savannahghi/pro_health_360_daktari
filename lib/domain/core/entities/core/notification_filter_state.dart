import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:afya_moja_core/src/domain/core/entities/notifications/notification_filter.dart';

part 'notification_filter_state.freezed.dart';
part 'notification_filter_state.g.dart';

@freezed
class NotificationFilterState with _$NotificationFilterState {
  factory NotificationFilterState({
    List<NotificationFilter?>? notificationFilters,
    NotificationFilter? selectedFilter,
  }) = _NotificationFilterState;

  factory NotificationFilterState.fromJson(Map<String, dynamic> json) =>
      _$NotificationFilterStateFromJson(json);

  factory NotificationFilterState.initial() => NotificationFilterState(
        notificationFilters: <NotificationFilter>[],
      );
}
