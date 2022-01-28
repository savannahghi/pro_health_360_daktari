// Flutter imports:
// Package imports:
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:healthcloud/application/core/services/helpers.dart';
import 'package:misc_utilities/responsive_widget.dart';
import 'package:shared_ui_components/buttons.dart';

/// - [LandingActions] which provides navigation buttons to user that lead to:
///   - 1 => phoneLoginRoute - Prompts user to login
class AfyaMojaLandingActions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = ResponsiveWidget.isSmallScreen(context);
    return Wrap(
      runSpacing: 20,
      spacing: 20,
      children: <Widget>[
        SizedBox(
          width: isSmallScreen ? double.infinity : 212,
          height: 50,
          child: SILPrimaryButton(
            buttonKey: AppWidgetKeys.signInKey,
            buttonColor: Theme.of(context).primaryColor,
            borderColor: Colors.transparent,
            text: landingSignIn,
            onPressed: () async => triggerNavigationEvent(
              context: context,
              route: phoneLoginRoute,
            ),
          ),
        ),
      ],
    );
  }
}
