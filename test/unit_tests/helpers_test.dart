// Flutter imports:
// Package imports:
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:flutter_test/flutter_test.dart';
// Project imports:
import 'package:healthcloud/application/core/services/helpers.dart';
import 'package:healthcloud/application/redux/actions/core/auth_status_action.dart';
import 'package:healthcloud/application/redux/actions/core/update_user_action.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/domain/core/entities/core/user.dart';
import 'package:healthcloud/domain/core/value_objects/app_contexts.dart';
import 'package:healthcloud/presentation/router/routes.dart';

import '../mocks/test_helpers.dart';

void main() {
  FlutterConfig.loadValueForTesting(<String, String>{
    'DEV_SENTRY_DNS': 'test_dev_sentry_dns',
    'PROD_SENTRY_DNS': 'test_prod_sentry_dns',
  });

  test('getAppSetupData should return the correct instance of AppSetupData',
      () async {
    expect(getAppSetupData(testAppContexts.last), devAppSetupData);

    expect(getAppSetupData(demoAppContexts.last), demoAppSetupData);

    expect(getAppSetupData(prodAppContexts.last), prodAppSetupData);

    expect(getAppSetupData(e2eAppContexts.last), devAppSetupData);

    expect(getAppSetupData(AppContext.BewellCONSUMER), devAppSetupData);
  });

  group('getInitialPageRoute', () {
    final Store<AppState> store =
        Store<AppState>(initialState: AppState.initial());

    testWidgets(
        'should return phoneLoginRoute if a user is signed in and the token'
        ' has expired for more than 12 hours', (WidgetTester tester) async {
      /// modify change the expiry time to >10 minutes in the future
      final DateTime hours = DateTime.now().subtract(const Duration(hours: 22));

      await store.dispatch(
        AuthStatusAction(
          isSignedIn: true,
          tokenExpiryTimestamp: hours.toIso8601String(),
        ),
      );

      late String? route;

      await buildTestWidget(
        tester: tester,
        store: store,
        widget: Builder(
          builder: (BuildContext context) {
            return GestureDetector(
              onTap: () async =>
                  route = await getInitialRoute(context: context),
            );
          },
        ),
      );

      // normal when the token is UNKNOWN

      await tester.tap(find.byType(GestureDetector));
      await tester.pump();

      expect(route, isNotNull);
      expect(route, AppRoutes.loginPage);
    });

    testWidgets(
        'should return pinVerificationRoute if a user is signed in and the token'
        ' has just expired for less than 12 hours',
        (WidgetTester tester) async {
      /// modify change the expiry time to >10 minutes in the future
      final DateTime hours = DateTime.now().subtract(const Duration(hours: 9));

      await store.dispatch(
        AuthStatusAction(
          isSignedIn: true,
          tokenExpiryTimestamp: hours.toIso8601String(),
        ),
      );

      late String? route;

      await buildTestWidget(
        tester: tester,
        store: store,
        widget: Builder(
          builder: (BuildContext context) {
            return GestureDetector(
              onTap: () async =>
                  route = await getInitialRoute(context: context),
            );
          },
        ),
      );

      // normal when the token is UNKNOWN

      await tester.tap(find.byType(GestureDetector));
      await tester.pump();

      expect(route, isNotNull);
      expect(route, AppRoutes.verifyOTPPage);
    });

    testWidgets(
        'should return the correct onboarding path if a user is signed in '
        'and the token is valid', (WidgetTester tester) async {
      // TODO (john): Rework this after logic is correct

      /// modify change the expiry time to >10 minutes in the future
      final DateTime hours = DateTime.now().add(const Duration(minutes: 12));

      await store.dispatch(
        AuthStatusAction(
          isSignedIn: true,
          tokenExpiryTimestamp: hours.toIso8601String(),
        ),
      );

      late String? route;

      await buildTestWidget(
        tester: tester,
        store: store,
        widget: Builder(
          builder: (BuildContext context) {
            return GestureDetector(
              onTap: () async =>
                  route = await getInitialRoute(context: context),
            );
          },
        ),
      );

      // normal when the token is UNKNOWN

      await tester.tap(find.byType(GestureDetector));
      await tester.pump();

      expect(route, isNotNull);
      expect(route, '/homePage');
    });

    testWidgets(
        'should return the correct home page path if a user is signed in '
        ', the token is valid and BioData is valid',
        (WidgetTester tester) async {
      /// modify change the expiry time to >10 minutes in the future
      final DateTime hours = DateTime.now().add(const Duration(minutes: 10));

      await store.dispatch(
        AuthStatusAction(
          isSignedIn: true,
          expiresIn: hours.toIso8601String(),
        ),
      );

      await store.dispatch(
        UpdateUserAction(
          user: User.initial().copyWith(
            firstName: 'AfyaMoja',
            lastName: 'Test',
          ),
        ),
      );

      late String? route;

      await buildTestWidget(
        tester: tester,
        store: store,
        widget: Builder(
          builder: (BuildContext context) {
            return GestureDetector(
              onTap: () async =>
                  route = await getInitialRoute(context: context),
            );
          },
        ),
      );

      // normal when the token is UNKNOWN

      await tester.tap(find.byType(GestureDetector));
      await tester.pump();

      expect(route, isNotNull);
      expect(route, AppRoutes.homePage);
    });
  });
}
