import 'package:async_redux/async_redux.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';

class CommunityListViewModel extends Vm {
  CommunityListViewModel({
    required this.wait,
  }) : super(equals: <Object?>[wait]);

  final Wait wait;

  factory CommunityListViewModel.fromStore(Store<AppState> store) {
    return CommunityListViewModel(wait: store.state.wait!);
  }
}
