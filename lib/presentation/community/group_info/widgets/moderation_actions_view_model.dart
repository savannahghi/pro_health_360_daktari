import 'package:async_redux/async_redux.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';

class ModerationActionsViewModel extends Vm {
  final Wait wait;

  ModerationActionsViewModel({required this.wait})
      : super(equals: <Object?>[wait]);

  factory ModerationActionsViewModel.fromStore(Store<AppState> store) {
    return ModerationActionsViewModel(wait: store.state.wait!);
  }
}
