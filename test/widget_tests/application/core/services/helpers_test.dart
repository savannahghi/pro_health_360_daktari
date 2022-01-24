import 'package:async_redux/async_redux.dart';
import 'package:bewell_pro_core/presentation/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:healthcloud/application/core/services/helpers.dart';
import 'package:healthcloud/application/redux/actions/core/batch_update_user_state_action.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/domain/core/value_objects/app_enums.dart';
import 'package:healthcloud/presentation/onboarding/login/widgets/phone_login.dart';
import 'package:http/http.dart';

import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  group('Helpers', () {
    final MockSILGraphQlClient mockSILGraphQlClient =
        MockSILGraphQlClient.withResponse(
      'idToken',
      'endpoint',
      Response('', 200),
    );

    testWidgets(
        'triggerNavigationEvent navigate to phone login page when'
        ' shouldRemoveUntil is true', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        graphQlClient: mockSILGraphQlClient,
        widget: const SizedBox(),
      );

      final BuildContext context = tester.element(find.byType(SizedBox));

      triggerNavigationEvent(
        context: context,
        route: phoneLoginRoute,
        shouldRemoveUntil: true,
      );

      await tester.pumpAndSettle();

      expect(find.byType(PhoneLogin), findsOneWidget);
    });

    testWidgets(
        'triggerNavigationEvent navigate to phone login page when'
        ' shouldReplace is true', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        graphQlClient: mockSILGraphQlClient,
        widget: const SizedBox(),
      );

      final BuildContext context = tester.element(find.byType(SizedBox));

      triggerNavigationEvent(
        context: context,
        route: phoneLoginRoute,
        shouldReplace: true,
      );

      await tester.pumpAndSettle();

      expect(find.byType(PhoneLogin), findsOneWidget);
    });

    group('getAuthTokenStatus', () {
      late Store<AppState> store;

      setUp(() {
        store = Store<AppState>(initialState: AppState.initial());
      });

      testWidgets(
          'should return AuthTokenStatus.requiresLogin if '
          'tokenExpiryFromState is UNKNOWN', (WidgetTester tester) async {
        late AuthTokenStatus? tokenStatus;

        await buildTestWidget(
          tester: tester,
          store: store,
          widget: Builder(
            builder: (BuildContext context) {
              return GestureDetector(
                onTap: () async =>
                    tokenStatus = await getAuthTokenStatus(context: context),
              );
            },
          ),
        );

        // normal when the token is UNKNOWN

        await tester.tap(find.byType(GestureDetector));
        await tester.pump();

        expect(tokenStatus, isNotNull);
        expect(tokenStatus, AuthTokenStatus.requiresLogin);
      });

      testWidgets(
          'should return AuthTokenStatus.okay if '
          'tokenExpiryFromState is more than 10 minutes',
          (WidgetTester tester) async {
        /// modify change the expiry time to >10 minutes in the future
        final DateTime futureTwelveMinutes =
            DateTime.now().add(const Duration(minutes: 12));

        await store.dispatch(
          BatchUpdateUserStateAction(
            isSignedIn: true,
            tokenExpiryTime: futureTwelveMinutes.toIso8601String(),
          ),
        );

        late AuthTokenStatus? tokenStatus;

        await buildTestWidget(
          tester: tester,
          store: store,
          widget: Builder(
            builder: (BuildContext context) {
              return GestureDetector(
                onTap: () async =>
                    tokenStatus = await getAuthTokenStatus(context: context),
              );
            },
          ),
        );

        // normal when the token is UNKNOWN

        await tester.tap(find.byType(GestureDetector));
        await tester.pump();

        expect(tokenStatus, isNotNull);
        expect(tokenStatus, AuthTokenStatus.okay);
      });

      testWidgets(
          'should refresh token and return AuthTokenStatus.ok if '
          'tokenExpiryFromState is more than 0 and less than 10 minutes',
          (WidgetTester tester) async {
        /// modify change the expiry time to >10 minutes in the future
        final DateTime futureEightMinutes =
            DateTime.now().add(const Duration(minutes: 8));

        await store.dispatch(
          BatchUpdateUserStateAction(
            isSignedIn: true,
            tokenExpiryTime: futureEightMinutes.toIso8601String(),
          ),
        );

        late AuthTokenStatus? tokenStatus;

        await buildTestWidget(
          tester: tester,
          store: store,
          widget: Builder(
            builder: (BuildContext context) {
              return GestureDetector(
                onTap: () async =>
                    tokenStatus = await getAuthTokenStatus(context: context),
              );
            },
          ),
        );

        // normal when the token is UNKNOWN

        await tester.tap(find.byType(GestureDetector));
        await tester.pump();

        expect(tokenStatus, isNotNull);
        expect(tokenStatus, AuthTokenStatus.okay);
      });

      testWidgets(
          'should refresh token and return AuthTokenStatus.requiresPin if '
          'tokenExpiryFromState has passed by less than 12 hours',
          (WidgetTester tester) async {
        /// modify change the expiry time to >10 minutes in the future
        final DateTime futureEightHours =
            DateTime.now().subtract(const Duration(hours: 8));

        await store.dispatch(
          BatchUpdateUserStateAction(
            isSignedIn: true,
            tokenExpiryTime: futureEightHours.toIso8601String(),
          ),
        );

        late AuthTokenStatus? tokenStatus;

        await buildTestWidget(
          tester: tester,
          store: store,
          widget: Builder(
            builder: (BuildContext context) {
              return GestureDetector(
                onTap: () async =>
                    tokenStatus = await getAuthTokenStatus(context: context),
              );
            },
          ),
        );

        // normal when the token is UNKNOWN

        await tester.tap(find.byType(GestureDetector));
        await tester.pump();

        expect(tokenStatus, isNotNull);
        expect(tokenStatus, AuthTokenStatus.requiresPin);
      });

      testWidgets(
          'should refresh token and return AuthTokenStatus.requiresLogin if '
          'tokenExpiryFromState has passed by more than 12 hours',
          (WidgetTester tester) async {
        /// modify change the expiry time to >10 minutes in the future
        final DateTime hours =
            DateTime.now().subtract(const Duration(hours: 22));

        await store.dispatch(
          BatchUpdateUserStateAction(tokenExpiryTime: hours.toIso8601String()),
        );

        late AuthTokenStatus? tokenStatus;

        await buildTestWidget(
          tester: tester,
          store: store,
          widget: Builder(
            builder: (BuildContext context) {
              return GestureDetector(
                onTap: () async =>
                    tokenStatus = await getAuthTokenStatus(context: context),
              );
            },
          ),
        );

        // normal when the token is UNKNOWN

        await tester.tap(find.byType(GestureDetector));
        await tester.pump();

        expect(tokenStatus, isNotNull);
        expect(tokenStatus, AuthTokenStatus.requiresLogin);
      });
    });
  });
}