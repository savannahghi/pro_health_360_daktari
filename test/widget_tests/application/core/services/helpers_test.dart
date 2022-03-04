// Flutter imports:
// Package imports:
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
// Project imports:
import 'package:myharehubpro/application/core/services/helpers.dart';
import 'package:myharehubpro/presentation/onboarding/login/widgets/login_widget.dart';
import 'package:myharehubpro/presentation/router/routes.dart';
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

      expect(find.byType(LoginWidget), findsOneWidget);
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

      expect(find.byType(LoginWidget), findsOneWidget);
    });
  });
}
