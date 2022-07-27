import 'package:async_redux/async_redux.dart';
import 'package:afya_moja_core/src/domain/core/entities/notifications/notification_filter.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/entities/core/notification_filter_state.dart';

class UpdateNotificationFilterStateAction extends ReduxAction<AppState> {
  UpdateNotificationFilterStateAction({
    this.selectedFilter,
    this.notificationFilters,
  });

  final NotificationFilter? selectedFilter;
  final List<NotificationFilter>? notificationFilters;

  @override
  Future<AppState> reduce() async {
    final NotificationFilterState notificationFilterState =
        NotificationFilterState(
      selectedFilter: selectedFilter ??
          state.staffState?.notificationFilterState?.selectedFilter,
      notificationFilters: notificationFilters ??
          state.staffState?.notificationFilterState?.notificationFilters,
    );

    final AppState newState = state.copyWith.call(
      staffState: state.staffState?.copyWith
          .call(notificationFilterState: notificationFilterState),
    );

    return newState;
  }
}
