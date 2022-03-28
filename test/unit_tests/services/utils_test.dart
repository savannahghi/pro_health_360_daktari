// Package imports:
import 'dart:convert';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:intl/date_symbol_data_local.dart';
// Project imports:
import 'package:mycarehubpro/application/core/services/utils.dart';
import 'package:mycarehubpro/application/redux/actions/core/update_credentials_action.dart';
import 'package:mycarehubpro/application/redux/actions/onboarding/update_onboarding_state_action.dart';
import 'package:mycarehubpro/application/redux/actions/terms/update_terms_action.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/domain/core/entities/core/onboarding_path_info.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_enums.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';
import 'package:mycarehubpro/infrastructure/endpoints.dart';
import 'package:mycarehubpro/presentation/onboarding/login/pages/phone_login_page.dart';
import 'package:mycarehubpro/presentation/router/routes.dart';

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

  group('Login workflow onboardingPath', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
    });

    test('should return login page', () async {
      final OnboardingPathInfo path = getOnboardingPath(state: store.state);
      expect(path.nextRoute, AppRoutes.loginPage);
    });

    test('should return verify otp page', () async {
      store.dispatch(UpdateCredentialsAction(isSignedIn: true));
      final OnboardingPathInfo path = getOnboardingPath(state: store.state);
      expect(path.nextRoute, AppRoutes.verifyPhonePage);
    });

    test('should return terms accepted', () async {
      store.dispatch(UpdateCredentialsAction(isSignedIn: true));
      store.dispatch(UpdateOnboardingStateAction(isPhoneVerified: true));

      final OnboardingPathInfo path = getOnboardingPath(state: store.state);
      expect(path.nextRoute, AppRoutes.termsAndConditions);
    });

    test('should return security questions', () async {
      store.dispatch(UpdateCredentialsAction(isSignedIn: true));
      store.dispatch(UpdateOnboardingStateAction(isPhoneVerified: true));
      store.dispatch(UpdateTermsAndConditionsAction(isAccepted: true));

      final OnboardingPathInfo path = getOnboardingPath(state: store.state);
      expect(path.nextRoute, AppRoutes.securityQuestionsPage);
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

      final OnboardingPathInfo path = getOnboardingPath(state: store.state);
      expect(path.nextRoute, AppRoutes.setPinPage);
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

      final OnboardingPathInfo path = getOnboardingPath(state: store.state);
      expect(path.nextRoute, AppRoutes.setNicknamePage);
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

      final OnboardingPathInfo path = getOnboardingPath(state: store.state);
      expect(path.nextRoute, AppRoutes.homePage);
    });
  });

  group('Pin expired workflow onboardingPath', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
      store.dispatch(
        UpdateOnboardingStateAction(
          currentOnboardingStage: CurrentOnboardingStage.PINExpired,
        ),
      );
    });

    test('should return verify otp page', () async {
      store.dispatch(UpdateCredentialsAction(isSignedIn: true));
      final OnboardingPathInfo path = getOnboardingPath(state: store.state);
      expect(path.nextRoute, AppRoutes.verifyPhonePage);
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

      final OnboardingPathInfo path = getOnboardingPath(state: store.state);
      expect(path.nextRoute, AppRoutes.setPinPage);
    });

    test('should return login page', () async {
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

      final OnboardingPathInfo path = getOnboardingPath(state: store.state);
      expect(path.nextRoute, AppRoutes.loginPage);
    });
  });

  group('Pin reset workflow onboardingPath', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
      store.dispatch(
        UpdateOnboardingStateAction(
          currentOnboardingStage: CurrentOnboardingStage.ResetPIN,
        ),
      );
    });

    test('should return verify otp page', () async {
      store.dispatch(UpdateCredentialsAction(isSignedIn: true));
      final OnboardingPathInfo path = getOnboardingPath(state: store.state);
      expect(path.nextRoute, AppRoutes.verifyPhonePage);
    });

    test('should return security questions', () async {
      store.dispatch(UpdateCredentialsAction(isSignedIn: true));
      store.dispatch(
        UpdateOnboardingStateAction(
          isPhoneVerified: true,
          hasVerifiedSecurityQuestions: false,
        ),
      );
      store.dispatch(UpdateTermsAndConditionsAction(isAccepted: true));

      final OnboardingPathInfo path = getOnboardingPath(state: store.state);
      expect(path.nextRoute, AppRoutes.securityQuestionsPage);
    });

    test('should return set pin page', () async {
      store.dispatch(UpdateCredentialsAction(isSignedIn: true));
      store.dispatch(
        UpdateOnboardingStateAction(
          isPhoneVerified: true,
          hasVerifiedSecurityQuestions: true,
        ),
      );
      store.dispatch(UpdateTermsAndConditionsAction(isAccepted: true));

      final OnboardingPathInfo path = getOnboardingPath(state: store.state);
      expect(path.nextRoute, AppRoutes.setPinPage);
    });

    test('should return login page', () async {
      store.dispatch(UpdateCredentialsAction(isSignedIn: true));
      store.dispatch(
        UpdateOnboardingStateAction(
          isPhoneVerified: true,
          hasVerifiedSecurityQuestions: true,
          hasSetPin: true,
          hasSetNickName: true,
        ),
      );
      store.dispatch(UpdateTermsAndConditionsAction(isAccepted: true));

      final OnboardingPathInfo path = getOnboardingPath(state: store.state);
      expect(path.nextRoute, AppRoutes.loginPage);
    });
  });

  testWidgets('should test logout user works correctly',
      (WidgetTester tester) async {
    final Store<AppState> store =
        Store<AppState>(initialState: AppState.initial());

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
  test('userBannedMessage should return the correct message', () {
    expect(userBannedMessage(), 'User banned successfully');
    expect(
      userBannedMessage(userName: 'test', communityName: 'test'),
      'You have banned test from test',
    );
    expect(userBannedMessage(userName: 'test'), 'You have banned test');
    expect(
      userBannedMessage(
        isBanned: true,
      ),
      'User unbanned successfully',
    );
    expect(
      userBannedMessage(
        userName: 'test',
        communityName: 'test',
        isBanned: true,
      ),
      'You have unbanned test from test',
    );
    expect(
      userBannedMessage(
        userName: 'test',
        isBanned: true,
      ),
      'You have unbanned test',
    );
  });
  test('roleToString should return the correct role String', () {
    final String roleString = roleToString('CONTENT_MANAGEMENT');
    expect(roleString, 'Content management');
  });
}
