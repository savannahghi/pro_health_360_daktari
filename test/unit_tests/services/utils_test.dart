// Package imports:
import 'dart:convert';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:intl/date_symbol_data_local.dart';
// Project imports:
import 'package:prohealth360_daktari/application/core/services/utils.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/application/redux/actions/core/update_credentials_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/onboarding/update_onboarding_state_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/terms/update_terms_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/states/misc_state.dart';
import 'package:prohealth360_daktari/application/redux/states/onboarding/onboarding_state.dart';
import 'package:prohealth360_daktari/domain/core/entities/core/auth_credentials.dart';
import 'package:prohealth360_daktari/domain/core/entities/core/onboarding_path_info.dart';
import 'package:prohealth360_daktari/domain/core/entities/core/staff_state.dart';
import 'package:prohealth360_daktari/domain/core/entities/core/user.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_enums.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/infrastructure/endpoints.dart';
import 'package:prohealth360_daktari/presentation/onboarding/login/pages/phone_login_page.dart';
import 'package:prohealth360_daktari/presentation/router/routes.dart';

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

  group('Pin update workflow onboardingPath', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
      store.dispatch(
        UpdateOnboardingStateAction(
          currentOnboardingStage: CurrentOnboardingStage.PINUpdate,
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
          hasVerifiedSecurityQuestions: false,
        ),
      );
      store.dispatch(UpdateTermsAndConditionsAction(isAccepted: true));

      final OnboardingPathInfo path = getOnboardingPath(state: store.state);
      expect(path.nextRoute, AppRoutes.setPinPage);
    });

    test('should return security questions', () async {
      store.dispatch(UpdateCredentialsAction(isSignedIn: true));
      store.dispatch(
        UpdateOnboardingStateAction(
          isPhoneVerified: true,
          hasSetPin: true,
          hasVerifiedSecurityQuestions: false,
        ),
      );
      store.dispatch(UpdateTermsAndConditionsAction(isAccepted: true));

      final OnboardingPathInfo path = getOnboardingPath(state: store.state);
      expect(path.nextRoute, AppRoutes.securityQuestionsPage);
    });

    test('should return login page', () async {
      store.dispatch(UpdateCredentialsAction(isSignedIn: true));
      store.dispatch(
        UpdateOnboardingStateAction(
          isPhoneVerified: true,
          hasVerifiedSecurityQuestions: true,
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

  testWidgets('should test logout user works correctly',
      (WidgetTester tester) async {
    setupFirebaseAnalyticsMocks();
    await Firebase.initializeApp();
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

  test('getGroupMembersNumber', () {
    expect(getGroupMembersNumber(5), '5 members');
  });

  test('getMoodColor should return the various mood colors', () {
    expect(getMoodColor('Happy').color, AppColors.greenHappyColor);
    expect(getMoodColor('Very Happy').color, AppColors.greenHappyColor);
    expect(getMoodColor('Meh').color, AppColors.mehMoodColor);
    expect(getMoodColor('Sad').color, AppColors.warningColor);
    expect(getMoodColor('Very Sad').color, AppColors.verySadColor);
    expect(getMoodColor('Other').color, AppColors.secondaryColor);
    expect(getMoodColor(null).color, AppColors.secondaryColor);
  });

  test('resumeWithPIN returns the correct value', () {
    expect(
      resumeWithPIN(
        AppState.initial().copyWith(
          credentials: AuthCredentials.initial().copyWith(isSignedIn: true),
          onboardingState: OnboardingState.initial().copyWith(
            isPhoneVerified: true,
            hasSetSecurityQuestions: true,
            hasVerifiedSecurityQuestions: true,
            hasSetNickName: true,
            hasSetPin: true,
            hasAcceptedTerms: true,
          ),
          miscState: MiscState.initial().copyWith(
            inactiveTime:
                DateTime.now().subtract(const Duration(minutes: 10)).toString(),
          ),
          staffState:
              StaffState.initial().copyWith(user: User(termsAccepted: true)),
        ),
      ),
      true,
    );
    expect(resumeWithPIN(AppState.initial()), false);
    expect(resumeWithPIN(AppState.initial()), false);
  });
  test('getNotificationInfo  return the correct value', () {
    expect(
      getNotificationInfo(NotificationType.COMMUNITIES),
      NotificationActionInfo(
        actionTitle: 'View Conversations',
        route: AppRoutes.communityPage,
      ),
    );
  });
}
