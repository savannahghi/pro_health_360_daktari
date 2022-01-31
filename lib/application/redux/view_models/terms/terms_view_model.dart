import 'package:async_redux/async_redux.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/domain/core/entities/terms/terms_and_conditions.dart';

class TermsViewModel extends Vm {
  final Wait wait;
  final TermsAndConditions? termsAndConditions;
  final String? error;

  TermsViewModel({
    required this.wait,
    this.termsAndConditions,
    this.error,
  });

  factory TermsViewModel.fromStore(Store<AppState> store) {
    return TermsViewModel(
      wait: store.state.wait!,
      termsAndConditions: store.state.onboardingState?.termsAndConditions,
      error: store.state.miscState?.error,
    );
  }
}
