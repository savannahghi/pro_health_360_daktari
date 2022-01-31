// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/domain/core/value_objects/app_contexts.dart';
import 'package:healthcloud/domain/core/value_objects/global_keys.dart';
import 'package:healthcloud/presentation/router/route_generator.dart';
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
  final Store<AppState> _store =
      Store<AppState>(initialState: AppState.initial());

  NavigateAction.setNavigatorKey(globalAppNavigatorKey);

  await tester.pumpWidget(
    AppWrapperBase(
      graphQLClient: graphQlClient ?? mockSILGraphQlClient,
      appName: 'Test app',
      appContexts: testAppContexts,
      deviceCapabilities: deviceCapabilities,
      child: StoreProvider<AppState>(
        store: store ?? _store,
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

StoreTester<AppState> createStoreTester() {
  final Store<AppState> store =
      Store<AppState>(initialState: AppState.initial());
  return StoreTester<AppState>.from(
    store,
    testInfoPrinter: (TestInfo<dynamic> testInfo) {},
  );
}

Future<void> advanceAndPump({
  required Widget widget,
  required WidgetTester tester,
  required void Function(Duration) updateTime,
  Store<AppState>? store,
  IGraphQlClient? graphQlClient,
  List<NavigatorObserver>? navigatorObservers,
  Duration duration = Duration.zero,
}) async {
  updateTime(duration);

  await buildTestWidget(
    tester: tester,
    widget: widget,
    duration: duration,
    store: store,
    graphQlClient: graphQlClient,
    navigatorObservers: navigatorObservers,
  );
  await tester.pumpAndSettle();
}

Type typeOf<T>() => T;
