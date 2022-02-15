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
  final String? otpCode;
  final bool? accountExists;
  final bool? acceptedTerms;

  final String? createPin;
  final String? confirmPin;

  final bool? invalidPin;
  final bool? hasCompletedEnteringOTP;
  final bool? isResendingOTP;
  final String? error;

  BatchUpdateMiscStateAction({
    this.invalidPin,
    this.visitCount,
    this.title,
    this.message,
    this.otpCode,
    this.acceptedTerms,
    this.accountExists,
    this.createPin,
    this.confirmPin,
    this.hasCompletedEnteringOTP,
    this.isResendingOTP,
    this.error,
  });

  @override
  AppState reduce() {
    final AppState newState = state.copyWith.call(
      miscState: state.miscState!.copyWith(error: error),
    );

    return newState;
  }
}
