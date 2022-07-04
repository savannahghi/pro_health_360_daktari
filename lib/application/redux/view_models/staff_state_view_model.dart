import 'package:async_redux/async_redux.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/entities/core/staff_state.dart';

class StaffStateViewModel extends Vm {
  final StaffState? staffState;
  final Wait? wait;

  StaffStateViewModel({required this.staffState, required this.wait})
      : super(equals: <Object?>[staffState, wait]);

  factory StaffStateViewModel.fromStore(Store<AppState> store) {
    return StaffStateViewModel(
      staffState: store.state.staffState,
      wait: store.state.wait,
    );
  }
}
