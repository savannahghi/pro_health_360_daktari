// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:bewell_pro_core/application/redux/states/user_state.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';

class UserStateViewModel {
  final UserState userState;

  UserStateViewModel({required this.userState});

  static UserStateViewModel fromStore(Store<AppState> store) {
    return UserStateViewModel(userState: store.state.userState!);
  }
}
