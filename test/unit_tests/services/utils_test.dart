// Package imports:
import 'dart:convert';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:afya_moja_core/src/domain/core/entities/onboarding_path_config.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:intl/date_symbol_data_local.dart';
// Project imports:
import 'package:myharehubpro/application/core/services/utils.dart';
import 'package:myharehubpro/application/redux/actions/core/update_credentials_action.dart';
import 'package:myharehubpro/application/redux/actions/onboarding/update_onboarding_state_action.dart';
import 'package:myharehubpro/application/redux/actions/terms/update_terms_action.dart';
import 'package:myharehubpro/application/redux/states/app_state.dart';
import 'package:myharehubpro/domain/core/value_objects/app_strings.dart';
import 'package:myharehubpro/infrastructure/endpoints.dart';
import 'package:myharehubpro/presentation/onboarding/login/pages/phone_login_page.dart';
import 'package:myharehubpro/presentation/router/routes.dart';

import '../../mocks/mocks.dart';
import '../../mocks/test_helpers.dart';

void main() {
  group('genderFromJson', () {
    test('should return correct values', () async {
      expect(genderFromJson('MALE'), Gender.male);
      expect(genderFromJson(''), Gender.unknown);
    });

    test('should return correct values', () async {
      expect(genderToJson(Gender.male), 'male');
    });
  });

  group('onboardingPath', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
    });

    test('should return login page', () async {
      final OnboardingPathConfig path = getOnboardingPath(state: store.state);
      expect(path.route, AppRoutes.loginPage);
    });

    test('should return verify otp page', () async {
      store.dispatch(UpdateCredentialsAction(isSignedIn: true));
      final OnboardingPathConfig path = getOnboardingPath(state: store.state);
      expect(path.route, AppRoutes.verifyPhonePage);
    });

    test('should return terms accepted', () async {
      store.dispatch(UpdateCredentialsAction(isSignedIn: true));
      store.dispatch(UpdateOnboardingStateAction(isPhoneVerified: true));

      final OnboardingPathConfig path = getOnboardingPath(state: store.state);
      expect(path.route, AppRoutes.termsAndConditions);
    });

    test('should return security questions', () async {
      store.dispatch(UpdateCredentialsAction(isSignedIn: true));
      store.dispatch(UpdateOnboardingStateAction(isPhoneVerified: true));
      store.dispatch(UpdateTermsAndConditionsAction(isAccepted: true));

      final OnboardingPathConfig path = getOnboardingPath(state: store.state);
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

      final OnboardingPathConfig path = getOnboardingPath(state: store.state);
      expect(path.route, AppRoutes.setPinPage);
    });

    test('should return initial route', () async {
      expect(getInitialRoute(0, AppRoutes.loginPage), AppRoutes.loginPage);
      expect(
        getInitialRoute(1, AppRoutes.communityPage),
        AppRoutes.communityPage,
      );
      expect(
        getInitialRoute(2, AppRoutes.notificationsPage),
        AppRoutes.notificationsPage,
      );
    });

    test('should return set nickname page', () async {
      store.dispatch(UpdateCredentialsAction(isSignedIn: true));
      store.dispatch(
        UpdateOnboardingStateAction(
          isPhoneVerified: true,
          hasSetSecurityQuestions: true,
          hasSetPin: true,
        ),
      );
      store.dispatch(UpdateTermsAndConditionsAction(isAccepted: true));

      final OnboardingPathConfig path = getOnboardingPath(state: store.state);
      expect(path.route, AppRoutes.setNicknamePage);
    });

    test('should return home page', () async {
      store.dispatch(UpdateCredentialsAction(isSignedIn: true));
      store.dispatch(
        UpdateOnboardingStateAction(
          isPhoneVerified: true,
          hasSetSecurityQuestions: true,
          hasSetPin: true,
          hasSetNickName: true,
        ),
      );
      store.dispatch(UpdateTermsAndConditionsAction(isAccepted: true));

      final OnboardingPathConfig path = getOnboardingPath(state: store.state);
      expect(path.route, AppRoutes.homePage);
    });

    testWidgets('should test logout user works correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockShortGraphQlClient.withResponse(
          'idToken',
          kTestGraphqlEndpoint,
          Response(
            json.encode(<String, String>{'error': 'error occurred'}),
            201,
          ),
        ),
        widget: Builder(
          builder: (BuildContext context) {
            return MyAfyaHubPrimaryButton(
              onPressed: () {
                logoutUser(context: context).call();
              },
            );
          },
        ),
      );

      await tester.pumpAndSettle();

      await tester.tap(find.byType(MyAfyaHubPrimaryButton));
      await tester.pumpAndSettle();

      expect(store.state, AppState.initial());
      expect(find.byType(PhoneLoginPage), findsOneWidget);
    });
    test('formatSecurityQuestionDate should return birth date in en_GB format',
        () {
      initializeDateFormatting();
      const String enFormat = '1990-02-19';
      const String looseFormat = '19 Feb 1990';

      final String r1 = formatSecurityQuestionDate(enFormat);
      final String r2 = formatSecurityQuestionDate(looseFormat);

      expect(r1, equals(r2));
    });

    test(
        'formatSecurityQuestionDate should return birth date from britain format',
        () {
      initializeDateFormatting();
      const String enFormat = '1990-02-19';
      const String looseFormat = '19 Feb, 1990';

      final String r2 =
          formatSecurityQuestionDate(looseFormat, format: 'yyyy-MM-dd');

      expect(enFormat, equals(r2));
    });
  });

  group('dismissSnackBar', () {
    testWidgets('should dismiss snackbar', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        widget: Builder(
          builder: (BuildContext context) {
            return Center(
              child: MyAfyaHubPrimaryButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('test snackbar'),
                      duration: const Duration(seconds: 5),
                      action:
                          dismissSnackBar(closeString, Colors.white, context),
                    ),
                  );
                },
              ),
            );
          },
        ),
      );
      await tester.pumpAndSettle();

      final Finder button = find.byType(MyAfyaHubPrimaryButton);
      await tester.tap(button);
      await tester.pumpAndSettle();

      expect(find.byType(Scaffold), findsOneWidget);

      final Finder close = find.text(closeString);
      await tester.ensureVisible(close);
      expect(close, findsOneWidget);

      await tester.tap(close);
      await tester.pumpAndSettle();

      expect(find.text('test snackbar'), findsNothing);
    });
  });
}
