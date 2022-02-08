// Flutter imports:
// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:healthcloud/application/core/services/utils.dart';
import 'package:healthcloud/application/redux/actions/core/update_user_action.dart';
// Project imports:
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/domain/core/entities/core/user.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:healthcloud/presentation/engagement/home/pages/home_page.dart';
import 'package:healthcloud/presentation/engagement/home/widgets/action_card.dart';
import 'package:healthcloud/presentation/engagement/home/widgets/appbar_user.dart';
import 'package:healthcloud/presentation/onboarding/patient/add_new_patient_page.dart';
import 'package:healthcloud/presentation/service_requests/pages/service_requests_page.dart';
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
      final String firstName = store.state.staffState?.user?.name ?? UNKNOWN;
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
      expect(
        find.text(
          removeTailingComma(
            getGreetingMessage(
              firstName == UNKNOWN ? '' : firstName,
            ),
          ),
        ),
        findsOneWidget,
      );
      expect(find.byType(ActionCard), findsWidgets);

      await tester.tap(find.text(addNewUserText));
      await tester.pumpAndSettle();
      expect(find.byType(AddNewPatientPage), findsWidgets);
    });

    testWidgets('navigates to ServiceRequestsPage',
        (WidgetTester tester) async {
      const String firstName = 'Laura';
      store.dispatch(
        UpdateUserAction(user: User.initial().copyWith(firstName: firstName)),
      );
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
      expect(
        find.text(
          removeTailingComma(
            getGreetingMessage(
              firstName,
            ),
          ),
        ),
        findsOneWidget,
      );
      expect(find.byType(ActionCard), findsWidgets);

      await tester.tap(find.text(serviceRequestsText));
      await tester.pumpAndSettle();
      expect(find.byType(ServiceRequestsPage), findsWidgets);
    });
    //TODO(eugene): Restore when Surveys is ready
    // testWidgets('navigates to SurveysPage', (WidgetTester tester) async {
    //   await buildTestWidget(
    //     tester: tester,
    //     store: store,
    //     widget: Builder(
    //       builder: (BuildContext context) {
    //         return StoreProvider<AppState>(
    //           store: store,
    //           child: const HomePage(),
    //         );
    //       },
    //     ),
    //   );

    //   expect(find.byType(AppbarUser), findsOneWidget);
    //   expect(find.text(getGreetingMessage(firstName)), findsOneWidget);
    //   expect(find.byType(ActionCard), findsWidgets);

    //   final Finder surveysPage =
    //       find.byKey(surveysCardKey, skipOffstage: false);
    //   await tester.ensureVisible(surveysPage);

    //   await tester.tap(find.text(surveysString));
    //   await tester.pumpAndSettle();
    //   expect(find.byType(SurveysPage), findsWidgets);
    // });
    //TODO(eugene): Restore when Search is ready
    // testWidgets('navigates to SearchPage', (WidgetTester tester) async {
    //   await buildTestWidget(
    //     tester: tester,
    //     store: store,
    //     widget: Builder(
    //       builder: (BuildContext context) {
    //         return StoreProvider<AppState>(
    //           store: store,
    //           child: const HomePage(),
    //         );
    //       },
    //     ),
    //   );

    //   expect(find.byType(AppbarUser), findsOneWidget);
    //   expect(find.text(getGreetingMessage(firstName)), findsOneWidget);
    //   expect(find.byType(ActionCard), findsWidgets);

    //   await tester.tap(find.text(searchUser));
    //   await tester.pumpAndSettle();
    //   expect(find.byType(SearchPage), findsWidgets);
    // });
  });
}
