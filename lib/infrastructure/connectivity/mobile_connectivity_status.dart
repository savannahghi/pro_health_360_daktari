// Dart imports:
import 'dart:async';

// Package imports:
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:healthcloud/infrastructure/connectivity/connectivity_interface.dart';

import 'connectivity_helper.dart';

class MobileConnectivityStatus extends ConnectivityStatus {
  MobileConnectivityStatus({Future<bool> Function()? checkInternetCallback})
      : _hasConnection = false,
        checkInternetCallback = checkInternetCallback ?? checkInternet {
    _connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      if (result != ConnectivityResult.none) {
        checkConnection();
      } else {
        _hasConnection = false;
        _connectionChangeController.add(false);
      }
    });
  }

  late bool _hasConnection;
  final Future<bool> Function() checkInternetCallback;

  final Connectivity _connectivity = Connectivity();

  final StreamController<bool> _connectionChangeController =
      StreamController<bool>.broadcast();

  @override
  Future<bool> checkConnection() async {
    final bool previousConnection = _hasConnection;

    _hasConnection = await checkInternetCallback();

    if (previousConnection != _hasConnection) {
      _connectionChangeController.add(_hasConnection);
    }

    return _hasConnection;
  }

  @override
  Stream<bool> get onConnectivityChanged => _connectionChangeController.stream;
}

MobileConnectivityStatus getConnectivityStatus() => MobileConnectivityStatus();
