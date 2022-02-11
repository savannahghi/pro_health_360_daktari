// Package imports:
import 'package:async_redux/async_redux.dart';
// Project imports:
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/domain/core/entities/core/facility.dart';

// Project imports:

// TODO(paul): rewrite this action to cater for the new fields
class UpdateStaffProfileAction extends ReduxAction<AppState> {
  UpdateStaffProfileAction({
    this.id,
    this.active,
    this.staffNumber,
    this.defaultFacility,
    this.facilities,
  });

  final String? id;
  final bool? active;
  final String? staffNumber;
  final String? defaultFacility;
  final List<Facility>? facilities;

  @override
  AppState reduce() {
    final AppState newState = state.copyWith(
      staffState: state.staffState?.copyWith.call(
        id: this.id ?? state.staffState?.id,
        active: this.active ?? state.staffState?.active,
        staffNumber: this.staffNumber ?? state.staffState?.staffNumber,
        defaultFacility:
            this.defaultFacility ?? state.staffState?.defaultFacility,
        facilities: this.facilities ?? state.staffState?.facilities,
      ),
    );

    return newState;
  }
}
