// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/presentation/router/routes.dart';

// Project imports:
import 'package:healthcloud/application/redux/states/app_state.dart';

class AfyaMojaLogoutAction extends ReduxAction<CoreState> {
  @override
  void after() {
    dispatch(NavigateAction<CoreState>.pushReplacementNamed(phoneLoginRoute));
    super.after();
  }

  @override
  CoreState reduce() {
    return AppState.initial();
  }
}
