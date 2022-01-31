// Package imports:
import 'package:async_redux/async_redux.dart';

// Project imports:
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/domain/core/entities/core/staff_state.dart';
import 'package:healthcloud/domain/core/entities/core/user.dart';

/// This class replaces the whole user object
class UpdateUserAction extends ReduxAction<AppState> {
  UpdateUserAction({this.user});

  final User? user;

  @override
  AppState reduce() {
    final StaffState? newStaffState = state.staffState?.copyWith(user: user);
    final AppState newState =
        state.copyWith(staffState: newStaffState ?? state.staffState);

    return newState;
  }
}
