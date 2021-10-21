// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';

// Project imports:
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:healthcloud/domain/core/value_objects/app_widget_keys.dart';
import 'package:healthcloud/presentation/engagement/home/pages/content_page.dart';
import 'package:healthcloud/presentation/engagement/home/pages/home_page.dart';
import 'package:healthcloud/presentation/engagement/home/pages/search_page.dart';
import 'package:healthcloud/presentation/engagement/home/widgets/action_card.dart';
import 'package:healthcloud/presentation/engagement/home/widgets/appbar_user.dart';
import 'package:healthcloud/presentation/onboarding/patient/add_new_patient_page.dart';
import 'package:healthcloud/presentation/service_requests/pages/service_requests_page.dart';
import 'package:healthcloud/presentation/surveys/pages/surveys_page.dart';
import 'package:misc_utilities/misc.dart';
import '../../../../../mocks/test_helpers.dart';

void main() {
  group('HomePage', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets('navigates to add new patient page',
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

      await tester.tap(find.text(addNewUserText));
      await tester.pumpAndSettle();
      expect(find.byType(AddNewPatientPage), findsWidgets);
    });

    testWidgets('navigates to ServiceRequestsPage',
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

      await tester.tap(find.text(serviceRequestsText));
      await tester.pumpAndSettle();
      expect(find.byType(ServiceRequestsPage), findsWidgets);
    });

    testWidgets('navigates to ContentPage', (WidgetTester tester) async {
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

      final Finder contentPage =
          find.byKey(contentCardKey, skipOffstage: false);
      await tester.ensureVisible(contentPage);

      await tester.tap(find.text(contentString));
      await tester.pumpAndSettle();
      expect(find.byType(ContentPage), findsWidgets);
    });

    testWidgets('navigates to SurveysPage', (WidgetTester tester) async {
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

      final Finder surveysPage =
          find.byKey(surveysCardKey, skipOffstage: false);
      await tester.ensureVisible(surveysPage);

      await tester.tap(find.text(surveysString));
      await tester.pumpAndSettle();
      expect(find.byType(SurveysPage), findsWidgets);
    });

    testWidgets('navigates to SearchPage', (WidgetTester tester) async {
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

      await tester.tap(find.text(searchUser));
      await tester.pumpAndSettle();
      expect(find.byType(SearchPage), findsWidgets);
    });
  });
}
