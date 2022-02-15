import 'package:async_redux/async_redux.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';

class CreatePinViewModel extends Vm {
  final Wait wait;
  final bool hasConnection;

  CreatePinViewModel({required this.wait, this.hasConnection = false})
      : super(equals: <Object?>[wait, hasConnection]);

  factory CreatePinViewModel.fromStore(Store<AppState> store) {
    return CreatePinViewModel(
      wait: store.state.wait!,
      hasConnection: store.state.connectivityState?.isConnected ?? false,
    );
  }
}
