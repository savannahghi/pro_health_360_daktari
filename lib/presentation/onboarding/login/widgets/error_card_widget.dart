// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_asset_strings.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';
// Project imports:
import 'package:shared_themes/spaces.dart';

class ErrorCardWidget extends StatelessWidget {
  const ErrorCardWidget({
    this.callBackFunction,
    this.buttonColor,
  });

  final VoidCallback? callBackFunction;
  final Color? buttonColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: SvgPicture.asset(
                errorImageSvg,
                height: 200,
                width: 200,
              ),
            ),
            Text(
              sendOTPError,
              style: normalSize15Text(
                darkGreyTextColor,
              ),
              textAlign: TextAlign.center,
            ),
            size15VerticalSizedBox,
            SizedBox(
              height: 48,
              width: double.infinity,
              child: MyAfyaHubPrimaryButton(
                customRadius: 4,
                text: resendOTP,
                textColor: Colors.white,
                buttonColor: buttonColor ?? Theme.of(context).primaryColor,
                borderColor: buttonColor ?? Theme.of(context).primaryColor,
                onPressed: callBackFunction,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
