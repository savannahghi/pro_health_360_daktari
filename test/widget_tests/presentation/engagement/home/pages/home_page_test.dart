// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';

// Project imports:
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:healthcloud/domain/core/value_objects/app_widget_keys.dart';
import 'package:healthcloud/presentation/engagement/home/pages/home_page.dart';
import 'package:healthcloud/presentation/engagement/home/widgets/action_card.dart';
import 'package:healthcloud/presentation/engagement/home/widgets/appbar_user.dart';
import 'package:misc_utilities/misc.dart';
import '../../../../../mocks/test_helpers.dart';

void main() {
  group('HomePage', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        widget: Builder(
          builder: (BuildContext context) {
            return StoreProvider<AppState>(
              store: store,
              child: const HomePage(),
            );
          },
        ),
      );

      expect(find.byType(AppbarUser), findsOneWidget);
      expect(find.text(getGreetingMessage(firstName)), findsOneWidget);
      expect(find.byType(ActionCard), findsWidgets);

      await tester.tap(find.text(addNewUserText));
      await tester.pumpAndSettle();
      expect(find.byType(ScaffoldMessenger), findsWidgets);

      await tester.tap(find.text(serviceRequestsText));
      await tester.pumpAndSettle();
      expect(find.byType(ScaffoldMessenger), findsWidgets);
    });

    testWidgets('renders profile update correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        widget: Builder(
          builder: (BuildContext context) {
            return StoreProvider<AppState>(
              store: store,
              child: const HomePage(),
            );
          },
        ),
      );

      expect(find.byType(AppbarUser), findsOneWidget);
      expect(find.text(getGreetingMessage(firstName)), findsOneWidget);
      expect(find.byType(ActionCard), findsWidgets);

      final Finder profileUpdate =
          find.byKey(profileUpdateCardKey, skipOffstage: false);
      await tester.ensureVisible(profileUpdate);

      await tester.tap(find.text(profileUpdateText));
      await tester.pumpAndSettle();
      expect(find.byType(ScaffoldMessenger), findsWidgets);
    });

    testWidgets('renders contact requests correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        widget: Builder(
          builder: (BuildContext context) {
            return StoreProvider<AppState>(
              store: store,
              child: const HomePage(),
            );
          },
        ),
      );

      expect(find.byType(AppbarUser), findsOneWidget);
      expect(find.text(getGreetingMessage(firstName)), findsOneWidget);
      expect(find.byType(ActionCard), findsWidgets);

      final Finder contactRequest =
          find.byKey(contactRequestCardKey, skipOffstage: false);
      await tester.ensureVisible(contactRequest);

      await tester.tap(find.text(contactRequestText));
      await tester.pumpAndSettle();
      expect(find.byType(ScaffoldMessenger), findsWidgets);
    });
  });
}
