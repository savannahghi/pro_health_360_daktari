import 'package:healthcloud/infrastructure/connectivity/connectivity_interface.dart';

ConnectivityStatus getConnectivityStatus() =>
    throw UnsupportedError('dart:io or dart:html must be present');
