import 'package:async_redux/async_redux.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/entities/core/staff_state.dart';

class StaffStateViewModel extends Vm {
  final StaffState? staffState;

  StaffStateViewModel({required this.staffState})
      : super(equals: <Object?>[staffState]);

  factory StaffStateViewModel.fromStore(Store<AppState> store) {
    return StaffStateViewModel(staffState: store.state.staffState);
  }
}
