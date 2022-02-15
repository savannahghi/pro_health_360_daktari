import 'package:async_redux/async_redux.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/domain/core/entities/core/staff_state.dart';

class StaffProfileViewModel extends Vm {
  final StaffState? clientState;

  StaffProfileViewModel({required this.clientState})
      : super(equals: <Object?>[clientState]);

  static StaffProfileViewModel fromStore(Store<AppState> store) {
    return StaffProfileViewModel(clientState: store.state.staffState);
  }
}
