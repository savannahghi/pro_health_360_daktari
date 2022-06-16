import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:mycarehubpro/application/core/theme/app_themes.dart';
import 'package:mycarehubpro/application/redux/actions/flags/app_flags.dart';
import 'package:mycarehubpro/application/redux/actions/onboarding/resend_otp_action.dart';
import 'package:mycarehubpro/application/redux/actions/onboarding/send_otp_action.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/application/redux/view_models/onboarding/verify_phone_view_model.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';
import 'package:mycarehubpro/presentation/onboarding/login/widgets/error_card_widget.dart';
import 'package:mycarehubpro/presentation/onboarding/verify_phone/widgets/verify_otp_widget.dart';

class VerifyPhonePage extends StatelessWidget {
  const VerifyPhonePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, VerifyPhoneViewModel>(
      converter: (Store<AppState> store) {
        return VerifyPhoneViewModel.fromStore(store);
      },
      onInit: (Store<AppState> store) {
        StoreProvider.dispatch<AppState>(
          context,
          SendOTPAction(context: context),
        );
      },
      builder: (BuildContext context, VerifyPhoneViewModel vm) {
        final String phone = vm.phoneNumber ?? UNKNOWN;

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
                        const PlatformLoader(),
                      if (vm.wait!.isWaitingFor(verifyOTPFlag)) ...<Widget>[
                        const PlatformLoader(),
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
                          loader: const PlatformLoader(),
                          phoneNumber: phone,
                        ),
                    ],
                  ),
                ),
              ),

              //Incase there was an error sending the otp
              if (vm.failedToSendOTP!) ...<Widget>[
                //Handle error incase otp is not sent
                ErrorCardWidget(
                  ///Button is disable while sendOTP action is loading
                  buttonColor: vm.wait!.isWaitingFor(sendOTPFlag)
                      ? Colors.grey
                      : Theme.of(context).primaryColor,
                  callBackFunction: vm.wait!.isWaitingFor(sendOTPFlag)
                      ? null
                      : () async {
                          StoreProvider.dispatch<AppState>(
                            context,
                            ResendOTPAction(context: context),
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
