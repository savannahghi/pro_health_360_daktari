import 'dart:convert';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myharehubpro/application/redux/actions/core/update_credentials_action.dart';
import 'package:myharehubpro/application/redux/actions/flags/app_flags.dart';
import 'package:myharehubpro/application/redux/actions/onboarding/update_onboarding_state_action.dart';
import 'package:myharehubpro/application/redux/states/app_state.dart';
import 'package:myharehubpro/domain/core/entities/core/contact.dart';
import 'package:myharehubpro/domain/core/value_objects/app_strings.dart';
import 'package:myharehubpro/domain/core/value_objects/app_widget_keys.dart';
import 'package:myharehubpro/presentation/onboarding/create_pin/pages/create_new_pin_page.dart';
import 'package:myharehubpro/presentation/onboarding/login/widgets/error_card_widget.dart';
import 'package:myharehubpro/presentation/onboarding/terms/terms_and_conditions_page.dart';
import 'package:myharehubpro/presentation/onboarding/verify_phone/pages/verify_phone_page.dart';
import 'package:myharehubpro/presentation/onboarding/verify_phone/widgets/verify_otp_widget.dart';
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
            .verifyPhoneState!
            .call(otp: '123456', invalidOTP: false),
      );
    });

    testWidgets('should verify an OTP correctly and navigate to terms page',
        (WidgetTester tester) async {
      store.dispatch(UpdateCredentialsAction(isSignedIn: true));

      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: const VerifyPhonePage(
          phoneNumber: '+254712345678',
        ),
      );

      await tester.pumpAndSettle();
      expect(find.byType(VerifyOTPWidget), findsOneWidget);

      await tester.showKeyboard(find.byType(PINInputField));
      await tester.enterText(find.byType(PINInputField), '123456');
      await tester.pumpAndSettle(const Duration(seconds: 5));

      expect(find.byType(TermsAndConditionsPage), findsWidgets);
    });

    testWidgets('should show error if code is invalid',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: const VerifyPhonePage(
          phoneNumber: '+254712345678',
        ),
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
        widget: const VerifyPhonePage(
          phoneNumber: '+254712345678',
        ),
      );

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
        widget: const VerifyPhonePage(
          phoneNumber: '+254712345678',
        ),
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
        widget: const VerifyPhonePage(
          phoneNumber: '+254712345678',
        ),
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
        widget: const VerifyPhonePage(
          phoneNumber: '+254712345678',
        ),
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
          isResetPin: true,
        ),
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: mockTestGraphQlClient,
        widget: const VerifyPhonePage(
          phoneNumber: '+254712345678',
        ),
      );

      await tester.pumpAndSettle();

      await tester.showKeyboard(find.byType(PINInputField));
      await tester.enterText(find.byType(PINInputField), '123456');
      await tester.pumpAndSettle();

      expect(find.byType(CreateNewPINPage), findsWidgets);
    });
  });
}
