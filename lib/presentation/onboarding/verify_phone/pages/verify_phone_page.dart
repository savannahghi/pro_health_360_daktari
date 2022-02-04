import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:flutter/material.dart';
import 'package:healthcloud/application/core/services/utils.dart';
import 'package:healthcloud/application/core/theme/app_themes.dart';
import 'package:healthcloud/application/redux/actions/flags/app_flags.dart';
import 'package:healthcloud/application/redux/actions/onboarding/send_otp_action.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/application/redux/view_models/onboarding/verify_phone_view_model.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:healthcloud/presentation/onboarding/verify_phone/widgets/verify_otp_widget.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_ui_components/platform_loader.dart';

class VerifyPhonePage extends StatefulWidget {
  const VerifyPhonePage({Key? key, required this.phoneNumber})
      : super(key: key);
  final String phoneNumber;
  @override
  VerifyPhonePageState createState() => VerifyPhonePageState();
}

class VerifyPhonePageState extends State<VerifyPhonePage> {
  final TextEditingController otpEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((Duration timeStamp) async {
      StoreProvider.dispatch<AppState>(
        context,
        SendOTPAction(
          context: context,
          resetPinPhoneNumber: widget.phoneNumber,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, VerifyPhoneViewModel>(
      converter: (Store<AppState> store) {
        return VerifyPhoneViewModel.fromStore(store);
      },
      builder: (BuildContext context, VerifyPhoneViewModel vm) {
        final String phone =
            vm.isResetPin ? widget.phoneNumber : vm.phoneNumber ?? UNKNOWN;
        return OnboardingScaffold(
          title: verifyPhoneNumberTitle,
          description: verifyPhoneNumberDescription,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              smallVerticalSizedBox,
              Text(
                enterOTPString,
                style: boldSize16Text(AppColors.secondaryColor),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Center(
                  child: Column(
                    children: <Widget>[
                      if (vm.wait!.isWaitingFor(sendOTPFlag))
                        const SILPlatformLoader(),
                      if (vm.wait!.isWaitingFor(verifyOTPFlag)) ...<Widget>[
                        const SILPlatformLoader(),
                        smallVerticalSizedBox,
                        Text(
                          verifyCode,
                          style: normalSize16Text(
                            AppColors.secondaryColor,
                          ),
                        ),
                      ],
                      if (!vm.wait!.isWaitingFor(sendOTPFlag) &&
                          !vm.wait!.isWaitingFor(verifyOTPFlag))
                        VerifyOTPWidget(
                          verifyPhoneViewModel: vm,
                          loader: const SILPlatformLoader(),
                          phoneNumber: phone,
                        ),
                    ],
                  ),
                ),
              ),

              //Incase there was an error sending the otp
              if (vm.failedToSendOTP!) ...<Widget>[
                //Handle error incase otp is not sent
                ErrorCard(
                  ///Button is disable while sendOTP action is loading
                  buttonColor: vm.wait!.isWaitingFor(sendOTPFlag)
                      ? Colors.grey
                      : Theme.of(context).primaryColor,
                  callBackFunction: vm.wait!.isWaitingFor(sendOTPFlag)
                      ? null
                      : () async {
                          StoreProvider.dispatch<AppState>(
                            context,
                            SendOTPAction(
                              context: context,
                              resetPinPhoneNumber: widget.phoneNumber,
                            ),
                          );
                        },
                )
              ]
            ],
          ),
        );
      },
    );
  }
}
