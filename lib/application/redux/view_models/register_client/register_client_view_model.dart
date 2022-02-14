import 'package:async_redux/async_redux.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';

class RegisterClientViewModel extends Vm {
  RegisterClientViewModel({required this.wait})
      : super(
          equals: <Object?>[wait],
        );

  final Wait wait;

  factory RegisterClientViewModel.fromStore(Store<AppState> store) {
    return RegisterClientViewModel(wait: store.state.wait!);
  }
}
