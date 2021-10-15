// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/system_enums.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_contexts.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/domain_constants.dart';
import 'package:domain_objects/entities.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_ui_components/buttons.dart';

// Project imports:
import 'package:healthcloud/application/redux/actions/core/update_user_state_action.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';
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
  Store<CoreState>? store,
  IGraphQlClient? graphQlClient,
  List<NavigatorObserver>? navigatorObservers,
  Widget? endDrawer,
  Duration? duration,
}) async {
  final Store<CoreState> _store =
      Store<CoreState>(initialState: AppState.initial());

  NavigateAction.setNavigatorKey(globalAppNavigatorKey);

  await tester.pumpWidget(
    AppWrapperBase(
      graphQLClient: graphQlClient ?? mockSILGraphQlClient,
      appName: AppBrand().appName.value,
      appContexts: testAppContexts,
      deviceCapabilities: deviceCapabilities,
      child: StoreProvider<CoreState>(
        store: store ?? _store,
        child: MaterialApp(
          onGenerateRoute: AppRouterGenerator.generateRoute,
          navigatorKey: globalAppNavigatorKey,
          navigatorObservers: navigatorObservers ?? <NavigatorObserver>[],
          home: Scaffold(endDrawer: endDrawer, body: widget),
        ),
      ),
    ),
    duration,
  );
}

/// [buildDrawerTestWidget] is a widget wrapper used for testing clinical drawers.
/// It wraps the widget with a `StoreProvider`, `AppWrapperBase`,
/// `MaterialApp` and a `Scaffold`
///
/// It provides a [endDrawer] property to the `Scaffold` with the current active drawer.
/// Tap [SILPrimaryButton] to open drawer.
///
/// This widget also opens the drawer for you so that you can begin your
/// widget interactions immediately
Future<void> buildDrawerTestWidget(
  WidgetTester tester,
  DrawerType drawerType, {
  Store<AppState>? store,
  IGraphQlClient? graphQlClient,
}) async {
  await buildTestWidget(
    tester: tester,
    graphQlClient: graphQlClient,
    store: store,
    endDrawer: SizedBox(
      width: tabletPortrait.width,
      height: tabletPortrait.height,
      child: Drawer(
        child: ListView(
          children: <Widget>[
            activeDrawer(
              drawer: drawerType.name,
            )
          ],
        ),
      ),
    ),
    widget: Builder(
      builder: (BuildContext context) {
        StoreProvider.dispatch<CoreState>(
          context,
          UpdateUserStateAction(
            userProfile: UserProfile(
              userBioData: BioData(
                firstName: Name.withValue('Bewell'),
                lastName: Name.withValue('Test'),
              ),
            ),
          ),
        );
        return SILPrimaryButton(
          text: drawerTestRootText,
          onPressed: () => Scaffold.of(context).openEndDrawer(),
        );
      },
    ),
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
