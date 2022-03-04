import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:myharehubpro/application/core/services/utils.dart';
import 'package:myharehubpro/application/core/theme/app_themes.dart';
import 'package:myharehubpro/application/redux/actions/onboarding/send_otp_action.dart';
import 'package:myharehubpro/application/redux/actions/onboarding/update_onboarding_state_action.dart';
import 'package:myharehubpro/application/redux/actions/onboarding/verify_otp_action.dart';
import 'package:myharehubpro/application/redux/states/app_state.dart';
import 'package:myharehubpro/application/redux/view_models/onboarding/verify_phone_view_model.dart';
import 'package:myharehubpro/domain/core/value_objects/app_asset_strings.dart';
import 'package:myharehubpro/domain/core/value_objects/app_strings.dart';
import 'package:myharehubpro/domain/core/value_objects/app_widget_keys.dart';
import 'package:myharehubpro/presentation/core/widgets/animated_count.dart';
import 'package:myharehubpro/presentation/router/routes.dart';
import 'package:shared_themes/spaces.dart';
import 'package:sms_autofill/sms_autofill.dart';
// ignore: implementation_imports
import 'package:myharehubpro/application/redux/actions/flags/app_flags.dart';

class VerifyOTPWidget extends StatefulWidget {
  const VerifyOTPWidget({
    Key? key,
    required this.phoneNumber,
    required this.loader,
    required this.verifyPhoneViewModel,
  }) : super(key: key);

  final String phoneNumber;
  final Widget loader;
  final VerifyPhoneViewModel verifyPhoneViewModel;

  @override
  VerifyOTPWidgetState createState() => VerifyOTPWidgetState();
}

class VerifyOTPWidgetState extends State<VerifyOTPWidget>
    with SingleTickerProviderStateMixin, CodeAutoFill {
  Animation<double>? animation;
  int resendTimeout = 60;
  String testCode = '1234';
  TextEditingController textEditingController = TextEditingController();

  late AnimationController _controller;

  @override
  void codeUpdated() {
    setState(() {
      // update the controller with the detected code
      textEditingController.text = code ?? testCode;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // listen for otp code sent via sms
    listenForCode();
    _controller =
        AnimationController(duration: const Duration(seconds: 60), vsync: this);
    animation = Tween<double>(begin: resendTimeout.toDouble(), end: 0)
        .animate(_controller)
      ..addListener(() {
        if (resendTimeout == 0) {
          StoreProvider.dispatch<AppState>(
            context,
            UpdateOnboardingStateAction(
              canResendOTP: true,
            ),
          );
        }
        setState(() {
          resendTimeout = int.parse(animation!.value.toStringAsFixed(0));
        });
      });
    _controller.forward();
    super.initState();
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return verifyOTPState;
  }

  void restartTimer() {
    resendTimeout = 90;
    _controller.value = 0;
    _controller.forward();

    StoreProvider.dispatch<AppState>(
      context,
      UpdateOnboardingStateAction(
        canResendOTP: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool canResend = widget.verifyPhoneViewModel.canResendOTP!;
    final bool isResetPin = widget.verifyPhoneViewModel.isResetPin;
    return Column(
      children: <Widget>[
        smallVerticalSizedBox,
        PINInputField(
          maxLength: 6,
          controller: textEditingController,
          onDone: (String enteredCode) async {
            if (enteredCode == widget.verifyPhoneViewModel.otp) {
              if (isResetPin) {
                Navigator.pushNamed(
                  context,
                  AppRoutes.setPinPage,
                  arguments: widget.phoneNumber,
                );
              } else {
                await StoreProvider.dispatch<AppState>(
                  context,
                  VerifyOTPAction(
                    otp: enteredCode,
                    context: context,
                  ),
                );
              }
              return;
            } else {
              feedbackBottomSheet(
                context: context,
                modalContent: invalidCode,
                imageAssetPath: errorIconUrl,
              );
            }
          },
        ),
        largeVerticalSizedBox,
        if (!canResend && !widget.verifyPhoneViewModel.failedToSendOTP!)
          Column(
            children: <Widget>[
              Text(
                anOtpHasBeenSentText(widget.phoneNumber),
                style: normalSize14Text(AppColors.secondaryColor),
              ),
              smallVerticalSizedBox,
              AnimatedCount(count: resendTimeout, duration: Duration.zero),
            ],
          ),

        ///Column should not be rendered in case of an error while sending the OTP
        if (canResend && !widget.verifyPhoneViewModel.failedToSendOTP!)
          Column(
            children: <Widget>[
              Text(
                didNotReceiveOTP,
                style: normalSize14Text(AppColors.secondaryColor),
              ),
              verySmallVerticalSizedBox,
              if (!widget.verifyPhoneViewModel.wait!
                  .isWaitingFor(resendOTPFlag))
                MyAfyaHubPrimaryButton(
                  buttonKey: resendOtpButtonKey,
                  customRadius: 4,
                  text: resendOTP,
                  textColor: Colors.white,
                  buttonColor: AppColors.secondaryColor,
                  borderColor: AppColors.secondaryColor,
                  onPressed: () async {
                    textEditingController.clear();
                    StoreProvider.dispatch<AppState>(
                      context,
                      SendOTPAction(
                        context: context,
                        isResend: true,
                        callBackFunction: restartTimer,
                        resetPinPhoneNumber: widget.phoneNumber,
                      ),
                    );
                  },
                )
              else ...<Widget>[
                smallVerticalSizedBox,
                widget.loader,
              ]
            ],
          ),
      ],
    );
  }
}
