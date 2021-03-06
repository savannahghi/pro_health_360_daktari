import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prohealth360_daktari/application/core/services/analytics_service.dart';
import 'package:prohealth360_daktari/application/core/services/input_validators.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/application/redux/actions/core/phone_login_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/actions/onboarding/update_onboarding_state_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/view_models/app_state_view_model.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_enums.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_events.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/onboarding/login/widgets/phone_login_error_widget.dart';

class PhoneLoginPage extends StatefulWidget {
  @override
  State<PhoneLoginPage> createState() => _PhoneLoginPageState();
}

class _PhoneLoginPageState extends State<PhoneLoginPage> {
  String? phoneNumber;
  String? pin;

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
  Widget build(BuildContext context) {
    final TargetPlatform _platform = Theme.of(context).platform;
    final double sizedBoxHeight = MediaQuery.of(context).size.width / 8;
    // A small indicator to help us identify whether the app is running in
    // staging or testing
    final bool isAppTest =
        AppWrapperBase.of(context)!.appContexts.contains(AppContext.AppTest);

    return StoreConnector<AppState, AppStateViewModel>(
      converter: (Store<AppState> store) => AppStateViewModel.fromStore(store),
      builder: (BuildContext context, AppStateViewModel vm) {
        return Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          body: SafeArea(
            child: Form(
              key: _formKey,
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.symmetric(
                  horizontal:
                      ResponsiveWidget.preferredPaddingOnStretchedScreens(
                    context: context,
                  ),
                ),
                child: ListView(
                  children: <Widget>[
                    SizedBox(height: sizedBoxHeight),
                    const OnboardingScaffoldHeader(
                      title: phoneLoginPageTitle,
                      description: phoneLoginPageDescription,
                    ),
                    smallVerticalSizedBox,
                    largeVerticalSizedBox,

                    /// Phone number input
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        phoneNumberString,
                        style: boldSize14Text(Colors.grey),
                      ),
                    ),
                    smallVerticalSizedBox,
                    MyAfyaHubPhoneInput(
                      decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        border: InputBorder.none,
                        filled: true,
                        fillColor: AppColors.lightGreyBackgroundColor,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[200]!),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                      ),
                      phoneNumberFormatter: formatPhoneNumber,
                      onChanged: (String? value) {
                        final bool invalidCredentials =
                            vm.state.onboardingState!.invalidCredentials!;

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
                    mediumVerticalSizedBox,
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        pinString,
                        style: boldSize14Text(Colors.grey),
                      ),
                    ),
                    smallVerticalSizedBox,
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
                        final bool invalidCredentials =
                            vm.state.onboardingState!.invalidCredentials!;

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

                    /// error alert box for invalid credentials
                    if (vm.state.onboardingState!
                        .invalidCredentials!) ...<Widget>[
                      largeVerticalSizedBox,
                      PhoneLoginErrorWidget(
                        formKey: _formKey,
                        phone: phoneNumber,
                      ),
                    ],
                    largeVerticalSizedBox,
                    Center(
                      child: Text(
                        copyrightString,
                        style: normalSize10Text(Colors.grey),
                      ),
                    ),
                    smallVerticalSizedBox,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Text(
                        poweredByMyCareHubString,
                        style: normalSize10Text(Colors.grey),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    smallVerticalSizedBox,
                    if (_platform != TargetPlatform.iOS)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Center(
                          child: Text(
                            '$appVersionString $APPVERSION',
                            style: normalSize9Text(Colors.grey),
                          ),
                        ),
                      ),
                    smallVerticalSizedBox,
                    veryLargeVerticalSizedBox,
                  ],
                ),
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: vm.state.wait!.isWaitingFor(phoneLoginStateFlag)
              ? const SizedBox(height: 48, child: PlatformLoader())
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
                      buttonColor: isAppTest
                          ? AppColors.greenHappyColor
                          : AppColors.primaryColor,
                      borderColor: Colors.transparent,
                      text: phoneLoginText,
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
    UpdateOnboardingStateAction(phoneNumber: phoneNumber, pin: pin),
  );
  final bool hasConnection =
      StoreProvider.state<AppState>(context)?.connectivityState?.isConnected ??
          false;

  if (hasConnection) {
    await StoreProvider.dispatch<AppState>(
      context,
      PhoneLoginAction(
        httpClient: AppWrapperBase.of(context)!.graphQLClient,
        phoneLoginEndpoint:
            AppWrapperBase.of(context)!.customContext!.loginByPhoneEndpoint,
      ),
    );
  } else {
    const SnackBar snackbar = SnackBar(content: Text(checkInternetText));
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
    AnalyticsService().logEvent(
      name: noConnectionEvent,
      eventType: AnalyticsEventType.CONNECTIVITY,
    );
  }
}
