import 'dart:convert';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mycarehubpro/application/redux/actions/flags/app_flags.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_widget_keys.dart';
import 'package:mycarehubpro/presentation/community/group_info/widgets/member_list_actions_dialog.dart';

import '../../../mocks/mocks.dart';
import '../../../mocks/test_helpers.dart';

void main() {
  group('MemberListActionsDialog', () {
    late IGraphQlClient client;

    setUp(() {
      client = MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          jsonEncode(<String, dynamic>{
            'data': <String, bool>{'addModerators': true}
          }),
          200,
        ),
      );
    });

    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        widget: Builder(
          builder: (BuildContext context) {
            return GestureDetector(
              onTap: () => showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const MemberListActionsDialog(
                    memberID: '',
                    communityId: '',
                    memberName: '',
                    communityName: '',
                  );
                },
              ),
            );
          },
        ),
      );
      expect(find.byType(GestureDetector), findsOneWidget);
      await tester.tap(find.byType(GestureDetector));
      await tester.pumpAndSettle();

      expect(find.byType(Dialog), findsOneWidget);
      expect(find.byType(MyAfyaHubPrimaryButton), findsNWidgets(3));

      expect(find.byKey(promoteButtonKey), findsOneWidget);
      expect(find.byKey(banButtonKey), findsOneWidget);
      expect(find.byKey(removeButtonKey), findsOneWidget);
    });

    testWidgets('promote button works correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        graphQlClient: client,
        widget: Builder(
          builder: (BuildContext context) {
            return GestureDetector(
              onTap: () => showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const MemberListActionsDialog(
                    memberID: '',
                    communityId: '',
                    memberName: '',
                    communityName: '',
                  );
                },
              ),
            );
          },
        ),
      );

      expect(find.byType(GestureDetector), findsOneWidget);

      await tester.tap(find.byType(GestureDetector));
      await tester.pumpAndSettle();
      expect(find.byType(Dialog), findsOneWidget);

      final Finder promoteKeyFinder = find.byKey(promoteButtonKey);
      expect(promoteKeyFinder, findsOneWidget);

      await tester.tap(promoteKeyFinder);
      await tester.pumpAndSettle();

      expect(find.text('Successfully promoted to admin'), findsOneWidget);
    });

    testWidgets('ban button works correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        graphQlClient: MockTestGraphQlClient(),
        widget: Builder(
          builder: (BuildContext context) {
            return GestureDetector(
              onTap: () => showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const MemberListActionsDialog(
                    memberID: 'test',
                    communityId: 'test',
                    communityName: 'test',
                    memberName: '',
                  );
                },
              ),
            );
          },
        ),
      );

      expect(find.byType(GestureDetector), findsOneWidget);
      await tester.tap(find.byType(GestureDetector));
      await tester.pumpAndSettle();

      expect(find.byType(Dialog), findsOneWidget);

      final Finder banButtonKeyFinder = find.byKey(banButtonKey);
      expect(banButtonKeyFinder, findsOneWidget);

      await tester.tap(banButtonKeyFinder);
      await tester.pumpAndSettle();

      expect(find.byType(SnackBar, skipOffstage: false), findsOneWidget);
    });
    testWidgets('should show snackbar with error message when an error occurs',
        (WidgetTester tester) async {
      final MockShortGraphQlClient mockShortGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{'error': 'some error occurred'}),
          400,
        ),
      );

      await buildTestWidget(
        tester: tester,
        graphQlClient: mockShortGraphQlClient,
        widget: Builder(
          builder: (BuildContext context) {
            return GestureDetector(
              onTap: () => showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const MemberListActionsDialog(
                    memberID: 'test',
                    communityId: 'test',
                    communityName: 'test',
                    memberName: '',
                  );
                },
              ),
            );
          },
        ),
      );

      expect(find.byType(GestureDetector), findsOneWidget);
      await tester.tap(find.byType(GestureDetector));
      await tester.pumpAndSettle();

      expect(find.byType(Dialog), findsOneWidget);

      final Finder banButtonKeyFinder = find.byKey(banButtonKey);
      expect(banButtonKeyFinder, findsOneWidget);

      await tester.tap(banButtonKeyFinder);
      await tester.pumpAndSettle();

      expect(find.byType(SnackBar, skipOffstage: false), findsOneWidget);
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
      await buildTestWidget(
        tester: tester,
        graphQlClient: mockShortGraphQlClient,
        widget: Builder(
          builder: (BuildContext context) {
            return GestureDetector(
              onTap: () => showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const MemberListActionsDialog(
                    memberID: '',
                    communityId: '',
                    memberName: '',
                    communityName: '',
                  );
                },
              ),
            );
          },
        ),
      );

      expect(find.byType(GestureDetector), findsOneWidget);
      await tester.tap(find.byType(GestureDetector));
      await tester.pumpAndSettle();

      expect(find.byType(Dialog), findsOneWidget);

      final Finder banButtonKeyFinder = find.byKey(banButtonKey);
      expect(banButtonKeyFinder, findsOneWidget);

      await tester.tap(banButtonKeyFinder);
      await tester.pumpAndSettle();

      expect(find.byType(SnackBar, skipOffstage: false), findsOneWidget);
    });
    testWidgets('ban button should be replaced by a loading indicator',
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

      final Store<AppState> store =
          Store<AppState>(initialState: AppState.initial());

      store.dispatch(WaitAction<AppState>.add(banUserFlag));

      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: mockShortGraphQlClient,
        widget: Builder(
          builder: (BuildContext context) {
            return GestureDetector(
              onTap: () => showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const MemberListActionsDialog(
                    memberID: 'test',
                    communityId: 'test',
                    communityName: 'test',
                    memberName: '',
                  );
                },
              ),
            );
          },
        ),
      );
      expect(find.byType(GestureDetector), findsOneWidget);
      await tester.tap(find.byType(GestureDetector));
      await tester.pump();
      expect(find.byType(PlatformLoader), findsOneWidget);
    });

    testWidgets('remove button works correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        graphQlClient: MockTestGraphQlClient(),
        widget: Builder(
          builder: (BuildContext context) {
            return GestureDetector(
              onTap: () => showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const MemberListActionsDialog(
                    memberID: '',
                    communityId: '',
                    memberName: '',
                    communityName: '',
                  );
                },
              ),
            );
          },
        ),
      );

      expect(find.byType(GestureDetector), findsOneWidget);
      await tester.tap(find.byType(GestureDetector));
      await tester.pumpAndSettle();

      expect(find.byType(Dialog), findsOneWidget);

      final Finder removeButtonKeyFinder = find.byKey(removeButtonKey);
      expect(removeButtonKeyFinder, findsOneWidget);

      await tester.tap(removeButtonKeyFinder);
      await tester.pumpAndSettle();

      expect(find.byType(SnackBar, skipOffstage: false), findsOneWidget);
    });

    testWidgets('remove button shows snackbar correctly if api has an error',
        (WidgetTester tester) async {
      final MockShortGraphQlClient mockShortSILGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'message': '4: error',
            }
          }),
          200,
        ),
      );
      await buildTestWidget(
        tester: tester,
        graphQlClient: mockShortSILGraphQlClient,
        widget: Builder(
          builder: (BuildContext context) {
            return GestureDetector(
              onTap: () => showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const MemberListActionsDialog(
                    memberID: '',
                    communityId: '',
                    memberName: '',
                    communityName: '',
                  );
                },
              ),
            );
          },
        ),
      );

      expect(find.byType(GestureDetector), findsOneWidget);
      await tester.tap(find.byType(GestureDetector));
      await tester.pumpAndSettle();

      expect(find.byType(Dialog), findsOneWidget);

      final Finder removeButtonKeyFinder = find.byKey(removeButtonKey);
      expect(removeButtonKeyFinder, findsOneWidget);

      await tester.tap(removeButtonKeyFinder);
      await tester.pumpAndSettle();

      expect(find.byType(SnackBar, skipOffstage: false), findsOneWidget);
    });
  });
}
