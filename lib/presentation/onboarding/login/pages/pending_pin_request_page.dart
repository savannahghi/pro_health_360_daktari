import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_asset_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/router/routes.dart';

class PendingPINRequestPage extends StatelessWidget {
  const PendingPINRequestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PINRequestScaffold(
      iconSvgPath: pinRequestSentImage,
      title: pendingPINRequestTitleString,
      message: pendingPINRequestMessageString,
      actionText: signInWithAnotherNumberString,
      actionCallback: () =>
          Navigator.of(context).pushReplacementNamed(AppRoutes.loginPage),
      actionKey: signInWithAnotherNumberButtonKey,
    );
  }
}
