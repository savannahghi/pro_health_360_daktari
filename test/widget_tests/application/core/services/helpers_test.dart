// Flutter imports:
// Package imports:
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
// Project imports:
import 'package:healthcloud/application/core/services/helpers.dart';
import 'package:healthcloud/presentation/onboarding/login/widgets/phone_login.dart';
import 'package:healthcloud/presentation/router/routes.dart';
import 'package:http/http.dart';

import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  group('Helpers', () {
    final MockTestGraphQlClient mockSILGraphQlClient =
        MockTestGraphQlClient.withResponse(
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
        route: AppRoutes.loginPage,
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
        route: AppRoutes.loginPage,
        shouldReplace: true,
      );

      await tester.pumpAndSettle();

      expect(find.byType(PhoneLogin), findsOneWidget);
    });
  });
}
