// Flutter imports:
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/core/app_bar/app_bar_back_button.dart';
import 'package:prohealth360_daktari/presentation/core/app_bar/app_bar_more_button.dart';
import 'package:prohealth360_daktari/presentation/core/app_bar/custom_app_bar.dart';
import 'package:prohealth360_daktari/presentation/notifications/notifications_page.dart';
import 'package:prohealth360_daktari/presentation/router/routes.dart';

import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  group('CustomAppBar', () {
    const String title = 'Conversation';
    setUp(() async {
      setupFirebaseMessagingMocks();
      await Firebase.initializeApp();
    });
    testWidgets('should render correctly with default values',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            appBar: const CustomAppBar(
              title: title,
            ),
            body: Container(),
          ),
        ),
      );

      expect(find.byType(AppBarBackButton), findsOneWidget);
      expect(find.text(title), findsOneWidget);
    });

    testWidgets('should render correctly with showMoreButton set to true',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        graphQlClient: MockTestGraphQlClient(),
        widget: Scaffold(
          appBar: const CustomAppBar(
            title: title,
            showMoreButton: true,
          ),
          body: Container(),
        ),
      );
      final Finder backButton = find.byKey(appBarBackButtonKey);

      expect(backButton, findsOneWidget);
      expect(find.byType(AppBarBackButton), findsOneWidget);
      expect(find.text(title), findsOneWidget);
      expect(find.byType(AppBarMoreButton), findsOneWidget);

      await tester.ensureVisible(backButton);
      await tester.tap(backButton);
      await tester.pumpAndSettle();
    });
    testWidgets('should pop current page if there is an underlying widget',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        graphQlClient: MockTestGraphQlClient(),
        widget: Builder(
          builder: (BuildContext context) {
            return MaterialButton(
              onPressed: () =>
                  Navigator.pushNamed(context, AppRoutes.serviceRequestsPage),
            );
          },
        ),
      );
      final Finder backButton = find.byKey(appBarBackButtonKey);
      await tester.tap(find.byType(MaterialButton));
      await tester.pumpAndSettle();

      expect(backButton, findsOneWidget);
      expect(find.byType(MaterialButton), findsNothing);
      await tester.ensureVisible(backButton);
      await tester.tap(backButton);
      await tester.pumpAndSettle();
      expect(find.byType(MaterialButton), findsOneWidget);
    });

    testWidgets('notifications icon navigates to notifications page',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        widget: const CustomAppBar(
          title: title,
          showNotificationIcon: true,
        ),
      );
      final Finder notificationButtonFinder = find.byKey(appBarNotificationKey);
      expect(notificationButtonFinder, findsOneWidget);

      await tester.tap(notificationButtonFinder);
      await tester.pumpAndSettle();

      expect(find.byType(NotificationsPage), findsOneWidget);
    });
  });
}
