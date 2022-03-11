// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:flutter_config/flutter_config.dart';
import 'package:mycarehubpro/application/core/services/helpers.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_contexts.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_name_constants.dart';
import 'package:mycarehubpro/domain/core/value_objects/global_keys.dart';
import 'package:mycarehubpro/presentation/router/route_generator.dart';
import 'mocks.dart';

/// [buildTestWidget] is a widget wrapper used for testing
/// It wraps the widget with a `StoreProvider`, `AppWrapperBase`, `MaterialApp` and a `Scaffold`
/// Helps to avoid repetition across test files requiring the above widgets
///
/// The function will create a store for you if you don't provide one
Future<void> buildTestWidget({
  required WidgetTester tester,
  required Widget widget,
  Store<AppState>? store,
  IGraphQlClient? graphQlClient,
  List<NavigatorObserver>? navigatorObservers,
  Widget? endDrawer,
  Duration? duration,
}) async {
  FlutterConfig.loadValueForTesting(<String, String>{
    'DEV_SENTRY_DNS': 'test_dev_sentry_dns',
    'PROD_SENTRY_DNS': 'test_prod_sentry_dns',
    'DEV_STREAM_API_KEY': 'dev_stream_api_key',
    'DEMO_STREAM_API_KEY': 'demo_stream_api_key',
    'PROD_STREAM_API_KEY': 'prod_stream_api_key',
  });

  NavigateAction.setNavigatorKey(globalAppNavigatorKey);

  await tester.pumpWidget(
    StoreProvider<AppState>(
      store: store ?? Store<AppState>(initialState: AppState.initial()),
      child: AppWrapper(
        appName: testAppName,
        appContexts: testAppContexts,
        baseContext: devAppSetupData.customContext,
        graphQLClient: graphQlClient ?? mockGraphQlClient,
        child: MaterialApp(
          onGenerateRoute: RouteGenerator.generateRoute,
          navigatorKey: globalAppNavigatorKey,
          navigatorObservers: navigatorObservers ?? <NavigatorObserver>[],
          home: Scaffold(endDrawer: endDrawer, body: widget),
        ),
      ),
    ),
    duration,
  );
}
