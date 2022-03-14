import 'package:async_redux/async_redux.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';

class RegisterClientViewModel extends Vm {
  RegisterClientViewModel({required this.wait, this.hasConnection = false})
      : super(equals: <Object?>[wait, hasConnection]);

  final Wait wait;
  final bool hasConnection;

  factory RegisterClientViewModel.fromStore(Store<AppState> store) {
    return RegisterClientViewModel(
      wait: store.state.wait!,
      hasConnection: store.state.connectivityState?.isConnected ?? false,
    );
  }
}
