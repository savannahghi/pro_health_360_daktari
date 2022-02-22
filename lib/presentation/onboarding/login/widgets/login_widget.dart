// Flutter imports:
// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// Project imports:
import 'package:healthcloud/application/core/services/helpers.dart';
import 'package:healthcloud/application/core/services/input_invalidators.dart';
import 'package:healthcloud/application/core/theme/app_themes.dart';
import 'package:healthcloud/application/redux/actions/core/phone_login_action.dart';
import 'package:healthcloud/application/redux/actions/flags/app_flags.dart';
import 'package:healthcloud/application/redux/actions/onboarding/update_onboarding_state_action.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/application/redux/view_models/app_state_view_model.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:healthcloud/domain/core/value_objects/app_widget_keys.dart';
import 'package:healthcloud/presentation/core/widgets/platform_loader.dart';
import 'package:healthcloud/presentation/onboarding/login/widgets/error_alert_box.dart';
import 'package:healthcloud/presentation/router/routes.dart';
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/spaces.dart';

class LoginWidget extends StatefulWidget {
  @override
  LoginWidgetState createState() => LoginWidgetState();
}

class LoginWidgetState extends State<LoginWidget> {
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
        UpdateOnboardingStateAction(
          unKnownPhoneNo: false,
          phoneNumber: UNKNOWN,
          pinCode: UNKNOWN,
          invalidCredentials: false,
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
        UpdateOnboardingStateAction(
          phoneNumber: phoneNumber,
          pinCode: pin,
        ),
      );

      await StoreProvider.dispatch<AppState>(
        context,
        PhoneLoginAction(
          context: context,
        ),
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
                  backgroundColor: AppColors.lightGreyBackgroundColor,
                  phoneNumberFormatter: formatPhoneNumber,
                  inputController: _phoneNumberInputController,
                  labelText: phoneNumberInputLabelText,
                  labelStyle: boldSize16Text(),
                  onChanged: (String? value) {
                    if (vm.state.onboardingState!.phoneLogin!
                            .invalidCredentials! ||
                        vm.state.onboardingState!.phoneLogin!.unKnownPhoneNo!) {
                      StoreProvider.dispatch<AppState>(
                        context,
                        UpdateOnboardingStateAction(
                          invalidCredentials: false,
                          unKnownPhoneNo: false,
                        ),
                      );
                    }
                    _phoneNumber = value;
                  },
                ),
              ),

              largeVerticalSizedBox,
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  pinString,
                  style: boldSize14Text(Colors.grey),
                ),
              ),
              verySmallVerticalSizedBox,
              CustomTextField(
                autovalidateMode: AutovalidateMode.disabled,
                customFillColor: AppColors.lightGreyBackgroundColor,
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
                  if (vm.state.onboardingState!.phoneLogin!
                          .invalidCredentials! ||
                      vm.state.onboardingState!.phoneLogin!.unKnownPhoneNo!) {
                    StoreProvider.dispatch<AppState>(
                      context,
                      UpdateOnboardingStateAction(
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
              if (vm.state.onboardingState!.phoneLogin!
                  .invalidCredentials!) ...<Widget>[
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
                    style: heavySize14Text().copyWith(
                      color: healthcloudPrimaryColor,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                mediumVerticalSizedBox,
              ],

              /// error alert box for unknown phone number
              if (vm.state.onboardingState!.phoneLogin!
                  .unKnownPhoneNo!) ...<Widget>[
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
                    style: heavySize14Text().copyWith(
                      color: healthcloudPrimaryColor,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                mediumVerticalSizedBox,
              ],

              if (vm.state.wait!.isWaitingFor(phoneLoginStateFlag)) ...<Widget>[
                const Align(child: PlatformLoader()),
                size15VerticalSizedBox,
              ],

              SizedBox(height: MediaQuery.of(context).size.height / 10),

              /// login button
              if (!vm.state.wait!.isWaitingFor(phoneLoginStateFlag))
                LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    final double width = constraints.maxWidth > 420
                        ? constraints.maxWidth * 0.6
                        : constraints.maxWidth;
                    return SizedBox(
                      width: width,
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
                    );
                  },
                ),

              smallVerticalSizedBox,
            ],
          ),
        );
      },
    );
  }
}
