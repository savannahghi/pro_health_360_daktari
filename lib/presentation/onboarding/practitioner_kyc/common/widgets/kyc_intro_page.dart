import 'package:bewell_pro_core/presentation/onboarding/login/widgets/onboarding_scaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/common/widgets/kyc_pre_check.dart';

/// Shows a page introducing the type of kyc the user is required to fill
class KYCIntroPage extends StatelessWidget {
  const KYCIntroPage({
    Key? key,
    required this.title,
    required this.description,
    required this.continueFunc,
  }) : super(key: key);

  final VoidCallback continueFunc;
  final String description;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnboardingScaffold(
        dimension: 0,
        title: title,
        msg: description,
        icon: Icons.article,
        child: KYCPreCheck(continueFunc: continueFunc),
      ),
    );
  }
}
