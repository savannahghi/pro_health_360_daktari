import 'package:async_redux/async_redux.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';

class ConnectivityViewModel extends Vm {
  ConnectivityViewModel({bool? isConnected})
      : isConnected = isConnected ?? false,
        super(equals: <Object?>[isConnected]);

  final bool isConnected;

  factory ConnectivityViewModel.fromStore(AppState state) {
    return ConnectivityViewModel(
      isConnected: state.connectivityState?.isConnected,
    );
  }
}
