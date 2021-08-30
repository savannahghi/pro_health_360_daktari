import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/infrastructure/endpoints.dart';
import 'package:healthcloud/infrastructure/repository/database_base.dart';
import 'package:healthcloud/infrastructure/repository/database_state_persistor.dart';
import 'package:healthcloud/presentation/core/afya_moja_app.dart';
import 'package:bewell_pro_core/domain/core/value_objects/domain_constants.dart';
import 'package:bewell_pro_core/presentation/core/widgets/unrecoverable_error_widget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:app_wrapper/app_wrapper.dart';

import 'app_setup_data.dart';
import 'helpers.dart';

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

  await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);

  NavigateAction.setNavigatorKey(globalAppNavigatorKey);

  final AppSetupData appSetupData = getAppSetupData(appContexts.last);

  final AfyaMojaStateDatabase stateDB =
      AfyaMojaStateDatabase(dataBaseName: DatabaseName);

  await stateDB.init();

  final AppState initialState = await stateDB.readState();

  /// initialize a fresh database if [initialState] is `null`,
  /// and populate the database with the default values for each state
  if (initialState == AppState.initial()) {
    await stateDB.saveInitialState(initialState);
  }

  final Store<CoreState> store = Store<CoreState>(
    initialState: initialState,
    persistor: PersistorPrinterDecorator<AppState>(stateDB),
    defaultDistinct: true,
  );

  /// Configures which error widget to show depending  on weather the app is in debug or release mode.
  ///
  /// Shows an error image (spaceman) with a prompt to call tech-support in release mode
  ErrorWidget.builder = (FlutterErrorDetails details) {
    bool inDebug = false;
    assert(() {
      inDebug = true;
      return true;
    }());
    // In debug mode, use the normal error widget which shows
    if (inDebug) {
      return ErrorWidget(details.exception);
    }
    // In release builds, show error image
    return const UnrecoverableErrorWidget();
  };

  runZonedGuarded(() async {
    await SentryFlutter.init(
      (SentryFlutterOptions options) {
        options
          ..dsn = appSetupData.sentryDNS
          ..diagnosticLevel = SentryLevel.error;
      },
      appRunner: () => runApp(
        AfyaMojaApp(
          store: store,
          appContexts: appSetupData.appContexts,
          customContext: const BaseContext(
            graphqlEndpoint: testGraphqlEndpoint,
            anonymousLoginEndpoint: testAnonymousLoginEndpoint,
            createUserByPhoneEndpoint: testCreateUserByPhoneEndpoint,
            loginByPhoneEndpoint: testLoginByPhoneEndpoint,
            pinResetEndpoint: testPinResetEndpoint,
            refreshTokenEndpoint: testRefreshTokenEndpoint,
            retryResendOtpEndpoint: testRetryResendOtpEndpoint,
            sendContactVerificationOTPEndpoint:
                testSendContactVerificationOTPEndpoint,
            sendRecoverAccountOtpEndpoint: testSendRecoverAccountOtpEndpoint,
            setPrimaryPhoneNumberEndpoint: testSetPrimaryPhoneNumberEndpoint,
            userRecoveryPhoneNumbersEndpoint:
                testUserRecoveryPhoneNumbersEndpoint,
            updateUserPinEndpoint: testUpdateUserPinEndpoint,
            uploadFileEndPoint: testUploadFileEndPoint,
            verifyContactOTPEndpoint: testVerifyContactOTPEndpoint,
            verifyPhoneEndpoint: testVerifyPhoneEndpoint,
          ),
        ),
      ),
    );
  }, (Object exception, StackTrace stackTrace) async {
    await Sentry.captureException(exception, stackTrace: stackTrace);
  });
}
