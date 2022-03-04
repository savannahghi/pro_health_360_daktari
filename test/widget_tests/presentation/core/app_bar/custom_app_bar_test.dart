// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myharehubpro/domain/core/value_objects/app_widget_keys.dart';
import 'package:myharehubpro/presentation/core/app_bar/app_bar_back_button.dart';
import 'package:myharehubpro/presentation/core/app_bar/app_bar_more_button.dart';
import 'package:myharehubpro/presentation/core/app_bar/custom_app_bar.dart';

void main() {
  group('CustomAppBar', () {
    const String title = 'Conversation';

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
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            appBar: const CustomAppBar(
              title: title,
              showMoreButton: true,
            ),
            body: Container(),
          ),
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
  });
}
