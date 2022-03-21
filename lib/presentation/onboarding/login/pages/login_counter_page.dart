import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_widget_keys.dart';
import 'package:mycarehubpro/presentation/router/routes.dart';

class LoginCounterPage extends StatelessWidget {
  final int? retryTime;

  const LoginCounterPage({required this.retryTime});

  @override
  Widget build(BuildContext context) {
    return LoginCounterWidget(
      retryTimeout: retryTime ?? 0,
      actionKey: askForHelpButtonKey,
      actionText: askForHelpString,
      onTimerEnded: () => Navigator.of(context)
          .pushReplacementNamed(AppRoutes.loginPage),
      onButtonTapped: () => Navigator.of(context)
          .pushReplacementNamed(AppRoutes.verifySecurityQuestionsHelpPage),
    );
  }
}
