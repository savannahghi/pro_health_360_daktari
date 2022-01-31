// Package imports:
import 'package:async_redux/async_redux.dart';

// Project imports:
import 'package:healthcloud/application/redux/states/app_state.dart';

class AppStateViewModel extends Vm {
  final AppState state;

  AppStateViewModel({required this.state}) : super(equals: <Object?>[state]);

  static AppStateViewModel fromStore(Store<AppState> store) {
    return AppStateViewModel(state: store.state);
  }
}
