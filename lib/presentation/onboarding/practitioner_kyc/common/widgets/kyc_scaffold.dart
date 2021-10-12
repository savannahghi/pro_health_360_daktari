// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:bewell_pro_core/presentation/core/widgets/app_scaffold.dart';

// Project imports:
import 'package:healthcloud/application/redux/actions/core/afyamoja_logout_action.dart';

class KYCScaffold extends StatelessWidget {
  const KYCScaffold({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: child,
      logoutAction: AfyaMojaLogoutAction(),
    );
  }
}
