import 'dart:convert';

// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:mycarehubpro/application/redux/actions/core/update_credentials_action.dart';
import 'package:mycarehubpro/application/redux/actions/flags/app_flags.dart';
import 'package:mycarehubpro/application/redux/actions/onboarding/update_onboarding_state_action.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/domain/core/entities/login/phone_login_response.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_widget_keys.dart';
import 'package:mycarehubpro/presentation/onboarding/login/pages/login_counter_page.dart';
import 'package:mycarehubpro/presentation/onboarding/login/pages/pending_pin_request_page.dart';
import 'package:mycarehubpro/presentation/onboarding/login/pages/phone_login_page.dart';
import 'package:mycarehubpro/presentation/onboarding/login/widgets/phone_login_error_widget.dart';
import 'package:mycarehubpro/presentation/onboarding/pin_expired/pages/pin_expired_page.dart';
import 'package:mycarehubpro/presentation/onboarding/verify_phone/pages/verify_phone_page.dart';

import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  group('PhoneLogin', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets(
        'should log in the user, update the user state and navigate to '
        'the home page', (WidgetTester tester) async {
      store.dispatch(UpdateCredentialsAction(isSignedIn: true));
      store.dispatch(UpdateOnboardingStateAction(isPhoneVerified: true));

      await mockNetworkImages(() async {
        await buildTestWidget(
          tester: tester,
          store: store,
          graphQlClient: mockGraphQlClient,
          widget: PhoneLoginPage(),
        );

        final Finder phoneLoginButton = find.byKey(loginKey);
        final Finder phoneInput = find.byKey(phoneLoginPinInputKey);

        expect(phoneLoginButton, findsOneWidget);
        expect(phoneInput, findsOneWidget);

        // Enter phone number
        await tester.enterText(find.byType(MyAfyaHubPhoneInput), '0712345678');

        // Enter PIN
        await tester.enterText(phoneInput, '1234');

        // Tap the login button
        await tester.ensureVisible(find.byKey(loginKey));
        await tester.tap(phoneLoginButton);
        await tester.pump();

        final PhoneLoginResponse phoneLoginResponse =
            PhoneLoginResponse.fromJson(mockLoginResponse);

        await tester.pumpAndSettle();
        expect(find.byType(VerifyPhonePage), findsOneWidget);

        expect(
          store.state.staffState!.user,
          phoneLoginResponse.userResponse?.staffState!.user,
        );
      });
    });

    testWidgets('should work correctly on large screen',
        (WidgetTester tester) async {
      store.dispatch(UpdateCredentialsAction(isSignedIn: true));
      store.dispatch(UpdateOnboardingStateAction(isPhoneVerified: true));
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      tester.binding.window.physicalSizeTestValue =
          typicalLargePhoneScreenSizePortrait;
      TestWidgetsFlutterBinding.ensureInitialized();

      await mockNetworkImages(() async {
        await buildTestWidget(
          tester: tester,
          store: store,
          graphQlClient: mockGraphQlClient,
          widget: PhoneLoginPage(),
        );

        final Finder phoneLoginButton = find.byKey(loginKey);
        final Finder phoneInput = find.byKey(phoneLoginPinInputKey);

        expect(phoneLoginButton, findsOneWidget);
        expect(phoneInput, findsOneWidget);

        // Enter phone number
        await tester.enterText(find.byType(MyAfyaHubPhoneInput), '0712345678');

        // Enter PIN
        await tester.enterText(phoneInput, '1234');

        // Tap the login button
        await tester.ensureVisible(find.byKey(loginKey));
        await tester.tap(phoneLoginButton);
        await tester.pump();

        final PhoneLoginResponse phoneLoginResponse =
            PhoneLoginResponse.fromJson(mockLoginResponse);

        await tester.pumpAndSettle();
        expect(find.byType(VerifyPhonePage), findsOneWidget);

        expect(
          store.state.staffState!.user,
          phoneLoginResponse.userResponse?.staffState!.user,
        );
        addTearDown(() {
          tester.binding.window.clearPhysicalSizeTestValue();
          tester.binding.window.clearDevicePixelRatioTestValue();
        });
      });
    });

    testWidgets(
        'should show an error message if invalid credentials are entered',
        (WidgetTester tester) async {
      final MockShortGraphQlClient graphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(json.encode(<String, dynamic>{'code': 8}), 400),
      );

      await buildTestWidget(
        store: store,
        tester: tester,
        widget: PhoneLoginPage(),
        graphQlClient: graphQlClient,
      );

      expect(find.byType(MyAfyaHubPhoneInput), findsOneWidget);

      // Enter phone number
      await tester.enterText(find.byType(MyAfyaHubPhoneInput), '0712345678');

      // Enter PIN
      await tester.enterText(find.byKey(phoneLoginPinInputKey), '1234');

      // Tap the login button
      await tester.ensureVisible(find.byKey(loginKey));
      await tester.tap(find.byKey(loginKey));
      await tester.pumpAndSettle();

      expect(store.state.onboardingState!.invalidCredentials, true);
      expect(find.byType(SnackBar), findsOneWidget);
      expect(
        find.text(
          'Sorry, the credentials you entered are incorrect. Please try '
          'again or contact support',
        ),
        findsOneWidget,
      );
    });

    testWidgets('should navigate to PIN expired page when a PIN has expired',
        (WidgetTester tester) async {
      final MockShortGraphQlClient graphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(json.encode(<String, dynamic>{'code': 48}), 400),
      );

      await buildTestWidget(
        store: store,
        tester: tester,
        widget: PhoneLoginPage(),
        graphQlClient: graphQlClient,
      );

      expect(find.byType(MyAfyaHubPhoneInput), findsOneWidget);

      // Enter phone number
      await tester.enterText(find.byType(MyAfyaHubPhoneInput), '0712345678');

      // Enter PIN
      await tester.enterText(find.byKey(phoneLoginPinInputKey), '1234');

      // Tap the login button
      await tester.ensureVisible(find.byKey(loginKey));
      await tester.tap(find.byKey(loginKey));
      await tester.pumpAndSettle();

      expect(find.byType(PinExpiredPage), findsOneWidget);
    });

    testWidgets('should show a generic error if any other error occurs',
        (WidgetTester tester) async {
      final MockShortGraphQlClient graphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(json.encode(<String, dynamic>{'code': 100}), 400),
      );

      await buildTestWidget(
        store: store,
        tester: tester,
        widget: PhoneLoginPage(),
        graphQlClient: graphQlClient,
      );

      expect(find.byType(MyAfyaHubPhoneInput), findsOneWidget);

      // Enter phone number
      await tester.enterText(find.byType(MyAfyaHubPhoneInput), '0712345678');

      // Enter PIN
      await tester.enterText(find.byKey(phoneLoginPinInputKey), '1234');

      // Tap the login button
      await tester.ensureVisible(find.byKey(loginKey));
      await tester.tap(find.byKey(loginKey));
      await tester.pumpAndSettle();

      expect(find.text(somethingWentWrongText), findsOneWidget);
    });

    testWidgets(
        'should navigate to pending PIN reset request page when a '
        'pending PIN reset request exists', (WidgetTester tester) async {
      final MockShortGraphQlClient graphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(json.encode(<String, dynamic>{'code': 72}), 400),
      );

      await buildTestWidget(
        store: store,
        tester: tester,
        widget: PhoneLoginPage(),
        graphQlClient: graphQlClient,
      );

      expect(find.byType(MyAfyaHubPhoneInput), findsOneWidget);

      // Enter phone number
      await tester.enterText(find.byType(MyAfyaHubPhoneInput), '0712345678');

      // Enter PIN
      await tester.enterText(find.byKey(phoneLoginPinInputKey), '1234');

      // Tap the login button
      await tester.ensureVisible(find.byKey(loginKey));
      await tester.tap(find.byKey(loginKey));
      await tester.pumpAndSettle();

      expect(find.byType(PendingPINRequestPage), findsOneWidget);
    });

    testWidgets(
        'should navigate to login counter page when a '
        'exponential backoff is triggered', (WidgetTester tester) async {
      final MockShortGraphQlClient graphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{
            'message': '73: wrong PIN',
            'code': 73,
            'retryTime': 21.8990
          }),
          400,
        ),
      );

      await buildTestWidget(
        store: store,
        tester: tester,
        widget: PhoneLoginPage(),
        graphQlClient: graphQlClient,
      );

      expect(find.byType(MyAfyaHubPhoneInput), findsOneWidget);

      // Enter phone number
      await tester.enterText(find.byType(MyAfyaHubPhoneInput), '0712345678');

      // Enter PIN
      await tester.enterText(find.byKey(phoneLoginPinInputKey), '1234');

      // Tap the login button
      await tester.ensureVisible(find.byKey(loginKey));
      await tester.tap(find.byKey(loginKey));
      await tester.pumpAndSettle(const Duration(seconds: 5));
      expect(find.byType(LoginCounterPage), findsOneWidget);

      await tester.pumpAndSettle(const Duration(seconds: 30));
      expect(find.byType(PhoneLoginPage), findsOneWidget);
    });

    testWidgets(
        'shows the error alert widget when invalid credentials are provided',
        (WidgetTester tester) async {
      await buildTestWidget(
        store: store,
        tester: tester,
        widget: PhoneLoginPage(),
      );
      await tester.pumpAndSettle();

      store.dispatch(UpdateOnboardingStateAction(invalidCredentials: true));
      await tester.pumpAndSettle();

      expect(find.byType(PhoneLoginErrorWidget), findsOneWidget);

      // Enter PIN
      await tester.enterText(find.byKey(phoneLoginPinInputKey), '1234');

      expect(
        store.state.onboardingState!.invalidCredentials,
        false,
      );

      store.dispatch(UpdateOnboardingStateAction(invalidCredentials: true));
      await tester.pumpAndSettle();
      await tester.enterText(find.byType(MyAfyaHubPhoneInput), '0712345678');
      expect(
        store.state.onboardingState!.invalidCredentials,
        false,
      );
    });

    testWidgets('shows a loading indicator when processing',
        (WidgetTester tester) async {
      store.dispatch(WaitAction<AppState>.add(phoneLoginStateFlag));
      await buildTestWidget(
        store: store,
        tester: tester,
        widget: PhoneLoginPage(),
      );
      expect(find.byType(PlatformLoader), findsOneWidget);
    });
  });
}
