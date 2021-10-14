// Flutter imports:

import 'package:flutter/foundation.dart';

// Package imports:
import 'package:app_wrapper/app_wrapper.dart';
import 'package:quiver/core.dart';

/// Contains the initial data required to initialize the app.
class AppSetupData {
  /// The context in which the app is running on. Can be either text, demo, prod
  /// or e2e
  List<AppContext> appContexts;

  /// The sentry DNS for error logging.
  /// For demo and prod, we return the prod sentry DNS
  /// For test and e2e we return the test sentry DNS
  String sentryDNS;

  // Custom context for setting up different endpoints
  final BaseContext? customContext;

  AppSetupData({
    required this.appContexts,
    required this.sentryDNS,
    this.customContext,
  });

  @override
  bool operator ==(Object o) =>
      o is AppSetupData &&
      listEquals(appContexts, o.appContexts) &&
      o.sentryDNS == this.sentryDNS;

  @override
  int get hashCode => hash2(hashObjects(appContexts), sentryDNS);
}
