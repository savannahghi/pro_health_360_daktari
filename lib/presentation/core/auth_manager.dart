import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:healthcloud/application/core/services/custom_client.dart';
import 'package:healthcloud/application/core/services/helpers.dart';
import 'package:healthcloud/application/core/services/localization.dart';
import 'package:healthcloud/application/core/theme/app_themes.dart';
import 'package:healthcloud/application/redux/actions/user_state_actions/check_token_action.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/application/redux/view_models/initial_route_view_model.dart';
import 'package:healthcloud/domain/core/value_objects/global_keys.dart';
import 'package:healthcloud/presentation/router/route_generator.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class AuthManager extends StatefulWidget {
  const AuthManager({
    required this.appName,
    required this.appContexts,
  });

  final List<AppContext> appContexts;
  final String appName;

  @override
  _AuthManagerState createState() => _AuthManagerState();
}

class _AuthManagerState extends State<AuthManager> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      StoreProvider.dispatch(
        context,
        CheckTokenAction(
          httpClient: AppWrapperBase.of(context)!.graphQLClient as CustomClient,
          refreshTokenEndpoint:
              AppWrapperBase.of(context)!.customContext!.refreshTokenEndpoint,
        ),
      );
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    StoreProvider.dispatch(
      context,
      CheckTokenAction(
        httpClient: AppWrapperBase.of(context)!.graphQLClient as CustomClient,
        refreshTokenEndpoint:
            AppWrapperBase.of(context)!.customContext!.refreshTokenEndpoint,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, InitialRouteViewModel>(
      converter: (Store<AppState> store) =>
          InitialRouteViewModel.fromStore(store.state),
      builder: (BuildContext context, InitialRouteViewModel vm) {
        return MaterialApp(
          builder: (BuildContext context, Widget? child) {
            return UserExceptionDialog<AppState>(child: child!);
          },
          theme: AppTheme.getAppTheme(),
          debugShowCheckedModeBanner: showDebugModeBanner(widget.appContexts),
          navigatorKey: globalAppNavigatorKey,
          navigatorObservers: <NavigatorObserver>[
            SentryNavigatorObserver(),
          ],
          initialRoute: vm.initialRoute,
          onGenerateRoute: RouteGenerator.generateRoute,
          localizationsDelegates: localizationDelegates,
          supportedLocales: locales,
        );
      },
    );
  }
}
