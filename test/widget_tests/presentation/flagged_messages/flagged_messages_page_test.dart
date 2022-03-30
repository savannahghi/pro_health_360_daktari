// Flutter imports:
// Package imports:
import 'dart:convert';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mycarehubpro/application/redux/actions/flags/app_flags.dart';
import 'package:mycarehubpro/application/redux/actions/update_connectivity_action.dart';
// Project imports:
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_widget_keys.dart';
import 'package:mycarehubpro/presentation/flagged_messages/pages/flagged_messages_page.dart';
import 'package:mycarehubpro/presentation/flagged_messages/widgets/flagged_messages_list_item.dart';

import '../../../mocks/mocks.dart';
import '../../../mocks/test_helpers.dart';

void main() {
  group('Flagged Messages Page', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets('renders correctly', (WidgetTester tester) async {
      store.dispatch(UpdateConnectivityAction(hasConnection: true));
      await buildTestWidget(
        tester: tester,
        store: store,
        widget: Builder(
          builder: (BuildContext context) {
            return StoreProvider<AppState>(
              store: store,
              child: const FlaggedMessagesPage(
                communityId: '',
                communityName: 'test',
              ),
            );
          },
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text(flaggedMessagesString), findsOneWidget);
      expect(find.text(flaggedMessagesDescription), findsOneWidget);
      expect(find.byType(FlaggedMessagesListItem), findsWidgets);

      await tester.tap(find.byKey(const Key('delete_message_${0}_key')));
      await tester.pumpAndSettle();
      expect(
        find.byType(SnackBar, skipOffstage: false),
        findsOneWidget,
      );
      expect(find.text(messageDeletedText), findsOneWidget);

      await tester.tap(find.byKey(const Key('ban_user_${0}_key')));
      await tester.pumpAndSettle();
      expect(
        find.byType(SnackBar, skipOffstage: false),
        findsOneWidget,
      );
      expect(
        find.text(
          userBannedMessage(
            communityName: 'test',
          ),
        ),
        findsOneWidget,
      );

      await tester.tap(find.byKey(const Key('ban_user_${0}_key')));
      await tester.pumpAndSettle();
      expect(
        find.byType(SnackBar, skipOffstage: false),
        findsOneWidget,
      );
      expect(
        find.text(
          userBannedMessage(
            isBanned: true,
            communityName: 'test',
          ),
        ),
        findsOneWidget,
      );

      store.dispatch(UpdateConnectivityAction(hasConnection: false));
      await tester.tap(find.byKey(const Key('delete_message_${0}_key')));
      await tester.pumpAndSettle();
      expect(
        find.byType(SnackBar, skipOffstage: false),
        findsOneWidget,
      );
      expect(find.text(connectionLostText), findsOneWidget);
    });

    testWidgets('display error if there no internet connection',
        (WidgetTester tester) async {
      store.dispatch(UpdateConnectivityAction(hasConnection: false));
      await buildTestWidget(
        tester: tester,
        store: store,
        widget: Builder(
          builder: (BuildContext context) {
            return StoreProvider<AppState>(
              store: store,
              child: const FlaggedMessagesPage(
                communityId: '',
                communityName: '',
              ),
            );
          },
        ),
      );

      await tester.pumpAndSettle();
      expect(find.byType(ScaffoldMessenger), findsOneWidget);
    });

    testWidgets(
      'should show GenericErrorWidget when there is no data',
      (WidgetTester tester) async {
        final MockShortGraphQlClient mockShortGraphQlClient =
            MockShortGraphQlClient.withResponse(
          'idToken',
          'endpoint',
          Response(
            json.encode(<String, dynamic>{
              'data': <String, dynamic>{'listFlaggedMessages': <dynamic>[]}
            }),
            201,
          ),
        );

        await buildTestWidget(
          tester: tester,
          graphQlClient: mockShortGraphQlClient,
          widget: const FlaggedMessagesPage(
            communityId: '',
            communityName: '',
          ),
        );
        await tester.pumpAndSettle();

        final Finder genericNoDataButton = find.byKey(helpNoDataWidgetKey);

        expect(genericNoDataButton, findsOneWidget);
        await tester.tap(genericNoDataButton);
        expect(genericNoDataButton, findsOneWidget);
      },
    );

    testWidgets('Shows loading indicator when fetching members',
        (WidgetTester tester) async {
      store.dispatch(WaitAction<AppState>.add(fetchFlaggedMessagesFlag));

      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: const FlaggedMessagesPage(
          communityId: '',
          communityName: '',
        ),
      );

      expect(find.byType(PlatformLoader), findsOneWidget);
    });
  });
}
