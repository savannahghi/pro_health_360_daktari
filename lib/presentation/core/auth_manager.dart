import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:mycarehubpro/application/core/services/custom_client.dart';
import 'package:mycarehubpro/application/core/services/localization.dart';
import 'package:mycarehubpro/application/core/services/utils.dart';
import 'package:mycarehubpro/application/core/theme/app_themes.dart';
import 'package:mycarehubpro/application/redux/actions/check_and_update_connectivity_action.dart';
import 'package:mycarehubpro/application/redux/actions/user_state_actions/check_token_action.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/application/redux/view_models/initial_route_view_model.dart';
import 'package:mycarehubpro/domain/core/entities/core/onboarding_path_info.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';
import 'package:mycarehubpro/domain/core/value_objects/global_keys.dart';
import 'package:mycarehubpro/infrastructure/connectivity/connectivity_interface.dart';
import 'package:mycarehubpro/infrastructure/connectivity/connectivity_provider.dart';
import 'package:mycarehubpro/presentation/core/bottom_nav/bottom_nav_items.dart';
import 'package:mycarehubpro/presentation/core/widgets/error_dialog.dart';
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

class _AuthManagerState extends State<AuthManager> with WidgetsBindingObserver {
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

    final ConnectivityChecker connectivityChecker =
        ConnectivityCheckerProvider.of(context).connectivityChecker;

    StoreProvider.dispatch(
      context,
      CheckAndUpdateConnectivityAction(
        connectivityChecker: connectivityChecker,
      ),
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      final AppState? appState = StoreProvider.state<AppState>(context);

      final bool isSignedIn = appState?.credentials?.isSignedIn ?? false;

      final OnboardingPathInfo navConfig = getOnboardingPath(state: appState ?? AppState.initial());

      if (isSignedIn && navConfig.nextRoute.compareTo(AppRoutes.homePage) == 0) {
        Navigator.pushNamedAndRemoveUntil(
          globalAppNavigatorKey.currentContext!,
          AppRoutes.resumeWithPin,
          (Route<dynamic> route) => false,
        );
      }
    }
  }

  @override
  Widget build(_) {
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
              onShowUserExceptionDialog: (
                BuildContext context,
                UserException userException,
                bool useLocalContext,
              ) {
                showDialog(
                  context: globalAppNavigatorKey.currentContext!,
                  builder: (BuildContext context) {
                    String? subtitle;

                    if (userException.cause != null &&
                        userException.cause?.runtimeType == String) {
                      subtitle = userException.cause! as String;
                    }

                    return ErrorDialog(
                      title: userException.msg ?? defaultUserFriendlyMessage,
                      subTitle: subtitle,
                      buttonAction: () =>
                          globalAppNavigatorKey.currentState?.pop(),
                    );
                  },
                );
              },
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
