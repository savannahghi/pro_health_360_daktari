// Package imports:
import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myharehubpro/application/redux/actions/flags/app_flags.dart';
import 'package:myharehubpro/application/redux/states/app_state.dart';

// Project imports:
import 'package:myharehubpro/domain/core/value_objects/app_strings.dart';
import 'package:myharehubpro/domain/core/value_objects/app_widget_keys.dart';
import 'package:myharehubpro/presentation/core/app_bar/custom_app_bar.dart';
import 'package:myharehubpro/presentation/core/widgets/platform_loader.dart';
import 'package:myharehubpro/presentation/engagement/home/widgets/action_card.dart';
import 'package:myharehubpro/presentation/service_requests/pages/red_flags_page.dart';
import 'package:myharehubpro/presentation/service_requests/pages/service_requests_page.dart';
import 'package:http/http.dart';
import '../../../mocks/mocks.dart';
import '../../../mocks/test_helpers.dart';

void main() {
  group('ServiceRequestsPage', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
    });
    testWidgets('should render correctly with default values',
        (WidgetTester tester) async {
      final MockShortGraphQlClient mockShortGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'getPendingServiceRequestsCount': <String, dynamic>{
                'total': 4,
                'requestsTypeCount': <dynamic>[
                  <String, dynamic>{'requestType': 'RED_FLAG', 'total': 2},
                  <String, dynamic>{'requestType': 'PIN_RESET', 'total': 2},
                ],
              }
            }
          }),
          201,
        ),
      );

      await buildTestWidget(
        tester: tester,
        widget: ServiceRequestsPage(),
        graphQlClient: mockShortGraphQlClient,
      );
      final Finder genericNoDataButton = find.byKey(genericNoDataButtonKey);
      await tester.pumpAndSettle();
      expect(find.byType(CustomAppBar), findsOneWidget);
      expect(find.text(serviceRequestString), findsOneWidget);
      expect(find.byType(ActionCard), findsNWidgets(2));

      await tester.tap(find.byType(ActionCard).first);
      await tester.pumpAndSettle();
      expect(find.text(serviceRequestString), findsNothing);
      await tester.tap(find.byKey(appBarBackButtonKey));
      await tester.pumpAndSettle();
      expect(find.text(serviceRequestString), findsOneWidget);

      await tester.tap(find.byType(ActionCard).last);
      await tester.pumpAndSettle();
      expect(find.text(serviceRequestString), findsNothing);
      await tester.ensureVisible(genericNoDataButton);
      await tester.pumpAndSettle();
      await tester.tap(genericNoDataButton);
      await tester.pumpAndSettle();
      expect(find.text(serviceRequestString), findsOneWidget);
    });

    testWidgets('genericNoData widget is tappable',
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
      await buildTestWidget(
        tester: tester,
        graphQlClient: mockShortGraphQlClient,
        store: store,
        widget: ServiceRequestsPage(),
      );
      await tester.pumpAndSettle();
      final Finder genericNoDataButton = find.byKey(genericNoDataButtonKey);

      await tester.tap(genericNoDataButton);
      await tester.pumpAndSettle();
      expect(find.byType(RedFlagsPage), findsNothing);
    });
    testWidgets('profile updates ActionCard is tappable',
        (WidgetTester tester) async {
      final MockShortGraphQlClient mockShortGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'getPendingServiceRequestsCount': <String, dynamic>{
                'total': 2,
                'requestsTypeCount': <dynamic>[
                  <String, dynamic>{
                    'requestType': 'PROFILE_UPDATE',
                    'total': 2
                  },
                ],
              }
            }
          }),
          201,
        ),
      );
      await buildTestWidget(
        tester: tester,
        graphQlClient: mockShortGraphQlClient,
        store: store,
        widget: ServiceRequestsPage(),
      );
      final Finder profileUpdateActionCard = find.byType(ActionCard);
      await tester.pumpAndSettle();
      expect(profileUpdateActionCard, findsOneWidget);

      await tester.tap(profileUpdateActionCard);
      await tester.pumpAndSettle();
      expect(profileUpdateActionCard, findsNothing);
    });
    testWidgets(
      'should show an error widget when fetching service request count',
      (WidgetTester tester) async {
        final MockShortGraphQlClient mockShortGraphQlClient =
            MockShortGraphQlClient.withResponse(
          'idToken',
          'endpoint',
          Response(
            json.encode(<String, dynamic>{'error': 'some error occurred'}),
            201,
          ),
        );

        await buildTestWidget(
          tester: tester,
          store: store,
          graphQlClient: mockShortGraphQlClient,
          widget: ServiceRequestsPage(),
        );

        await tester.pumpAndSettle();
        final Finder genericNoDataButton = find.byKey(genericNoDataButtonKey);

        expect(genericNoDataButton, findsOneWidget);

        /// Refresh and expect the same thing
        await tester.ensureVisible(genericNoDataButton);
        await tester.pumpAndSettle();
        await tester.tap(find.byKey(genericNoDataButtonKey));

        await tester.pumpAndSettle();
        expect(genericNoDataButton, findsOneWidget);
      },
    );
    testWidgets(
        'should show a loading indicator when fetching service request count',
        (WidgetTester tester) async {
      final MockShortGraphQlClient mockShortGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{'loading': true}
          }),
          201,
        ),
      );
      store.dispatch(WaitAction<AppState>.add(fetchServiceRequestsCountFlag));
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: mockShortGraphQlClient,
        widget: ServiceRequestsPage(),
      );

      expect(find.byType(PlatformLoader), findsOneWidget);
    });
  });
}
