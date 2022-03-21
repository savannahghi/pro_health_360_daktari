// Flutter imports:
// Package imports:
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/services.dart';
import 'package:mycarehubpro/application/core/services/input_validators.dart';
import 'package:mycarehubpro/application/core/theme/app_themes.dart';
import 'package:mycarehubpro/application/redux/actions/core/phone_login_action.dart';
import 'package:mycarehubpro/application/redux/actions/flags/app_flags.dart';
import 'package:mycarehubpro/application/redux/actions/onboarding/update_onboarding_state_action.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/application/redux/view_models/app_state_view_model.dart';
// Project imports:
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_widget_keys.dart';
import 'package:mycarehubpro/presentation/onboarding/login/widgets/error_alert_box.dart';
import 'package:shared_themes/spaces.dart';

class PhoneLoginPage extends StatefulWidget {
  @override
  State<PhoneLoginPage> createState() => _PhoneLoginPageState();
}

class _PhoneLoginPageState extends State<PhoneLoginPage> {
  String? phoneNumber;
  final TextEditingController phoneNumberInputController =
      TextEditingController();

  String? pin;
  TextEditingController pinController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void didChangeDependencies() {
    if (phoneNumber == null) {
      /// reset login state upon entering this page
      StoreProvider.dispatch(context, ResetOnboardingStateAction());
    }
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    pinController.dispose();
    phoneNumberInputController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    /// clear any active flags
  }

  @override
  Widget build(BuildContext context) {
    final double sizedBoxHeight = MediaQuery.of(context).size.width / 4;
    // A small indicator to help us identify whether the app is running in
    // staging or testing
    final bool isAppTest =
        AppWrapperBase.of(context)!.appContexts.contains(AppContext.AppTest);
    return StoreConnector<AppState, AppStateViewModel>(
      converter: (Store<AppState> store) => AppStateViewModel.fromStore(store),
      builder: (BuildContext context, AppStateViewModel vm) {
        final bool invalidCredentials =
            vm.state.onboardingState!.invalidCredentials!;
        return Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          body: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal:
                        ResponsiveWidget.preferredPaddingOnStretchedScreens(
                      context: context,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: sizedBoxHeight,
                      ),
                      const OnboardingScaffoldHeader(
                        title: phoneLoginPageTitle,
                        description: phoneLoginPageDescription,
                      ),
                      smallVerticalSizedBox,
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 1.6,
                        child: Form(
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
                              MyAfyaHubPhoneInput(
                                decoration: InputDecoration(
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
                                  border: InputBorder.none,
                                  filled: true,
                                  fillColor: AppColors.lightGreyBackgroundColor,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.grey[200]!),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(5),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                    ),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(5),
                                    ),
                                  ),
                                ),
                                phoneNumberFormatter: formatPhoneNumber,
                                onChanged: (String? value) {
                                  if (invalidCredentials) {
                                    StoreProvider.dispatch<AppState>(
                                      context,
                                      UpdateOnboardingStateAction(
                                        invalidCredentials: false,
                                      ),
                                    );
                                  }

                                  setState(() {
                                    phoneNumber = value;
                                  });
                                },
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
                                formFieldKey: phoneLoginPinInputKey,
                                borderColor: Colors.grey[200],
                                maxLength: 4,
                                maxLines: 1,
                                keyboardType: TextInputType.number,
                                obscureText: true,
                                validator: (String? value) {
                                  return InputValidators.validatePin(
                                    value: value,
                                  );
                                },
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                onChanged: (String val) {
                                  if (invalidCredentials) {
                                    StoreProvider.dispatch<AppState>(
                                      context,
                                      UpdateOnboardingStateAction(
                                        invalidCredentials: false,
                                      ),
                                    );
                                  }

                                  setState(() {
                                    pin = val;
                                  });
                                },
                              ),
                              smallVerticalSizedBox,
                              mediumVerticalSizedBox,

                              /// error alert box for invalid credentials
                              if (vm.state.onboardingState!
                                  .invalidCredentials!) ...<Widget>[
                                mediumVerticalSizedBox,
                                const ErrorAlertBox(
                                  message: wrongCredentials,
                                  actionSpan: null,
                                ),
                                mediumVerticalSizedBox,
                              ],
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: vm.state.wait!.isWaitingFor(phoneLoginStateFlag)
              ? const PlatformLoader()
              : Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal:
                        ResponsiveWidget.preferredPaddingOnStretchedScreens(
                      context: context,
                    ),
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: MyAfyaHubPrimaryButton(
                      buttonKey: loginKey,
                      onPressed: () {
                        final bool? isFormValid =
                            _formKey.currentState?.validate();

                        if (isFormValid != null &&
                            isFormValid &&
                            pin != null &&
                            phoneNumber != null &&
                            pin != UNKNOWN &&
                            phoneNumber != UNKNOWN) {
                          login(
                            context: context,
                            phoneNumber: phoneNumber,
                            pin: pin,
                          );
                        }
                      },
                      buttonColor: Theme.of(context).primaryColor,
                      borderColor: Theme.of(context).primaryColor,
                      text: phoneLoginText,
                      textColor: isAppTest
                          ? Theme.of(context).colorScheme.primaryVariant
                          : null,
                    ),
                  ),
                ),
        );
      },
    );
  }
}

Future<void> login({
  required BuildContext context,
  required String? phoneNumber,
  required String? pin,
}) async {
  StoreProvider.dispatch<AppState>(
    context,
    UpdateOnboardingStateAction(phoneNumber: phoneNumber),
  );

  await StoreProvider.dispatch<AppState>(
    context,
    PhoneLoginAction(context: context),
  );
}
