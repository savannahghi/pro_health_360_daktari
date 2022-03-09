// Flutter imports:
// Package imports:
import 'package:flutter/material.dart';
import 'package:afya_moja_core/afya_moja_core.dart';
// Project imports:
import 'package:myharehubpro/domain/core/value_objects/app_strings.dart';
import 'package:myharehubpro/presentation/onboarding/login/widgets/login_widget.dart';

//Project imports

class PhoneLoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const OnboardingScaffold(
      backgroundColor: Colors.white,
      title: phoneLoginPageTitle,
      description: phoneLoginPageDescription,
      child: LoginWidget(),
    );
  }
}
