// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:mycarehubpro/application/core/services/analytics_service.dart';

// Project imports:
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_enums.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_events.dart';
import 'package:mycarehubpro/presentation/router/routes.dart';

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
  Future<AppState> reduce() async {
    await AnalyticsService().logEvent(
      name: logoutEvent,
      eventType: AnalyticsEventType.AUTH,
    );

    await AnalyticsService().reset();

    return AppState.initial();
  }
}
