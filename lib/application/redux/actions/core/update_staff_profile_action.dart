// Package imports:
import 'package:async_redux/async_redux.dart';

// Project imports:
import 'package:healthcloud/application/redux/states/app_state.dart';

// Project imports:

// TODO(paul): rewrite this action to cater for the new fields
class UpdateStaffProfileAction extends ReduxAction<AppState> {
  UpdateStaffProfileAction({
    this.id,
    this.active,
  });

  final String? id;
  final bool? active;

  @override
  AppState reduce() {
    final AppState newState = state.copyWith(
      staffState: state.staffState?.copyWith.call(
        id: this.id ?? state.staffState?.id,
        active: this.active ?? state.staffState?.active,
      ),
    );

    return newState;
  }
}
