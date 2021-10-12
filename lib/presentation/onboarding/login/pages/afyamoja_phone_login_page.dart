// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/presentation/onboarding/login/widgets/onboarding_scaffold.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

// Project imports:
import 'package:healthcloud/presentation/onboarding/login/widgets/afyamoja_phone_login.dart';

class AfyaMojaPhoneLoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const double dimension = 0;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: OnboardingScaffold(
        dimension: dimension,
        title: phoneLoginTitle,
        msg: phoneLoginMessage,
        icon: MdiIcons.phone,
        child: AfyaMojaPhoneLogin(),
      ),
    );
  }
}
