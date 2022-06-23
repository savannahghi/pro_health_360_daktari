import 'package:async_redux/async_redux.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';

class RegisterStaffViewModel extends Vm {
  RegisterStaffViewModel({required this.wait, this.hasConnection = false})
      : super(equals: <Object?>[wait, hasConnection]);

  final Wait wait;
  final bool hasConnection;

  factory RegisterStaffViewModel.fromStore(Store<AppState> store) {
    return RegisterStaffViewModel(
      wait: store.state.wait!,
      hasConnection: store.state.connectivityState?.isConnected ?? false,
    );
  }
}
