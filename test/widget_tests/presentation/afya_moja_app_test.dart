import 'package:async_redux/async_redux.dart';
import 'package:connectivity_plus_platform_interface/connectivity_plus_platform_interface.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:healthcloud/application/core/services/helpers.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/infrastructure/connectivity/mobile_connectivity_status.dart';
import 'package:healthcloud/presentation/core/afya_moja_app.dart';

import '../../mocks/mocks.dart';

void main() {
  group('AfyaMojaApp', () {
    testWidgets('should render widget', (WidgetTester tester) async {
      FlutterConfig.loadValueForTesting(<String, String>{
        'DEV_SENTRY_DNS': 'test_dev_sentry_dns',
        'PROD_SENTRY_DNS': 'test_prod_sentry_dns',
      });

      final Store<AppState> store =
          Store<AppState>(initialState: AppState.initial());

      final MockConnectivityPlatform fakePlatform = MockConnectivityPlatform(
        connectivityValues: <ConnectivityResult>[
          ConnectivityResult.none,
          ConnectivityResult.mobile
        ],
      );
      ConnectivityPlatform.instance = fakePlatform;

      final MobileConnectivityStatus connectivityStatus =
          MobileConnectivityStatus(checkInternetCallback: () async => true);

      await tester.pumpWidget(
        AfyaMojaApp(
          store: store,
          appSetupData: devAppSetupData,
          connectivityStatus: connectivityStatus,
        ),
      );

      expect(find.byType(AfyaMojaApp), findsOneWidget);
    });
  });
}
