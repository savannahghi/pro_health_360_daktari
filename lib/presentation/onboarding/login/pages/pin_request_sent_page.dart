import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_asset_strings.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';
class PinRequestSentPage extends StatelessWidget {
  const PinRequestSentPage();

  @override
  Widget build(BuildContext context) {
    return PINRequestScaffold(
      iconSvgPath: pinRequestSentImage,
      title: pinResetRequestSent,
      message: '$weHaveNotifiedAdmin\n\n$oncePinRest',
      actionText: actionTextGenericNoData,
      actionCallback: () {
        if (Navigator.canPop(context)) {
          Navigator.of(context).pop();
        }
      },
    );
  }
}
