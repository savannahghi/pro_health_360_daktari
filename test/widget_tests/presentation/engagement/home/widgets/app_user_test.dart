// Dart imports:
import 'dart:io';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/entities.dart';
import 'package:domain_objects/value_objects.dart';
// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
// Project imports:
import 'package:healthcloud/application/redux/actions/update_user_profile_action.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/domain/core/value_objects/app_widget_keys.dart';
import 'package:healthcloud/presentation/engagement/home/widgets/appbar_user.dart';

import '../../../../../mock_image_http_client.dart';
import '../../../../../mocks/test_helpers.dart';
import '../../../../../test_utils.dart';

void main() {
  group('AppbarUser', () {
    late Store<AppState> store;

    setUp(() {
      final String dir = Directory.current.path;
      store = Store<AppState>(initialState: AppState.initial());
      HttpOverrides.global = TestHttpOverrides();
      store.dispatch(
        UpdateUserProfileAction(
          profile: UserProfile(
            photoUploadID: '$dir/test/test_resources/test_file.png',
          ),
        ),
      );

      store.dispatch(
        UpdateUserProfileAction(
          userBioData: BioData(
            firstName: Name.withValue('Test'),
            lastName: Name.withValue('Name'),
          ),
          profile: UserProfile(
            primaryPhoneNumber: PhoneNumber.withValue('+254728101710'),
            primaryEmailAddress: EmailAddress.withValue('s@g.com'),
          ),
        ),
      );
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

      await fireEvent(tester);

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
      store.dispatch(
        UpdateUserProfileAction(
          profile: UserProfile(photoUploadID: ''),
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
