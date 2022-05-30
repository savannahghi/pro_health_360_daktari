import 'dart:convert';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mycarehubpro/application/redux/actions/core/update_credentials_action.dart';
import 'package:mycarehubpro/application/redux/actions/core/update_user_action.dart';
import 'package:mycarehubpro/application/redux/actions/flags/app_flags.dart';
import 'package:mycarehubpro/application/redux/actions/onboarding/update_onboarding_state_action.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/domain/core/entities/core/contact.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_enums.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_widget_keys.dart';
import 'package:mycarehubpro/presentation/onboarding/create_pin/pages/create_new_pin_page.dart';
import 'package:mycarehubpro/presentation/onboarding/login/widgets/error_card_widget.dart';
import 'package:mycarehubpro/presentation/onboarding/verify_phone/pages/verify_phone_page.dart';
import 'package:mycarehubpro/presentation/onboarding/verify_phone/widgets/verify_otp_widget.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  group('VerifyPhonePage', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(
        initialState: AppState.initial()
            .copyWith
            .staffState!
            .user!
            .call(
              primaryContact: Contact(value: '+254712345678'),
              userId: 'user-id',
            )
            .copyWith
            .onboardingState!
            .call(
              otp: '123456',
              invalidOTP: false,
              phoneNumber: '+254712345678',
            ),
      );
      store.dispatch(UpdateCredentialsAction(isSignedIn: true));
      store.dispatch(
        UpdateOnboardingStateAction(
          currentOnboardingStage: CurrentOnboardingStage.Login,
          isPhoneVerified: false,
          hasAcceptedTerms: true,
          hasSetSecurityQuestions: true,
          hasVerifiedSecurityQuestions: true,
          phoneNumber: '+2547123456',
          hasSetPin: false,
        ),
      );
      store.dispatch(
        UpdateUserAction(
          user:
              store.state.staffState!.user!.copyWith.call(termsAccepted: true),
        ),
      );
    });

    testWidgets('should verify an OTP correctly and navigate to set PIN page',
        (WidgetTester tester) async {
      store.dispatch(UpdateCredentialsAction(isSignedIn: true));

      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: const VerifyPhonePage(),
      );

      await tester.pumpAndSettle();
      expect(find.byType(VerifyOTPWidget), findsOneWidget);

      await tester.showKeyboard(find.byType(PINInputField));
      await tester.enterText(find.byType(PINInputField), '123456');
      await tester.pumpAndSettle(const Duration(seconds: 5));

      expect(find.byType(CreateNewPINPage), findsWidgets);
    });

    testWidgets('should show error if code is invalid',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: const VerifyPhonePage(),
      );

      await tester.pumpAndSettle();
      expect(find.byType(VerifyOTPWidget), findsOneWidget);
      await tester.pumpAndSettle();

      await tester.tap(find.byType(PINInputField));
      await tester.showKeyboard(find.byType(PINInputField));
      await tester.enterText(find.byType(PINInputField), '000000');
      await tester.pumpAndSettle();

      expect(find.text(invalidCode), findsWidgets);

      await tester.tap(find.byKey(feedbackBottomSheetCloseIconKey));
      await tester.pumpAndSettle();

      expect(find.text(invalidCode), findsNothing);
    });

    testWidgets('should show a loading indicator when sending an OTP',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: const VerifyPhonePage(),
      );

      await tester.pump();

      expect(find.byType(VerifyOTPWidget), findsOneWidget);

      store.dispatch(WaitAction<AppState>.add(sendOTPFlag));
      await tester.pump();

      expect(find.byType(PlatformLoader), findsOneWidget);
      store.dispatch(WaitAction<AppState>.remove(sendOTPFlag));
    });

    testWidgets('should show a loading indicator when verifying an OTP',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: const VerifyPhonePage(),
      );

      store.dispatch(WaitAction<AppState>.add(verifyOTPFlag));
      await tester.pump();

      expect(find.byType(PlatformLoader), findsOneWidget);
      expect(find.text(verifyCode), findsOneWidget);
    });

    testWidgets(
        'should show default error card when there is an error when fetching an OTP',
        (WidgetTester tester) async {
      final MockShortGraphQlClient mockTestGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{'error': 'some error'}),
          201,
        ),
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: mockTestGraphQlClient,
        widget: const VerifyPhonePage(),
      );

      await tester.pumpAndSettle();

      expect(find.byType(ErrorCardWidget), findsOneWidget);
    });

    testWidgets('default error card is clickable', (WidgetTester tester) async {
      final MockTestGraphQlClient mockTestGraphQlClient =
          MockTestGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{'error': 'some error'}),
          201,
        ),
      );

      store = Store<AppState>(initialState: AppState.initial());

      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: mockTestGraphQlClient,
        widget: const VerifyPhonePage(),
      );

      await tester.pumpAndSettle();

      expect(find.byType(ErrorCardWidget), findsOneWidget);

      await tester.ensureVisible(find.text(resendOTP));
      await tester.tap(find.text(resendOTP));
      await tester.pumpAndSettle();

      expect(find.text(didNotReceiveOTP), findsNothing);
    });

    testWidgets(
        'should verify an OTP correctly and navigate to create new pin page '
        'if reset pin is true', (WidgetTester tester) async {
      final MockShortGraphQlClient mockTestGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        http.Response(
          json.encode(<String, dynamic>{
            'otp': '123456',
            'data': <String, dynamic>{'sendOTP': '123456', 'verifyOTP': true}
          }),
          201,
        ),
      );

      store.dispatch(
        UpdateOnboardingStateAction(
          currentOnboardingStage: CurrentOnboardingStage.ResetPIN,
        ),
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: mockTestGraphQlClient,
        widget: const VerifyPhonePage(),
      );

      await tester.pumpAndSettle();

      await tester.showKeyboard(find.byType(PINInputField));
      await tester.enterText(find.byType(PINInputField), '123456');
      await tester.pumpAndSettle();

      expect(find.byType(CreateNewPINPage), findsWidgets);
    });
  });
}
