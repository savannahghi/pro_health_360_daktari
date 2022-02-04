// Package imports:
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:connectivity_plus_platform_interface/connectivity_plus_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:healthcloud/infrastructure/connectivity/connectivity_interface.dart';
import 'package:healthcloud/infrastructure/connectivity/mobile_connectivity_status.dart';

import '../../../mocks/mocks.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('MobileConnectivityStatus', () {
    MockConnectivityPlatform fakePlatform;

    setUp(() {
      fakePlatform = MockConnectivityPlatform();
      ConnectivityPlatform.instance = fakePlatform;
    });

    test('should check for connection ', () async {
      final ConnectivityStatus connectivityStatus =
          ConnectivityStatus.initial();

      final bool hasConnection = await connectivityStatus.checkConnection();
      expect(hasConnection, true);
    });

    test('onConnectivityChanged emits changes correctly', () {
      fakePlatform = MockConnectivityPlatform(
        connectivityValues: <ConnectivityResult>[
          ConnectivityResult.none,
          ConnectivityResult.mobile
        ],
      );

      ConnectivityPlatform.instance = fakePlatform;

      final MobileConnectivityStatus connectivityStatus =
          MobileConnectivityStatus();

      expectLater(
        connectivityStatus.onConnectivityChanged,
        emitsInOrder(<StreamMatcher>[
          emits(false),
          emits(true),
        ]),
      );
    });
  });
}
