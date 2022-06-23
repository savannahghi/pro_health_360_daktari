import 'package:async_redux/async_redux.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/states/misc_state.dart';

class MiscStateViewModel extends Vm {
  MiscStateViewModel({
    required this.wait,
    this.state,
  });

  final MiscState? state;
  final Wait wait;

  factory MiscStateViewModel.fromStore(Store<AppState> store) {
    return MiscStateViewModel(
      state: store.state.miscState,
      wait: store.state.wait!,
    );
  }
}
