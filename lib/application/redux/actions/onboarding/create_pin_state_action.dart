import 'package:async_redux/async_redux.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/domain/core/entities/login/create_pin.dart';

class CreatePINStateAction extends ReduxAction<AppState> {
  CreatePINStateAction({
    this.confirmPIN,
    this.newPIN,
  });

  final String? confirmPIN;
  final String? newPIN;

  @override
  AppState reduce() {
    final AppState newState = state.copyWith.onboardingState!.call(
      createPINState: CreatePINState(newPIN: newPIN, confirmPIN: confirmPIN),
    );

    return newState;
  }
}
