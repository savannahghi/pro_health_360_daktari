import 'package:flutter/widgets.dart';
import 'package:mycarehubpro/infrastructure/connectivity/connectivity_interface.dart';

class ConnectivityCheckerProvider extends InheritedWidget {
  const ConnectivityCheckerProvider({
    Key? key,
    required Widget child,
    required this.connectivityChecker,
  }) : super(key: key, child: child);

  final ConnectivityChecker connectivityChecker;

  static ConnectivityCheckerProvider of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<ConnectivityCheckerProvider>()!;
  }

  @override
  bool updateShouldNotify(ConnectivityCheckerProvider oldWidget) => false;
}
