import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_enums.dart';

class SecurityQuestionsViewModel extends Vm {
  SecurityQuestionsViewModel({
    required this.wait,
    required this.securityQuestions,
    required this.securityQuestionResponses,
    required this.userID,
    required this.currentOnboardingStage,
  }) : super(
          equals: <Object?>[
            wait,
            securityQuestions,
            securityQuestionResponses,
            userID,
            currentOnboardingStage,
          ],
        );

  final Wait? wait;
  final List<SecurityQuestion>? securityQuestions;
  final List<SecurityQuestionResponse>? securityQuestionResponses;
  final String userID;
  final CurrentOnboardingStage? currentOnboardingStage;

  static SecurityQuestionsViewModel fromStore(Store<AppState> store) {
    final AppState state = store.state;
    return SecurityQuestionsViewModel(
      wait: state.wait,
      securityQuestions: state.onboardingState?.securityQuestions,
      securityQuestionResponses:
          state.onboardingState?.securityQuestionResponses,
      userID: state.staffState?.user?.userId ?? UNKNOWN,
      currentOnboardingStage: state.onboardingState?.currentOnboardingStage,
    );
  }
}
