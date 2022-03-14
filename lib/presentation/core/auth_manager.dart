import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:mycarehubpro/application/core/services/custom_client.dart';
import 'package:mycarehubpro/application/core/services/localization.dart';
import 'package:mycarehubpro/application/core/theme/app_themes.dart';
import 'package:mycarehubpro/application/redux/actions/user_state_actions/check_token_action.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/application/redux/view_models/initial_route_view_model.dart';
import 'package:mycarehubpro/domain/core/value_objects/global_keys.dart';
import 'package:mycarehubpro/presentation/core/bottom_nav/bottom_nav_items.dart';
import 'package:mycarehubpro/presentation/router/route_generator.dart';
import 'package:mycarehubpro/presentation/router/routes.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class AuthManager extends StatefulWidget {
  const AuthManager({
    required this.appName,
    required this.appContexts,
    required this.streamClient,
  });

  final List<AppContext> appContexts;
  final String appName;
  final StreamChatClient streamClient;

  @override
  _AuthManagerState createState() => _AuthManagerState();
}

class _AuthManagerState extends State<AuthManager> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((_) async {
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
        String initialRoute = vm.initialRoute ?? AppRoutes.loginPage;

        final bool isPhoneLogin =
            initialRoute.compareTo(AppRoutes.loginPage) == 0;

        if (!isPhoneLogin) {
          initialRoute = bottomNavItems[vm.currentIndex ?? 0].onTapRoute;
        }

        return MaterialApp(
          builder: (BuildContext context, Widget? childWidget) {
            return UserExceptionDialog<AppState>(
              child: StreamChat(
                client: widget.streamClient,
                streamChatThemeData: StreamChatThemeData(
                  channelHeaderTheme: const ChannelHeaderThemeData(),
                ),
                child: childWidget,
              ),
            );
          },
          theme: AppTheme.getAppTheme(),
          debugShowCheckedModeBanner: false,
          navigatorKey: globalAppNavigatorKey,
          navigatorObservers: <NavigatorObserver>[
            SentryNavigatorObserver(),
          ],
          initialRoute: initialRoute,
          onGenerateRoute: RouteGenerator.generateRoute,
          localizationsDelegates: localizationDelegates,
          supportedLocales: locales,
        );
      },
    );
  }
}
