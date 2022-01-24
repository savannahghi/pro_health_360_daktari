import 'package:async_redux/async_redux.dart';
import 'package:bewell_pro_core/presentation/router/routes.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';

class LogoutAction extends ReduxAction<AppState> {
  @override
  void after() {
    dispatch(NavigateAction<AppState>.pushReplacementNamed(phoneLoginRoute));
    super.after();
  }

  @override
  AppState reduce() {
    return AppState.initial();
  }
}
