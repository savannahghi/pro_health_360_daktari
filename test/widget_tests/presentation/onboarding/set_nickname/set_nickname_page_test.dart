import 'dart:io';

import 'package:async_redux/async_redux.dart';
import 'package:connectivity_plus_platform_interface/connectivity_plus_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:healthcloud/application/redux/actions/update_connectivity_action.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:healthcloud/domain/core/value_objects/app_widget_keys.dart';
import 'package:healthcloud/infrastructure/connectivity/mobile_connectivity_status.dart';
import 'package:healthcloud/presentation/engagement/home/pages/home_page.dart';
import 'package:healthcloud/presentation/onboarding/set_nickname/set_nickname_page.dart';

import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  group('SetNicknamePage', () {
    late Store<AppState> store;
    late MobileConnectivityStatus connectivityStatus;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
      HttpOverrides.global = null;
      store.dispatch(UpdateConnectivityAction(hasConnection: true));
      final MockConnectivityPlatform fakePlatform = MockConnectivityPlatform();
      ConnectivityPlatform.instance = fakePlatform;

      connectivityStatus = MobileConnectivityStatus(
        checkInternetCallback: () async => true,
      );
    });

    testWidgets('should navigate after inputing nickname',
        (WidgetTester tester) async {
      store.dispatch(UpdateConnectivityAction(hasConnection: true));
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: SetNickNamePage(
          connectivityStatus: connectivityStatus,
        ),
      );

      final Finder inputKey = find.byKey(nameInputKey);
      expect(inputKey, findsOneWidget);

      await tester.enterText(inputKey, 'test');
      await tester.pumpAndSettle();

      final Finder continueBtn = find.byKey(continueKey);
      await tester.tap(continueBtn);
      await tester.pumpAndSettle();

      expect(find.byType(HomePage), findsOneWidget);
    });

    testWidgets('should show internet error', (WidgetTester tester) async {
      store.dispatch(UpdateConnectivityAction(hasConnection: false));
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: SetNickNamePage(
          connectivityStatus: MobileConnectivityStatus(
            checkInternetCallback: () async => false,
          ),
        ),
      );

      final Finder inputKey = find.byKey(nameInputKey);
      expect(inputKey, findsOneWidget);

      await tester.enterText(inputKey, 'test');
      await tester.pumpAndSettle();

      final Finder continueBtn = find.byKey(continueKey);
      await tester.tap(continueBtn);
      await tester.pumpAndSettle();

      expect(find.text(noInternetConnection), findsOneWidget);
    });
  });
}
