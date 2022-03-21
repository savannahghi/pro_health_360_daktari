import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_asset_strings.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_widget_keys.dart';

class PinExpiredPage extends StatelessWidget {
  const PinExpiredPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const PINRequestScaffold(
      iconSvgPath: pinExpiredImage,
      title: pinExpiredTitle,
      message: pinExpiredDescription,
      actionText: changePinCTA,
      actionKey: changeMyPinButtonKey,
    );
  }
}
