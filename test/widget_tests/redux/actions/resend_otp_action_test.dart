import 'dart:convert';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mycarehubpro/application/redux/actions/onboarding/resend_otp_action.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/domain/core/entities/core/contact.dart';
import 'package:http/http.dart';

import '../../../mocks/mocks.dart';
import '../../../mocks/test_helpers.dart';

void main() {
  group('ResendOTPAction', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(
        initialState: AppState.initial()
            .copyWith
            .staffState!
            .user!
            .call(
              primaryContact: Contact(value: '+254717356476'),
              userId: 'user-id',
            )
            .copyWith
            .onboardingState!
            .call(
              otp: '1234',
              invalidOTP: false,
              phoneNumber: '+254717356476',
            ),
      );
    });

    testWidgets(
        'should fail to resend an otp if the userID and phone number are '
        'UNKNOWN', (WidgetTester tester) async {
      store = Store<AppState>(initialState: AppState.initial());

      final MockShortGraphQlClient mockShortSILGraphQlClient =
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
        graphQlClient: mockShortSILGraphQlClient,
        widget: Builder(
          builder: (BuildContext context) {
            return MyAfyaHubPrimaryButton(
              buttonKey: const Key('update_contacts'),
              onPressed: () {
                StoreProvider.dispatch<AppState>(
                  context,
                  ResendOTPAction(context: context),
                );
              },
            );
          },
        ),
      );

      await tester.tap(find.byKey(const Key('update_contacts')));
      await tester.pumpAndSettle();

      expect(store.state.onboardingState!.failedToSendOTP, true);
    });

    testWidgets('should fail to resend an OTP if there is an API error',
        (WidgetTester tester) async {
      expect(
        store.state.onboardingState!.failedToSendOTP,
        false,
      );

      final MockShortGraphQlClient mockShortSILGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{'error': 'sorry, an error here'}),
          403,
        ),
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: mockShortSILGraphQlClient,
        widget: Builder(
          builder: (BuildContext context) {
            return MyAfyaHubPrimaryButton(
              buttonKey: const Key('update_contacts'),
              onPressed: () async {
                await store.dispatch(
                  ResendOTPAction(context: context),
                );
              },
            );
          },
        ),
      );

      await tester.tap(find.byKey(const Key('update_contacts')));
      await tester.pumpAndSettle();

      expect(store.state.onboardingState!.failedToSendOTP, true);
    });

    testWidgets('should handle other errors when resending an OTP',
        (WidgetTester tester) async {
      expect(store.state.onboardingState!.failedToSendOTP, false);

      final MockShortGraphQlClient mockShortSILGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{'data': 'sorry, an error here'}),
          400,
        ),
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: mockShortSILGraphQlClient,
        widget: Builder(
          builder: (BuildContext context) {
            return MyAfyaHubPrimaryButton(
              buttonKey: const Key('update_contacts'),
              onPressed: () async {
                await store.dispatch(ResendOTPAction(context: context));
              },
            );
          },
        ),
      );

      await tester.tap(find.byKey(const Key('update_contacts')));
      await tester.pumpAndSettle();

      expect(store.state.onboardingState!.failedToSendOTP, true);
      expect(
        find.text(
          'Sorry, an unknown error occurred, please try again or get help from our help center.',
        ),
        findsOneWidget,
      );
    });

    testWidgets('should save OTP to state after successfully resending it',
        (WidgetTester tester) async {
      expect(store.state.onboardingState!.failedToSendOTP, false);

      final MockShortGraphQlClient mockShortSILGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'sendRetryOTP': '123456',
            },
          }),
          200,
        ),
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: mockShortSILGraphQlClient,
        widget: Builder(
          builder: (BuildContext context) {
            return MyAfyaHubPrimaryButton(
              buttonKey: const Key('update_contacts'),
              onPressed: () async {
                await store.dispatch(ResendOTPAction(context: context));
              },
            );
          },
        ),
      );

      await tester.tap(find.byKey(const Key('update_contacts')));
      await tester.pumpAndSettle();

      expect(store.state.onboardingState!.failedToSendOTP, false);
      expect(store.state.onboardingState!.otp, '123456');
    });
  });
}
