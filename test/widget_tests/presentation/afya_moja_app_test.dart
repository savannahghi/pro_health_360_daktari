import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:connectivity_plus_platform_interface/connectivity_plus_platform_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:healthcloud/application/core/services/helpers.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/domain/core/value_objects/app_widget_keys.dart';
import 'package:healthcloud/presentation/core/afya_moja_app.dart';
import 'package:healthcloud/presentation/core/auth_manager.dart';

import '../../mocks/mocks.dart';

void main() {
  FlutterConfig.loadValueForTesting(<String, String>{
    'DEV_SENTRY_DNS': 'test_dev_sentry_dns',
    'PROD_SENTRY_DNS': 'test_prod_sentry_dns',
  });

  group('MyCareHubProfessionalApp', () {
    testWidgets(
      'should render correctly',
      (WidgetTester tester) async {
        final Store<AppState> store =
            Store<AppState>(initialState: AppState.initial());

        await tester.pumpWidget(
          MaterialApp(
            home: Center(
              child: MyCareHubProfessionalApp(
                appSetupData: devAppSetupData,
                store: store,
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();

        final Finder silAppWrapperWidget = find.byType(AppWrapper);
        expect(silAppWrapperWidget, findsOneWidget);

        final Finder preLoadAppWidget = find.byType(AuthManager);
        expect(preLoadAppWidget, findsOneWidget);

        await tester.pumpAndSettle();
        final Finder storeProviderWidget = find.byKey(globalStoreProviderKey);
        expect(storeProviderWidget, findsWidgets);
      },
    );

    testWidgets(
      'AppEntryPoint should not render when paused',
      (WidgetTester tester) async {
        final Store<AppState> store =
            Store<AppState>(initialState: AppState.initial());

        await tester.pumpWidget(
          MaterialApp(
            home: Center(
              child: MyCareHubProfessionalApp(
                appSetupData: devAppSetupData,
                store: store,
              ),
            ),
          ),
        );
        tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.paused);

        await tester.pumpAndSettle();

        final Finder silAppWrapperWidget = find.byType(AppWrapper);
        expect(silAppWrapperWidget, findsOneWidget);

        final Finder preLoadAppWidget = find.byType(AuthManager);
        expect(preLoadAppWidget, findsOneWidget);
        await tester.pumpAndSettle();
      },
    );

    testWidgets('should trigger connectivity changes',
        (WidgetTester tester) async {
      final Store<AppState> store =
          Store<AppState>(initialState: AppState.initial());

      final MockConnectivityPlatform fakePlatform = MockConnectivityPlatform(
        connectivityValues: <ConnectivityResult>[
          ConnectivityResult.none,
          ConnectivityResult.mobile
        ],
      );
      ConnectivityPlatform.instance = fakePlatform;

      await tester.pumpWidget(
        MaterialApp(
          home: MyCareHubProfessionalApp(
            appSetupData: devAppSetupData,
            store: store,
          ),
        ),
      );

      await tester.pump(const Duration(minutes: 5));
    });
  });
}
