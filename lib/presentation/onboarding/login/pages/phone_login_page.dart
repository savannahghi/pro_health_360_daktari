// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:afya_moja_core/onboarding_scaffold.dart';

//Project imports
import 'package:healthcloud/presentation/onboarding/login/widgets/phone_login.dart';

class PhoneLoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OnboardingScaffold(
      backgroundColor: Colors.white,
      title: phoneLoginPageTitle,
      description: phoneLoginPageDescription,
      child: PhoneLogin(),
    );
  }
}
