import 'package:async_redux/async_redux.dart';
import 'package:bewell_pro_core/application/core/services/helpers.dart';
import 'package:bewell_pro_core/application/core/services/input_validators.dart';
import 'package:bewell_pro_core/application/redux/actions/misc_state_actions/batch_update_misc_state_action.dart';
import 'package:bewell_pro_core/application/redux/actions/user_state_actions/phone_login_action.dart';
import 'package:bewell_pro_core/application/redux/flags/flags.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/application/redux/view_models/core_state_view_model.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/presentation/onboarding/login/widgets/error_alert_box.dart';
import 'package:bewell_pro_core/presentation/router/routes.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:healthcloud/domain/core/value_objects/app_widget_keys.dart';
import 'package:misc_utilities/misc.dart';
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';
import 'package:shared_ui_components/buttons.dart';
import 'package:shared_ui_components/inputs.dart';
import 'package:shared_ui_components/platform_loader.dart';

class AfyaMojaPhoneLogin extends StatefulWidget {
  @override
  _AfyaMojaPhoneLoginState createState() => _AfyaMojaPhoneLoginState();
}

class _AfyaMojaPhoneLoginState extends State<AfyaMojaPhoneLogin> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _phoneNumber;
  final TextEditingController _phoneNumberInputController =
      TextEditingController();

  String? _pinCode;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((Duration timeStamp) {
      StoreProvider.dispatch<CoreState>(
        context,
        BatchUpdateMiscStateAction(
          phoneNumber: UNKNOWN,
          pinCode: UNKNOWN,
          invalidCredentials: false,
          unKnownPhoneNo: false,
        ),
      );
    });
  }

  Future<void> login({
    required BuildContext context,
    required String? phoneNumber,
    required String? pin,
  }) async {
    if (_formKey.currentState!.validate()) {
      StoreProvider.dispatch<CoreState>(
        context,
        BatchUpdateMiscStateAction(phoneNumber: phoneNumber, pinCode: pin),
      );

      await StoreProvider.dispatch<CoreState>(
        context,
        PhoneLoginAction(context: context),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<CoreState, CoreStateViewModel>(
      converter: (Store<CoreState> store) =>
          CoreStateViewModel.fromStore(store),
      builder: (BuildContext context, CoreStateViewModel vm) {
        return Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              /// Phone number input
              Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: SILPhoneInput(
                  phoneNumberFormatter: formatPhoneNumber,
                  inputController: _phoneNumberInputController,
                  labelText: phoneNumberInputLabelText,
                  labelStyle: TextThemes.boldSize16Text(),
                  onChanged: (String? value) {
                    if (vm.state.miscState!.invalidCredentials! ||
                        vm.state.miscState!.unKnownPhoneNo!) {
                      StoreProvider.dispatch<CoreState>(
                        context,
                        BatchUpdateMiscStateAction(
                          invalidCredentials: false,
                          unKnownPhoneNo: false,
                        ),
                      );
                    }
                    _phoneNumber = value;
                  },
                ),
              ),

              smallVerticalSizedBox,
              mediumVerticalSizedBox,

              /// PIN input
              SILFormTextField(
                key: afyaMojaphoneLoginPinInputKey,
                borderColor: Colors.grey[350],
                maxLength: 4,
                customFillColor: Colors.white,
                maxLines: 1,
                keyboardType: TextInputType.number,
                obscureText: true,
                hintText: loginHintPin,
                labelText: loginTextPin,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                validator: (String? value) {
                  return InputValidators.validatePin(value: value);
                },
                onChanged: (String val) {
                  if (vm.state.miscState!.invalidCredentials! ||
                      vm.state.miscState!.unKnownPhoneNo!) {
                    StoreProvider.dispatch<CoreState>(
                      context,
                      BatchUpdateMiscStateAction(
                        invalidCredentials: false,
                        unKnownPhoneNo: false,
                      ),
                    );
                  }
                  _pinCode = val;
                },
              ),

              /// error alert box for invalid credentials
              if (vm.state.miscState!.invalidCredentials!) ...<Widget>[
                mediumVerticalSizedBox,
                ErrorAlertBox(
                  message: wrongCredentials,
                  actionSpan: TextSpan(
                    text: resetPin,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () async => triggerNavigationEvent(
                          context: context, route: recoverPinRoute),
                    style: TextThemes.heavySize14Text().copyWith(
                        color: healthcloudPrimaryColor,
                        decoration: TextDecoration.underline),
                  ),
                ),
                mediumVerticalSizedBox,
              ],

              /// error alert box for unknown phone number
              if (vm.state.miscState!.unKnownPhoneNo!) ...<Widget>[
                mediumVerticalSizedBox,
                ErrorAlertBox(
                  message: noAccount,
                  actionSpan: TextSpan(
                    text: phoneLoginCreateAccountText,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () async => triggerNavigationEvent(
                          context: context, route: phoneSignupRoute),
                    style: TextThemes.heavySize14Text().copyWith(
                        color: healthcloudPrimaryColor,
                        decoration: TextDecoration.underline),
                  ),
                ),
                mediumVerticalSizedBox,
              ],

              if (vm.state.wait!.isWaitingFor(phoneLoginStateFlag)) ...<Widget>[
                const Align(child: SILPlatformLoader()),
                size15VerticalSizedBox,
              ],

              size15VerticalSizedBox,

              /// login button
              if (!vm.state.wait!.isWaitingFor(phoneLoginStateFlag))
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: SILPrimaryButton(
                    buttonKey: afyaMojaloginKey,
                    onPressed: () => login(
                        context: context,
                        phoneNumber: _phoneNumber,
                        pin: _pinCode),
                    buttonColor: Theme.of(context).primaryColor,
                    borderColor: Theme.of(context).primaryColor,
                    text: phoneLoginText,
                  ),
                ),

              mediumVerticalSizedBox,

              /// Back button
              SizedBox(
                width: double.infinity,
                height: 48,
                child: TextButton(
                  key: afyaMojabackButton,
                  onPressed: () async => triggerNavigationEvent(
                      context: context,
                      route: landingPageRoute,
                      shouldReplace: true),
                  child: const Opacity(opacity: 0.6, child: Text(loginBack)),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
