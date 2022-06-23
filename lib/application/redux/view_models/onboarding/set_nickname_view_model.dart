import 'package:async_redux/async_redux.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';

class SetNicknameViewModel extends Vm {
  final Wait wait;
  final bool hasInternetConnection;

  SetNicknameViewModel({required this.wait, this.hasInternetConnection = false})
      : super(equals: <Object?>[wait, hasInternetConnection]);

  factory SetNicknameViewModel.fromStore(Store<AppState> store) {
    return SetNicknameViewModel(
      wait: store.state.wait!,
      hasInternetConnection:
          store.state.connectivityState?.isConnected ?? false,
    );
  }
}
