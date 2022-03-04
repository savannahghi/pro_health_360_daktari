// Package imports:
import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myharehubpro/application/redux/actions/flags/app_flags.dart';
import 'package:myharehubpro/application/redux/states/app_state.dart';

// Project imports:
import 'package:myharehubpro/domain/core/value_objects/app_widget_keys.dart';
import 'package:myharehubpro/presentation/core/app_bar/custom_app_bar.dart';
import 'package:myharehubpro/presentation/core/widgets/platform_loader.dart';
import 'package:myharehubpro/presentation/service_requests/pages/red_flags_page.dart';
import 'package:myharehubpro/presentation/service_requests/widgets/red_flag_list_item.dart';
import 'package:http/http.dart';
import '../../../mocks/mocks.dart';
import '../../../mocks/test_helpers.dart';

void main() {
  group('RedFlagsPage', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
    });
    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: RedFlagsPage(),
      );
      await tester.pumpAndSettle();
      final Finder redFlagItem = find.byType(RedFlagListItem);

      expect(find.byType(CustomAppBar), findsOneWidget);
      expect(redFlagItem, findsOneWidget);
    });
    testWidgets('ScheduleMeetDialog renders correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: RedFlagsPage(),
      );
      await tester.pumpAndSettle();
      final Finder redFlagListItem = find.byType(RedFlagListItem);
      final Finder callButton = find.byKey(dialogCallButtonKey);

      await tester.tap(redFlagListItem.first);
      await tester.pumpAndSettle();

      expect(callButton, findsOneWidget);

      await tester.tap(callButton);
      await tester.pumpAndSettle();
      expect(callButton, findsNothing);
    });
    testWidgets(
      'should show an error widget when fetching red flags',
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
          widget: RedFlagsPage(),
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
    testWidgets('should show a loading indicator when fetching red flags',
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
      store.dispatch(WaitAction<AppState>.add(fetchServiceRequestFlag));
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: mockShortGraphQlClient,
        widget: RedFlagsPage(),
      );

      expect(find.byType(PlatformLoader), findsOneWidget);
    });
  });
}
