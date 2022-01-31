// Package imports:
import 'package:async_redux/async_redux.dart';

// Project imports:
import 'package:healthcloud/application/redux/states/app_state.dart';

/// [BatchUpdateMiscStateAction] is the ONLY action that should be called to update [miscState]
/// with the exception of [IncrementUserVisitCountAction]
/// This action should be called in the following scenarios;
/// - creating an account
/// - logging in a user
/// - resetting PIN
class BatchUpdateMiscStateAction extends ReduxAction<AppState> {
  final String? visitCount;
  final String? title;
  final String? message;
  final String? phoneNumber;
  final String? otpCode;
  final String? pinCode;
  final bool? accountExists;
  final bool? acceptedTerms;

  final String? createPin;
  final String? confirmPin;

  final bool? invalidCredentials;
  final bool? unKnownPhoneNo;
  final bool? invalidPin;
  final bool? hasCompletedEnteringOTP;
  final bool? isResendingOTP;

  BatchUpdateMiscStateAction({
    this.invalidPin,
    this.visitCount,
    this.invalidCredentials,
    this.unKnownPhoneNo,
    this.title,
    this.message,
    this.phoneNumber,
    this.otpCode,
    this.pinCode,
    this.acceptedTerms,
    this.accountExists,
    this.createPin,
    this.confirmPin,
    this.hasCompletedEnteringOTP,
    this.isResendingOTP,
  });

  @override
  AppState reduce() {
    final AppState newState = state.copyWith.call(
      miscState: state.miscState!.copyWith(
        invalidPin: invalidPin ?? state.miscState!.invalidPin,
        visitCount: visitCount ?? state.miscState!.visitCount,
        invalidCredentials:
            invalidCredentials ?? state.miscState!.invalidCredentials,
        unKnownPhoneNo: unKnownPhoneNo ?? state.miscState!.unKnownPhoneNo,
        title: title ?? state.miscState!.title,
        message: message ?? state.miscState!.message,
        phoneNumber: phoneNumber ?? state.miscState!.phoneNumber,
        otpCode: otpCode ?? state.miscState!.otpCode,
        pinCode: pinCode ?? state.miscState!.pinCode,
        acceptedTerms: acceptedTerms ?? state.miscState!.acceptedTerms,
        accountExists: accountExists ?? state.miscState!.accountExists,
        createPin: createPin ?? state.miscState!.createPin,
        confirmPin: confirmPin ?? state.miscState!.confirmPin,
        hasCompletedEnteringOTP:
            hasCompletedEnteringOTP ?? state.miscState!.hasCompletedEnteringOTP,
        isResendingOTP: isResendingOTP ?? state.miscState!.isResendingOTP,
      ),
    );

    return newState;
  }
}
