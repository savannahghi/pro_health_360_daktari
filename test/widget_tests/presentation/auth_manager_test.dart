import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:connectivity_plus_platform_interface/connectivity_plus_platform_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:healthcloud/application/core/services/custom_client.dart';
import 'package:healthcloud/application/core/services/helpers.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/domain/core/value_objects/app_contexts.dart';
import 'package:healthcloud/presentation/core/auth_manager.dart';
import 'package:healthcloud/presentation/router/route_generator.dart';

import '../../mocks/mocks.dart';
import '../application/redux/actions/user_state_actions/check_token_action_test.dart';

void main() {
  group('Authmanager', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      FlutterConfig.loadValueForTesting(<String, String>{
        'DEV_SENTRY_DNS': 'test_dev_sentry_dns',
        'PROD_SENTRY_DNS': 'test_prod_sentry_dns',
      });

      final MockConnectivityPlatform fakePlatform = MockConnectivityPlatform(
        connectivityValues: <ConnectivityResult>[
          ConnectivityResult.none,
          ConnectivityResult.mobile
        ],
      );
      ConnectivityPlatform.instance = fakePlatform;

      final Store<AppState> store =
          Store<AppState>(initialState: AppState.initial());

      late CustomClient customClient;

      await tester.pumpWidget(
        StoreProvider<AppState>(
          store: store,
          child: Builder(
            builder: (BuildContext context) {
              customClient = MockCustomClient(
                '',
                '',
                refreshTokenEndpoint: '',
                userID: '',
                context: context,
              );
              return AppWrapper(
                appName: 'test',
                appContexts: testAppContexts,
                baseContext: devAppSetupData.customContext,
                graphQLClient: customClient,
                child: const MaterialApp(
                  onGenerateRoute: RouteGenerator.generateRoute,
                  home: AuthManager(
                    appName: 'test',
                    appContexts: testAppContexts,
                  ),
                ),
              );
            },
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.byType(AuthManager), findsOneWidget);
    });
  });
}
