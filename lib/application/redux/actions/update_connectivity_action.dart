import 'package:async_redux/async_redux.dart';
import 'package:myharehubpro/application/redux/states/app_state.dart';
import 'package:myharehubpro/application/redux/states/connectivity_state.dart';

class UpdateConnectivityAction extends ReduxAction<AppState> {
  UpdateConnectivityAction({required this.hasConnection});

  final bool hasConnection;

  @override
  AppState reduce() {
    final AppState newState = state.copyWith(
      connectivityState: ConnectivityState(isConnected: hasConnection),
    );

    return newState;
  }
}
