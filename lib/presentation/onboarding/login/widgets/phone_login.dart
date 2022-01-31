//Flutter Imports
//Project Imports
import 'package:afya_moja_core/buttons.dart';
import 'package:afya_moja_core/custom_text_field.dart';
import 'package:afya_moja_core/phone_input.dart';
//Package Imports
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:healthcloud/application/core/services/helpers.dart';
import 'package:healthcloud/application/core/services/input_invalidators.dart';
import 'package:healthcloud/application/core/theme/app_themes.dart';
import 'package:healthcloud/application/redux/actions/core/batch_update_misc_state_action.dart';
import 'package:healthcloud/application/redux/actions/core/phone_login_action.dart';
import 'package:healthcloud/application/redux/actions/flags/app_flags.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/application/redux/view_models/app_state_view_model.dart';
import 'package:healthcloud/domain/core/value_objects/app_asset_strings.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:healthcloud/domain/core/value_objects/app_widget_keys.dart';
import 'package:healthcloud/presentation/onboarding/login/widgets/error_alert_box.dart';
import 'package:healthcloud/presentation/router/routes.dart';
import 'package:misc_utilities/misc.dart';
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';
import 'package:shared_ui_components/platform_loader.dart';

class PhoneLogin extends StatefulWidget {
  @override
  PhoneLoginState createState() => PhoneLoginState();
}

class PhoneLoginState extends State<PhoneLogin> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _phoneNumber;
  final TextEditingController _phoneNumberInputController =
      TextEditingController();

  String? _pinCode;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((Duration timeStamp) {
      StoreProvider.dispatch<AppState>(
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
      StoreProvider.dispatch<AppState>(
        context,
        BatchUpdateMiscStateAction(phoneNumber: phoneNumber, pinCode: pin),
      );

      await StoreProvider.dispatch<AppState>(
        context,
        PhoneLoginAction(context: context),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppStateViewModel>(
      converter: (Store<AppState> store) => AppStateViewModel.fromStore(store),
      builder: (BuildContext context, AppStateViewModel vm) {
        return Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              /// Phone number input
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  phoneNumberString,
                  style: TextThemes.boldSize14Text(Colors.grey),
                ),
              ),
              verySmallVerticalSizedBox,
              Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: MyAfyaHubPhoneInput(
                  backgroundColor: AppColors.inputBackgroundColor,
                  phoneNumberFormatter: formatPhoneNumber,
                  inputController: _phoneNumberInputController,
                  labelText: phoneNumberInputLabelText,
                  labelStyle: TextThemes.boldSize16Text(),
                  onChanged: (String? value) {
                    if (vm.state.miscState!.invalidCredentials! ||
                        vm.state.miscState!.unKnownPhoneNo!) {
                      StoreProvider.dispatch<AppState>(
                        context,
                        BatchUpdateMiscStateAction(
                          invalidCredentials: false,
                          unKnownPhoneNo: false,
                        ),
                      );
                    }
                    _phoneNumber = value;
                  },
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

              largeVerticalSizedBox,
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  pinString,
                  style: TextThemes.boldSize14Text(Colors.grey),
                ),
              ),
              verySmallVerticalSizedBox,
              CustomTextField(
                autovalidateMode: AutovalidateMode.disabled,
                customFillColor: AppColors.inputBackgroundColor,
                formFieldKey: phoneLoginPinInputKey,
                borderColor: Colors.grey[200],
                maxLength: 4,
                maxLines: 1,
                keyboardType: TextInputType.number,
                obscureText: true,
                validator: (String? value) {
                  return InputValidators.validatePin(value: value);
                },
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                onChanged: (String val) {
                  if (vm.state.miscState!.invalidCredentials! ||
                      vm.state.miscState!.unKnownPhoneNo!) {
                    StoreProvider.dispatch<AppState>(
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
              smallVerticalSizedBox,
              mediumVerticalSizedBox,

              /// error alert box for invalid credentials
              if (vm.state.miscState!.invalidCredentials!) ...<Widget>[
                mediumVerticalSizedBox,
                ErrorAlertBox(
                  message: wrongCredentials,
                  actionSpan: TextSpan(
                    text: resetPin,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () async => triggerNavigationEvent(
                            context: context,
                            route: AppRoutes.recoverPinRoute,
                          ),
                    style: TextThemes.heavySize14Text().copyWith(
                      color: healthcloudPrimaryColor,
                      decoration: TextDecoration.underline,
                    ),
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
                            context: context,
                            route: AppRoutes.phoneSignupRoute,
                          ),
                    style: TextThemes.heavySize14Text().copyWith(
                      color: healthcloudPrimaryColor,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                mediumVerticalSizedBox,
              ],

              if (vm.state.wait!.isWaitingFor(phoneLoginStateFlag)) ...<Widget>[
                const Align(child: SILPlatformLoader()),
                size15VerticalSizedBox,
              ],

              SizedBox(height: MediaQuery.of(context).size.height / 10),

              /// login button
              if (!vm.state.wait!.isWaitingFor(phoneLoginStateFlag))
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: MyAfyaHubPrimaryButton(
                    buttonKey: loginKey,
                    onPressed: () => login(
                      context: context,
                      phoneNumber: _phoneNumber,
                      pin: _pinCode,
                    ),
                    buttonColor: Theme.of(context).primaryColor,
                    borderColor: Theme.of(context).primaryColor,
                    text: phoneLoginText,
                  ),
                ),

              smallVerticalSizedBox,

              /// Forgot Pin button
              SizedBox(
                width: double.infinity,
                height: 48,
                child: TextButton(
                  key: forgotPinButton,
                  onPressed: () async => triggerNavigationEvent(
                    context: context,
                    route: AppRoutes.forgotPinPage,
                    shouldReplace: true,
                  ),
                  child: Text(
                    forgotPinString,
                    style: TextThemes.boldSize16Text(AppColors.textAltColor),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
