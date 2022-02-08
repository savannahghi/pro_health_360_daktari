// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';

// Project imports:
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/presentation/router/routes.dart';

class LogoutAction extends ReduxAction<AppState> {
  @override
  void after() {
    dispatch(
      NavigateAction<AppState>.pushNamedAndRemoveUntil(
        AppRoutes.loginPage,
        (Route<dynamic> route) => false,
      ),
    );
    super.after();
  }

  @override
  AppState reduce() {
    final AppState newState = AppState.initial();
    return newState;
  }
}
