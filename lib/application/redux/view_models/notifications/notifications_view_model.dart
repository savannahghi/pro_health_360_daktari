import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';

class NotificationsViewModel extends Vm {
  final Wait wait;
  final List<NotificationDetails?> notifications;

  NotificationsViewModel({
    required this.wait,
    required this.notifications,
  }) : super(equals: <Object?>[wait, notifications]);

  factory NotificationsViewModel.fromStore(Store<AppState> store) {
    return NotificationsViewModel(
      wait: store.state.wait!,
      notifications:
          store.state.staffState?.notifications ?? <NotificationDetails>[],
    );
  }
}
