// Package imports:
import 'package:afya_moja_core/src/domain/core/entities/onboarding_path_config.dart';
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:healthcloud/application/core/services/utils.dart';
import 'package:healthcloud/application/redux/actions/core/update_credentials_action.dart';
import 'package:healthcloud/application/redux/actions/terms/update_terms_action.dart';
import 'package:healthcloud/application/redux/actions/update_onboarding_state.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/presentation/router/routes.dart';

void main() {
  group('genderFromJson', () {
    test('should return correct values', () async {
      expect(genderFromJson('MALE'), Gender.male);
      expect(genderFromJson(''), Gender.unknown);
    });

    test('should return correct values', () async {
      expect(genderToJson(Gender.male), 'MALE');
    });
  });

  group('onboardingPath', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
    });

    test('should return login page', () async {
      final OnboardingPathConfig path = onboardingPath(state: store.state);
      expect(path.route, AppRoutes.loginPage);
    });

    test('should return verify otp page', () async {
      store.dispatch(UpdateCredentialsAction(isSignedIn: true));
      final OnboardingPathConfig path = onboardingPath(state: store.state);
      expect(path.route, AppRoutes.verifyOTPPage);
    });

    test('should return terms accepted', () async {
      store.dispatch(UpdateCredentialsAction(isSignedIn: true));
      store.dispatch(UpdateOnboardingStateAction(isPhoneVerified: true));

      final OnboardingPathConfig path = onboardingPath(state: store.state);
      expect(path.route, AppRoutes.termsAndConditions);
    });

    test('should return security questions', () async {
      store.dispatch(UpdateCredentialsAction(isSignedIn: true));
      store.dispatch(UpdateOnboardingStateAction(isPhoneVerified: true));
      store.dispatch(UpdateTermsAndConditionsAction(isAccepted: true));

      final OnboardingPathConfig path = onboardingPath(state: store.state);
      expect(path.route, AppRoutes.securityQuestionsPage);
    });

    test('should return set pin page', () async {
      store.dispatch(UpdateCredentialsAction(isSignedIn: true));
      store.dispatch(
        UpdateOnboardingStateAction(
          isPhoneVerified: true,
          hasSetSecurityQuestions: true,
        ),
      );
      store.dispatch(UpdateTermsAndConditionsAction(isAccepted: true));

      final OnboardingPathConfig path = onboardingPath(state: store.state);
      expect(path.route, AppRoutes.setPinPage);
    });

    test('should return home page', () async {
      store.dispatch(UpdateCredentialsAction(isSignedIn: true));
      store.dispatch(
        UpdateOnboardingStateAction(
          isPhoneVerified: true,
          hasSetSecurityQuestions: true,
          hasSetPin: true,
        ),
      );
      store.dispatch(UpdateTermsAndConditionsAction(isAccepted: true));

      final OnboardingPathConfig path = onboardingPath(state: store.state);
      expect(path.route, AppRoutes.homePage);
    });
  });
}
