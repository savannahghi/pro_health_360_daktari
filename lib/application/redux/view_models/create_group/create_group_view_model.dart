import 'package:async_redux/async_redux.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';

class CreateGroupViewModel extends Vm {
  CreateGroupViewModel({required this.wait, this.hasConnection = false})
      : super(equals: <Object?>[wait, hasConnection]);

  final Wait wait;
  final bool hasConnection;

  factory CreateGroupViewModel.fromStore(Store<AppState> store) {
    return CreateGroupViewModel(
      wait: store.state.wait!,
      hasConnection: store.state.connectivityState?.isConnected ?? false,
    );
  }
}
