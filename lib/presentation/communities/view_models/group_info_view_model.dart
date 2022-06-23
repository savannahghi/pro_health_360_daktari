import 'package:async_redux/async_redux.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';

class GroupInfoViewModel extends Vm {
  final Wait wait;

  GroupInfoViewModel({required this.wait}) : super(equals: <Object?>[wait]);

  factory GroupInfoViewModel.fromStore(Store<AppState> store) {
    return GroupInfoViewModel(
      wait: store.state.wait!,
    );
  }
}
