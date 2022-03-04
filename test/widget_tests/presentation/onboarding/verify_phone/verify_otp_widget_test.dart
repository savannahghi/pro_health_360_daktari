// Flutter imports:

// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myharehubpro/application/redux/actions/flags/app_flags.dart';
import 'package:myharehubpro/application/redux/actions/onboarding/update_onboarding_state_action.dart';
import 'package:myharehubpro/application/redux/states/app_state.dart';
import 'package:myharehubpro/application/redux/view_models/onboarding/verify_phone_view_model.dart';
import 'package:myharehubpro/domain/core/entities/core/contact.dart';
import 'package:myharehubpro/domain/core/value_objects/app_strings.dart';
import 'package:myharehubpro/domain/core/value_objects/app_widget_keys.dart';
import 'package:myharehubpro/presentation/onboarding/verify_phone/widgets/verify_otp_widget.dart';
import 'package:http/http.dart';

import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  group('VerifyOtpWidget', () {
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

    testWidgets('should render resend otp button ',
        (WidgetTester tester) async {
      store.dispatch(
        UpdateOnboardingStateAction(
          canResendOTP: true,
        ),
      );
      await tester.runAsync(() async {
        final MockShortGraphQlClient mockShortSILGraphQlClient =
            MockShortGraphQlClient.withResponse(
          'idToken',
          'endpoint',
          Response(
            json.encode(<String, dynamic>{
              'data': <String, dynamic>{
                'sendOTP': '123456',
                'sendRetryOTP': '123456',
              }
            }),
            201,
          ),
        );

        store.dispatch(
          UpdateOnboardingStateAction(
            canResendOTP: true,
          ),
        );

        await buildTestWidget(
          tester: tester,
          store: store,
          graphQlClient: mockShortSILGraphQlClient,
          widget: StoreConnector<AppState, VerifyPhoneViewModel>(
            converter: (Store<AppState> store) {
              return VerifyPhoneViewModel.fromStore(store);
            },
            builder: (BuildContext context, VerifyPhoneViewModel vm) {
              return VerifyOTPWidget(
                phoneNumber: vm.phoneNumber ?? UNKNOWN,
                verifyPhoneViewModel: vm,
                loader: const CircularProgressIndicator(),
              );
            },
          ),
        );

        await tester.pumpAndSettle();
        expect(find.byType(PINInputField), findsOneWidget);
        await tester.tap(find.byType(PINInputField));
        await tester.pumpAndSettle();
        final Finder btnKey = find.byKey(resendOtpButtonKey);
        expect(btnKey, findsOneWidget);
        await tester.tap(btnKey);
        await tester.pumpAndSettle();

        // get the state
        final State<StatefulWidget> testState = tester.allStates.singleWhere(
          (State<StatefulWidget> element) =>
              element.toString() == verifyOTPState,
        );

        // check if it is null
        expect(testState, isNotNull);

        // call the method
        final VerifyOTPWidgetState verifyPhoneOtpState =
            testState as VerifyOTPWidgetState;
        verifyPhoneOtpState.codeUpdated();

        // assert that is was called
        expect(() => verifyPhoneOtpState.codeUpdated(), returnsNormally);
      });
    });

    testWidgets('should show a loading indicator when verifying an OTP',
        (WidgetTester tester) async {
      store.dispatch(
        UpdateOnboardingStateAction(
          canResendOTP: true,
        ),
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: StoreConnector<AppState, VerifyPhoneViewModel>(
          converter: (Store<AppState> store) {
            return VerifyPhoneViewModel.fromStore(store);
          },
          builder: (BuildContext context, VerifyPhoneViewModel vm) {
            return VerifyOTPWidget(
              phoneNumber: vm.phoneNumber ?? UNKNOWN,
              verifyPhoneViewModel: vm,
              loader: const CircularProgressIndicator(),
            );
          },
        ),
      );

      await tester.pumpAndSettle();
      expect(find.byType(PINInputField), findsOneWidget);
      await tester.tap(find.byType(PINInputField));
      await tester.pumpAndSettle();

      expect(find.byKey(resendOtpButtonKey), findsOneWidget);
      await store.dispatch(WaitAction<AppState>.add(resendOTPFlag));
      await tester.pump();

      expect(find.byKey(resendOtpButtonKey), findsNothing);
    });
  });
}
