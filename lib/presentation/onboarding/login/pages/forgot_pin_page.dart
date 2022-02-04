// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/svg.dart';
import 'package:shared_themes/spaces.dart';

// Project imports:
import 'package:healthcloud/application/core/services/helpers.dart';
import 'package:healthcloud/presentation/router/routes.dart';

// Project Imports
import 'package:healthcloud/application/core/theme/app_themes.dart';
import 'package:healthcloud/domain/core/value_objects/app_asset_strings.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:healthcloud/domain/core/value_objects/app_widget_keys.dart';

class ForgotPinPage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneNumberInputController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGreyBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
                  resetPassword,
                  style: boldSize16Text(Colors.grey),
                ),
              ),
              mediumVerticalSizedBox,

              /// Phone number input
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  resetPasswordDescription,
                  style: boldSize14Text(Colors.grey),
                ),
              ),
              verySmallVerticalSizedBox,
              Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: MyAfyaHubPhoneInput(
                  backgroundColor: Colors.white,
                  phoneNumberFormatter: formatPhoneNumber,
                  inputController: _phoneNumberInputController,
                  labelText: phoneNumberInputLabelText,
                  labelStyle: boldSize16Text(),
                  onChanged: (String? value) {},
                  suffixIcon: Positioned(
                    right: 12,
                    height: 20,
                    width: 20,
                    child: SvgPicture.asset(
                      alertCircleIcon,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              mediumVerticalSizedBox,
              SizedBox(
                width: double.infinity,
                height: 50,
                child: MyAfyaHubPrimaryButton(
                  buttonKey: sendOTPButtonKey,
                  buttonColor: AppColors.buttonAltColor,
                  borderColor: Colors.transparent,
                  text: sendOTPString,
                  onPressed: () async => triggerNavigationEvent(
                    context: context,
                    route: AppRoutes.verifyPhonePage,
                    shouldReplace: true,
                    args: '',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
