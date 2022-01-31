// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:afya_moja_core/buttons.dart';
import 'package:afya_moja_core/inputs.dart';
import 'package:afya_moja_core/text_themes.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_themes/spaces.dart';

// Project imports:
import 'package:healthcloud/application/core/theme/app_themes.dart';
import 'package:healthcloud/domain/core/value_objects/app_asset_strings.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';

class VerifyOTPPage extends StatefulWidget {
  final int otp;
  const VerifyOTPPage({required this.otp});

  @override
  _VerifyOTPPageState createState() => _VerifyOTPPageState();
}

class _VerifyOTPPageState extends State<VerifyOTPPage> {
  bool isValid = false;
  TextEditingController otpEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    void checkValidInput(String value) {
      if (widget.otp == int.parse(value)) {
        setState(() {
          isValid = true;
        });
      } else {
        setState(() {
          isValid = false;
        });
      }
    }

    return Scaffold(
      backgroundColor: AppColors.lightGreyBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 70),
              child: Center(
                child: Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topCenter,
                      child: SvgPicture.asset(
                        shieldIcon,
                        height: 75,
                        width: 75,
                        color: Colors.black,
                      ),
                    ),
                    largeVerticalSizedBox,
                    Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        verifyPhoneNumberTitle,
                        style: boldSize16Text(Colors.grey),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    smallVerticalSizedBox,
                    Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        enterOTPString,
                        style:
                            boldSize16Text(AppColors.secondaryColor),
                      ),
                    ),
                    mediumVerticalSizedBox,
                    VerifyOTPInput(
                      maxLength: 4,
                      onDone: checkValidInput,
                      controller: otpEditingController,
                    ),
                    smallVerticalSizedBox,
                    if (!isValid && otpEditingController.value.text.isNotEmpty)
                      Text(
                        invalidOTPString,
                        style: boldSize16Text(Colors.red),
                      ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: SizedBox(
                width: double.infinity,
                height: 52,
                child: MyAfyaHubPrimaryButton(
                  customRadius: 4,
                  text: confirmOTPButtonString,
                  buttonColor: isValid ? AppColors.buttonAltColor : Colors.grey,
                  borderColor: isValid ? AppColors.buttonAltColor : Colors.grey,
                  onPressed: !isValid
                      ? null
                      : () {
                          return;
                        },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
