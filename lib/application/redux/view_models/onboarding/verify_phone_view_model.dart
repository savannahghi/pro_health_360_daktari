import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:myharehubpro/application/redux/states/app_state.dart';

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
      phoneNumber: state.staffState?.user?.primaryContact?.value ?? UNKNOWN,
      otp: state.onboardingState?.verifyPhoneState?.otp ?? UNKNOWN,
      invalidOTP: state.onboardingState?.verifyPhoneState?.invalidOTP ?? false,
      failedToSendOTP:
          state.onboardingState?.verifyPhoneState?.failedToSendOTP ?? false,
      canResendOTP:
          state.onboardingState?.verifyPhoneState?.canResendOTP ?? false,
      isResetPin: state.onboardingState?.isResetPin ?? false,
    );
  }
}
