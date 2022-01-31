import 'package:async_redux/async_redux.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/domain/core/entities/terms/terms_and_conditions.dart';

class UpdateTermsAndConditionsAction extends ReduxAction<AppState> {
  UpdateTermsAndConditionsAction({
    this.id,
    this.termsString,
    this.isAccepted,
  });

  final int? id;
  final String? termsString;
  final bool? isAccepted;

  @override
  AppState reduce() {
    final bool? termsAccepted = state.staffState?.user?.termsAccepted;

    final TermsAndConditions termsAndConditions =
        state.onboardingState!.termsAndConditions!;

    final AppState newState = state.copyWith(
      onboardingState: state.onboardingState?.copyWith(
        termsAndConditions: TermsAndConditions(
          termsId: id ?? termsAndConditions.termsId,
          text: termsString ?? termsAndConditions.text,
        ),
      ),
      staffState: state.staffState?.copyWith.call(
        user: state.staffState?.user?.copyWith(
          termsAccepted: isAccepted ?? termsAccepted,
        ),
      ),
    );

    return newState;
  }
}
