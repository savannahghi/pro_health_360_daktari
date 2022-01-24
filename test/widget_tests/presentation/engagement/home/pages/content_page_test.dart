// Flutter imports
// Package imports
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:healthcloud/presentation/engagement/home/pages/content_page.dart';

import '../../../../../mocks/mocks.dart';
import '../../../../../mocks/test_helpers.dart';

void main() {
  group('Content Page', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets('renders correctly', (WidgetTester tester) async {
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      tester.binding.window.physicalSizeTestValue = tabletLandscape;

      await buildTestWidget(
        tester: tester,
        store: store,
        widget: Builder(
          builder: (BuildContext context) {
            return StoreProvider<AppState>(
              store: store,
              child: ContentPage(),
            );
          },
        ),
      );

      expect(find.byType(ContentPage), findsOneWidget);
    });

    testWidgets('content Management button is clicked',
        (WidgetTester tester) async {
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      tester.binding.window.physicalSizeTestValue = tabletLandscape;

      await buildTestWidget(
        tester: tester,
        store: store,
        widget: Builder(
          builder: (BuildContext context) {
            return StoreProvider<AppState>(
              store: store,
              child: ContentPage(),
            );
          },
        ),
      );

      expect(find.byType(ContentPage), findsOneWidget);
      final Finder contentManagementButton = find.text(contentManagementString);

      await tester.ensureVisible(contentManagementButton);
      await tester.tap(contentManagementButton);
      await tester.pumpAndSettle();

      expect(find.text(comingSoonText), findsOneWidget);
    });
  });
}
