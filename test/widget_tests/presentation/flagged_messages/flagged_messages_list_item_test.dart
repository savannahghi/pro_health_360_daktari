// Flutter imports:
// Package imports:

import 'dart:convert';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
// Project imports:
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/application/redux/view_models/flagged_messages/flagged_messages_view_model.dart';
import 'package:mycarehubpro/presentation/flagged_messages/widgets/flagged_messages_list_item.dart';

import '../../../mocks/mocks.dart';
import '../../../mocks/test_helpers.dart';

void main() {
  group('Flagged Messages List Item', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets(
        'should show snackbar with error message when an when banUserStatus in not true',
        (WidgetTester tester) async {
      final MockShortGraphQlClient mockShortGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{'banUser': null}
          }),
          201,
        ),
      );

      const Key banUserKey = Key('ban_user_key');
      await buildTestWidget(
        tester: tester,
        graphQlClient: mockShortGraphQlClient,
        widget: Builder(
          builder: (BuildContext context) {
            return Builder(
              builder: (BuildContext context) {
                return FlaggedMessagesListItem(
                  vm: FlaggedMessagesViewModel.fromStore(store),
                  memberID: '',
                  communityId: '',
                  communityName: '',
                  createdAt: '',
                  textMessage: '',
                  name: '',
                  banUserKey: banUserKey,
                );
              },
            );
          },
        ),
      );

      final Finder banButtonKeyFinder = find.byKey(banUserKey);
      expect(banButtonKeyFinder, findsOneWidget);

      await tester.tap(banButtonKeyFinder);
      await tester.pumpAndSettle();

      expect(find.byType(SnackBar, skipOffstage: false), findsOneWidget);
      expect(find.text(getErrorMessage()), findsOneWidget);
    });

    testWidgets(
        'should show snackbar with error message when an when unBanUserStatus in not true',
        (WidgetTester tester) async {
      final MockShortGraphQlClient mockShortGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{'unBanUser': null}
          }),
          201,
        ),
      );

      const Key unBanUserKey = Key('un_ban_user_key');
      await buildTestWidget(
        tester: tester,
        graphQlClient: mockShortGraphQlClient,
        widget: Builder(
          builder: (BuildContext context) {
            return Builder(
              builder: (BuildContext context) {
                return FlaggedMessagesListItem(
                  vm: FlaggedMessagesViewModel.fromStore(store),
                  memberID: '',
                  communityId: '',
                  communityName: '',
                  createdAt: '',
                  textMessage: '',
                  name: '',
                  banUserKey: unBanUserKey,
                  isBanned: true,
                );
              },
            );
          },
        ),
      );

      final Finder banButtonKeyFinder = find.byKey(unBanUserKey);
      expect(banButtonKeyFinder, findsOneWidget);

      await tester.tap(banButtonKeyFinder);
      await tester.pumpAndSettle();

      expect(find.byType(SnackBar, skipOffstage: false), findsOneWidget);
      expect(find.text(getErrorMessage()), findsOneWidget);
    });
  });
}
