// Package imports:
import 'package:domain_objects/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
// Project imports:
import 'package:healthcloud/application/redux/states/faqs/faq_content.dart';
import 'package:healthcloud/presentation/router/routes.dart';

part 'misc_state.freezed.dart';
part 'misc_state.g.dart';

@freezed
class MiscState with _$MiscState {
  factory MiscState({
    String? message,
    String? otpCode,
    bool? acceptedTerms,
    List<FAQContent?>? faqList,

    /// [createPin] used when user is creating a PIN.
    String? createPin,

    /// [confirmPin] used when user is creating a PIN for client side validation
    String? confirmPin,

    /// [accountExists] a signal to the frontend that an account with the provided credentials already exists.
    bool? accountExists,

    /// [invalidPin] used when running pin verification procedure.
    bool? invalidPin,
    bool? hasCompletedEnteringOTP, // TODO: remove it is unused
    bool? isResendingOTP, // TODO: remove, it is unused

    String? error,
    String? initialRoute,
  }) = _MiscState;

  factory MiscState.fromJson(Map<String, dynamic> json) =>
      _$MiscStateFromJson(json);

  factory MiscState.initial() => MiscState(
        message: UNKNOWN,
        otpCode: UNKNOWN,
        faqList: <FAQContent>[],
        accountExists: false,
        acceptedTerms: false,
        createPin: UNKNOWN,
        confirmPin: UNKNOWN,
        invalidPin: false,
        hasCompletedEnteringOTP: false,
        isResendingOTP: false,
        initialRoute: AppRoutes.loginPage,
      );
}
