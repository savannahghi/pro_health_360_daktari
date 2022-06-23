import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_enums.dart';

class VerifyPhoneViewModel extends Vm {
  VerifyPhoneViewModel({
    required this.wait,
    required this.userID,
    required this.phoneNumber,
    required this.otp,
    required this.isResetPin,
    this.failedToSendOTP,
    this.canResendOTP,
    this.invalidOTP,
  }) : super(
          equals: <Object?>[
            wait,
            userID,
            phoneNumber,
            otp,
            failedToSendOTP,
            canResendOTP,
            invalidOTP,
            isResetPin,
          ],
        );

  final Wait? wait;
  final String? userID;
  final String? phoneNumber;
  final String? otp;
  final bool? invalidOTP;
  final bool? failedToSendOTP;
  final bool? canResendOTP;
  final bool isResetPin;

  static VerifyPhoneViewModel fromStore(Store<AppState> store) {
    final AppState state = store.state;
    return VerifyPhoneViewModel(
      wait: state.wait,
      userID: state.staffState?.userId ?? UNKNOWN,
      phoneNumber: state.onboardingState?.phoneNumber ?? UNKNOWN,
      otp: state.onboardingState?.otp ?? UNKNOWN,
      invalidOTP: state.onboardingState?.invalidOTP ?? false,
      failedToSendOTP: state.onboardingState?.failedToSendOTP ?? false,
      canResendOTP: state.onboardingState?.canResendOTP ?? false,
      isResetPin: state.onboardingState?.currentOnboardingStage ==
          CurrentOnboardingStage.ResetPIN,
    );
  }
}
