import 'dart:async';

import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthcloud/application/core/services/helpers.dart';
import 'package:healthcloud/application/core/services/localization.dart';
import 'package:healthcloud/application/core/services/utils.dart';
import 'package:healthcloud/application/core/theme/app_themes.dart';
import 'package:healthcloud/application/redux/actions/update_connectivity_action.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/application/redux/view_models/initial_route_view_model.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:healthcloud/domain/core/value_objects/global_keys.dart';
import 'package:healthcloud/infrastructure/connectivity/connectivity_interface.dart';
import 'package:healthcloud/presentation/router/route_generator.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class AuthManager extends StatefulWidget {
  const AuthManager({
    required this.appName,
    required this.appContexts,
    required this.connectivityStatus,
  });

  final List<AppContext> appContexts;
  final String appName;
  final ConnectivityStatus connectivityStatus;

  @override
  _AuthManagerState createState() => _AuthManagerState();
}

class _AuthManagerState extends State<AuthManager> {
  StreamSubscription<bool>? _connectivitySub;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _connectivitySub = widget.connectivityStatus
          .checkConnection()
          .asStream()
          .mergeWith(
            <Stream<bool>>[widget.connectivityStatus.onConnectivityChanged],
          )
          .distinct()
          .listen((bool hasConnection) {
            connectivityChanged(hasConnection: hasConnection);
          });
    });
  }

  @override
  void dispose() {
    _connectivitySub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, InitialRouteViewModel>(
      converter: (Store<AppState> store) =>
          InitialRouteViewModel.fromStore(store.state),
      builder: (BuildContext context, InitialRouteViewModel vm) {
        return MaterialApp(
          theme: AppTheme.getAppTheme(),
          debugShowCheckedModeBanner: showDebugModeBanner(widget.appContexts),
          navigatorKey: globalAppNavigatorKey,
          navigatorObservers: <NavigatorObserver>[
            SentryNavigatorObserver(),
            FirebaseAnalyticsObserver(analytics: FirebaseAnalytics()),
          ],
          initialRoute: vm.initialRoute,
          onGenerateRoute: RouteGenerator.generateRoute,
          localizationsDelegates: localizationDelegates,
          supportedLocales: locales,
        );
      },
    );
  }

  void connectivityChanged({required bool hasConnection}) {
    StoreProvider.dispatch<AppState>(
      context,
      UpdateConnectivityAction(hasConnection: hasConnection),
    );

    if (!hasConnection) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: const Text(connectionLostText),
            duration: const Duration(seconds: 5),
            action: dismissSnackBar(closeString, Colors.white, context),
          ),
        );
    }
  }
}
