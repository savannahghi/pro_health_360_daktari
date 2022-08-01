// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/services.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:prohealth360_daktari/application/core/services/analytics_service.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

// Project imports:
import 'package:prohealth360_daktari/application/core/services/app_setup_data.dart';
import 'package:prohealth360_daktari/application/core/services/helpers.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/global_keys.dart';
import 'package:prohealth360_daktari/infrastructure/repository/database_base.dart';
import 'package:prohealth360_daktari/infrastructure/repository/database_state_persistor.dart';
import 'package:prohealth360_daktari/presentation/core/mycarehub_pro_app.dart';
import 'package:prohealth360_daktari/presentation/core/widgets/unrecoverable_error_widget.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

/// Responsible for putting together everything that the app needs in order
/// to run safely.
///
/// It is like a small preflight check
///
/// The following are initialized
///
/// - An initial Firebase instance
/// - The app state
/// - The navigator key used for navigation
/// - The sentry client for error logging
Future<void> initApp(List<AppContext> appContexts) async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();

  await Firebase.initializeApp();

  await SystemChrome.setPreferredOrientations(
    <DeviceOrientation>[DeviceOrientation.portraitUp],
  );

  NavigateAction.setNavigatorKey(globalAppNavigatorKey);

  final AppSetupData appSetupData = getAppSetupData(appContexts.last);

  final MyCareHubProfessionalStateDatabase stateDB =
      MyCareHubProfessionalStateDatabase(dataBaseName: DatabaseName);

  await stateDB.init();

  final AppState initialState = await stateDB.readState();

  /// initialize a fresh database if [initialState] is `null`,
  /// and populate the database with the default values for each state
  if (initialState == AppState.initial()) {
    await stateDB.saveInitialState(initialState);
  }

  final Store<AppState> store = Store<AppState>(
    initialState: initialState,
    persistor: PersistorPrinterDecorator<AppState>(stateDB),
    defaultDistinct: true,
  );

  final StreamChatClient streamClient = StreamChatClient(
    appSetupData.streamAPIKey,
    logLevel: Level.ALL,
  );

  /// Configures which error widget to show depending  on whether the app is
  /// in debug or release mode.
  ErrorWidget.builder = (FlutterErrorDetails details) {
    bool inDebug = false;
    assert(
      () {
        inDebug = true;
        return true;
      }(),
    );
    // In debug mode, use the normal error widget which shows
    if (inDebug) {
      return ErrorWidget(details.exception);
    }
    // In release builds, show error image
    return const UnrecoverableErrorWidget();
  };

  await Firebase.initializeApp();

  await AnalyticsService().init(
    environment: describeEnum(appSetupData.appContexts.first),
  );
  runZonedGuarded(
    () async {
      await SentryFlutter.init(
        (SentryFlutterOptions options) {
          options
            ..dsn = appSetupData.sentryDNS
            ..diagnosticLevel = SentryLevel.error;
        },
        appRunner: () => runApp(
          MyCareHubProApp(
            store: store,
            appSetupData: appSetupData,
            streamClient: streamClient,
            analyticsObserver: AnalyticsService().getAnalyticsObserver(),
          ),
        ),
      );

      FlutterError.onError = (FlutterErrorDetails details) {
        FlutterError.presentError(details);
        Sentry.captureException(details.exceptionAsString());
      };
    },
    (Object exception, StackTrace stackTrace) async {
      await Sentry.captureException(exception, stackTrace: stackTrace);
    },
  );
}
