// Dart imports:
import 'dart:io';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:firebase_core/firebase_core.dart';
// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prohealth360_daktari/application/redux/actions/core/update_user_action.dart';
// Project imports:
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/entities/core/user.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/engagement/home/widgets/appbar_user.dart';

import '../../../../../mock_image_http_client.dart';
import '../../../../../mocks/mocks.dart';
import '../../../../../mocks/test_helpers.dart';

void main() {
  group('AppBarUser', () {
    late Store<AppState> store;

    setUp(() async {
      store = Store<AppState>(initialState: AppState.initial());
      HttpOverrides.global = TestHttpOverrides();
      setupFirebaseAnalyticsMocks();
      await Firebase.initializeApp();
    });

    testWidgets('should render AppBarUSer widget correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        widget: Builder(
          builder: (BuildContext context) {
            return StoreProvider<AppState>(
              store: store,
              child: const AppbarUser(),
            );
          },
        ),
      );

      await tester.pump();

      final Finder silAppBarGestureString = find.byKey(appBarUserKey);
      expect(find.byType(AppbarUser), findsOneWidget);
      expect(silAppBarGestureString, findsOneWidget);

      await tester.tap(silAppBarGestureString);
      await tester.pumpAndSettle();
    });

    testWidgets('should render AppBarUSer widget with a photo URL',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        widget: Builder(
          builder: (BuildContext context) {
            return StoreProvider<AppState>(
              store: store,
              child: const AppbarUser(),
            );
          },
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(AppbarUser), findsOneWidget);
    });

    testWidgets('should render AppBarUSer widget with a initials',
        (WidgetTester tester) async {
      final String dir = Directory.current.path;
      store.dispatch(
        UpdateUserAction(
          user: User.initial().copyWith(
            avatar: '$dir/test/test_resources/test_file.png',
            name: 'Test Name',
          ),
        ),
      );
      await buildTestWidget(
        tester: tester,
        store: store,
        widget: Builder(
          builder: (BuildContext context) {
            return StoreProvider<AppState>(
              store: store,
              child: const AppbarUser(),
            );
          },
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(AppbarUser), findsOneWidget);
    });
  });
}
