// Flutter imports:
// Package imports:
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:bewell_pro_core/presentation/onboarding/login/widgets/onboarding_scaffold.dart';
import 'package:bewell_pro_core/presentation/router/routes.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthcloud/application/core/services/helpers.dart';
// Project imports:
import 'package:healthcloud/application/core/theme/app_themes.dart';
import 'package:healthcloud/application/redux/actions/core/update_user_state_action.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/domain/core/value_objects/global_keys.dart';
import 'package:healthcloud/presentation/router/route_generator.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:shared_themes/app_theme.dart';
import 'package:shared_ui_components/platform_loader.dart';

class AuthManager extends StatefulWidget {
  const AuthManager({
    required this.store,
    required this.appName,
    required this.appContexts,
  });

  final List<AppContext> appContexts;
  final String appName;
  final Store<AppState> store;

  @override
  _AuthManagerState createState() => _AuthManagerState();
}

class _AuthManagerState extends State<AuthManager> with WidgetsBindingObserver {
  FirebaseAnalytics analytics = FirebaseAnalytics();
  BehaviorSubject<String> appInitialRoute = BehaviorSubject<String>();

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.detached) {
      await updateInactivityTime(widget.store);
    } else if (state == AppLifecycleState.resumed) {
      await updateInactivityTime(widget.store);
    }
  }

  @override
  void didChangeDependencies() {
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      Future<dynamic>.delayed(Duration.zero, () async {
        appInitialRoute.add(await getInitialRoute(context: context));
      });
    });

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
  }

  Future<void> updateInactivityTime(Store<AppState> store) async {
    store.dispatch(
      UpdateUserStateAction(
        inActivitySetInTime: DateTime.now().toIso8601String(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: appInitialRoute.stream,
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if (snapshot.data == null) {
          return MaterialApp(
            theme: AppTheme.getAppTheme('flavour'),
            home: const Scaffold(
              body: OnboardingScaffold(
                dimension: 0,
                title: '',
                icon: Icons.security,
                child: Center(child: SILPlatformLoader()),
              ),
            ),
          );
        }

        return MaterialApp(
          theme: afyaMojaProAndroidTheme,
          debugShowCheckedModeBanner: showDebugModeBanner(widget.appContexts),
          navigatorKey: globalAppNavigatorKey,
          navigatorObservers: <NavigatorObserver>[
            SentryNavigatorObserver(),
            FirebaseAnalyticsObserver(analytics: analytics),
          ],
          initialRoute: appInitialRoute.valueOrNull ?? landingPageRoute,
          onGenerateRoute: AppRouterGenerator.generateRoute,
        );
      },
    );
  }
}
