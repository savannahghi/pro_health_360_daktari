import 'dart:convert';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:healthcloud/application/core/services/utils.dart';
import 'package:healthcloud/application/redux/actions/core/update_user_action.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/domain/core/entities/core/user.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:healthcloud/domain/core/value_objects/app_widget_keys.dart';
import 'package:healthcloud/presentation/create_group/create_group.dart';
import 'package:healthcloud/presentation/engagement/home/pages/home_page.dart';
import 'package:healthcloud/presentation/engagement/home/widgets/action_card.dart';
import 'package:healthcloud/presentation/engagement/home/widgets/appbar_user.dart';
import 'package:healthcloud/presentation/onboarding/patient/add_new_patient_page.dart';
import 'package:healthcloud/presentation/service_requests/pages/service_requests_page.dart';
import 'package:http/http.dart';

import '../../../../../mocks/mocks.dart';
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
        graphQlClient: MockTestGraphQlClient(),
        widget: Builder(
          builder: (BuildContext context) {
            return StoreProvider<AppState>(
              store: store,
              child: const HomePage(),
            );
          },
        ),
      );

      final Finder addNewUserWidget = find.text(addNewUserText);

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

      await tester.ensureVisible(addNewUserWidget);
      await tester.pumpAndSettle();
      await tester.tap(find.text(addNewUserText));
      await tester.pumpAndSettle();
      expect(find.byType(AddNewPatientPage), findsWidgets);
    });

    testWidgets('navigates to ServiceRequestsPage',
        (WidgetTester tester) async {
      final MockShortGraphQlClient mockShortGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{'getServiceRequests': <dynamic>[]}
          }),
          201,
        ),
      );
      const String firstName = 'Laura';
      store.dispatch(
        UpdateUserAction(user: User.initial().copyWith(firstName: firstName)),
      );
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: mockShortGraphQlClient,
        widget: Builder(
          builder: (BuildContext context) {
            return StoreProvider<AppState>(
              store: store,
              child: const HomePage(),
            );
          },
        ),
      );

      await tester.pumpAndSettle();
      final Finder serviceRequestsWidget = find.text(serviceRequestsText);
      final Finder genericNoDataButton = find.byKey(genericNoDataButtonKey);

      await tester.ensureVisible(serviceRequestsWidget);
      await tester.pumpAndSettle();
      await tester.tap(serviceRequestsWidget);
      await tester.pumpAndSettle();
      expect(find.byType(ServiceRequestsPage), findsWidgets);
      expect(genericNoDataButton, findsOneWidget);
      await tester.tap(genericNoDataButton);
      await tester.pumpAndSettle();
      expect(find.byType(ServiceRequestsPage), findsNothing);
    });

    testWidgets('navigates to create group page', (WidgetTester tester) async {
      const String firstName = 'Laura';
      store.dispatch(
        UpdateUserAction(user: User.initial().copyWith(firstName: firstName)),
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        widget: const HomePage(),
      );

      final Finder createGroupWidget = find.text(createGroupText);

      await tester.ensureVisible(createGroupWidget);
      await tester.pumpAndSettle();
      await tester.tap(createGroupWidget);
      await tester.pumpAndSettle();
      expect(find.byType(CreateGroupPage), findsWidgets);
    });
  });
}
