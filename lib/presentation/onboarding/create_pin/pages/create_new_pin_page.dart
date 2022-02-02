// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:afya_moja_core/buttons.dart';
import 'package:afya_moja_core/custom_text_field.dart';
import 'package:afya_moja_core/onboarding_scaffold.dart';
import 'package:afya_moja_core/text_themes.dart';
import 'package:shared_themes/spaces.dart';

// Project imports:
import 'package:healthcloud/application/core/services/utils.dart';
import 'package:healthcloud/application/core/theme/app_themes.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:healthcloud/domain/core/value_objects/app_widget_keys.dart';

/// [CreateNewPINPage] has two [CustomTextField] to create new user PIN
///
/// The [CustomTextField] for confirm PIN validates if it matches the
/// PIN entered in the above [CustomTextField]

class CreateNewPINPage extends StatefulWidget {
  @override
  _CreateNewPINPageState createState() => _CreateNewPINPageState();
}

class _CreateNewPINPageState extends State<CreateNewPINPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController pinController = TextEditingController();
  late String pin = '';
  late String confirmPin = '';
  bool isTermsAccepted = false;

  @override
  Widget build(BuildContext context) {
    return OnboardingScaffold(
      backgroundColor: Colors.white,
      title: createNewPINTitleString,
      description: createNewPINSubTitleString,
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 1.6,
        child: Stack(
          children: <Widget>[
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      newPinString,
                      style: boldSize14Text(),
                    ),
                  ),
                  verySmallVerticalSizedBox,
                  CustomTextField(
                    customFillColor: AppColors.inputBackgroundColor,
                    autovalidateMode: AutovalidateMode.disabled,
                    formFieldKey: pinInputKey,
                    borderColor: Colors.grey[200],
                    maxLength: 4,
                    maxLines: 1,
                    keyboardType: TextInputType.number,
                    obscureText: true,
                    validator: userPinValidator,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    onChanged: (String val) {
                      setState(() {
                        pin = val;
                      });
                    },
                  ),
                  verySmallVerticalSizedBox,
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      confirmPinString,
                      style: boldSize14Text(),
                    ),
                  ),
                  verySmallVerticalSizedBox,
                  CustomTextField(
                    customFillColor: AppColors.inputBackgroundColor,
                    autovalidateMode: AutovalidateMode.disabled,
                    formFieldKey: confirmPinInputKey,
                    borderColor: Colors.grey[200],
                    maxLength: 4,
                    maxLines: 1,
                    keyboardType: TextInputType.number,
                    obscureText: true,
                    validator: userPinValidator,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    onChanged: (String val) {
                      setState(() {
                        confirmPin = val;
                      });
                    },
                  ),
                  verySmallVerticalSizedBox,
                  CheckboxListTile(
                    contentPadding: EdgeInsets.zero,
                    controlAffinity: ListTileControlAffinity.leading,
                    title: Text(
                      acceptTermsAndConditionsString,
                      style: boldSize14Text(AppColors.textAltColor),
                    ),
                    value: isTermsAccepted,
                    onChanged: (bool? value) {
                      setState(() {
                        isTermsAccepted = value!;
                      });
                    },
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: double.infinity,
                height: 52,
                child: MyAfyaHubPrimaryButton(
                  buttonKey: createPINContinueButtonKey,
                  onPressed: () {
                    if (!confirmPinValidator(pin, confirmPin)) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(pinMustMatchString),
                          duration: Duration(seconds: 2),
                        ),
                      );
                      return;
                    }
                    if (_formKey.currentState!.validate()) {
                      if (!isTermsAccepted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(acceptTermsString),
                            duration: Duration(seconds: 2),
                          ),
                        );
                        return;
                      }
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(comingSoon),
                          duration: Duration(seconds: 2),
                        ),
                      );
                      return;
                    }
                  },
                  buttonColor: Theme.of(context).primaryColor,
                  borderColor: Colors.transparent,
                  text: continueText,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
