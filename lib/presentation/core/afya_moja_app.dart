// Flutter imports:
// Package imports:
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:dart_fcm/dart_fcm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_graphql_client/graph_client.dart';
// Project imports:
import 'package:healthcloud/application/core/services/app_setup_data.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/domain/core/entities/common_behavior_object.dart';
import 'package:healthcloud/domain/core/value_objects/app_widget_keys.dart';
import 'package:healthcloud/presentation/core/auth_manager.dart';

class AfyaMojaApp extends StatefulWidget {
  const AfyaMojaApp({
    Key? key,
    required this.store,
    required this.appSetupData,
  }) : super(key: key);

  final AppSetupData appSetupData;

  /// The store to be used to initialize the StoreProvider with
  final Store<AppState> store;

  @override
  _AfyaMojaAppState createState() => _AfyaMojaAppState();
}

class _AfyaMojaAppState extends State<AfyaMojaApp> {
  bool hasFinishedLaunching = false;

  @override
  void didChangeDependencies() {
    if (!hasFinishedLaunching) {
      /// [configure] is responsible for correctly setting
      ///  up local notifications ( and asking for permission if needed) and wiring-up
      /// firebase messaging [onMessage] callback to show fcm messages
      SILFCM().configure(context: context);
      hasFinishedLaunching = true;
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      key: globalStoreProviderKey,
      store: widget.store,
      child: StoreConnector<AppState, AppState>(
        converter: (Store<AppState> store) => store.state,
        builder: (BuildContext context, AppState state) {
          return AppWrapper(
            appName: AppBrand().appName.value,
            baseContext: widget.appSetupData.customContext,
            graphQLClient: GraphQlClient(
              widget.store.state.staffState!.userState!.auth!.idToken!,
              widget.appSetupData.customContext!.graphqlEndpoint,
            ),
            appContexts: widget.appSetupData.appContexts,
            child: Builder(
              builder: (BuildContext context) {
                return AuthManager(
                  appName: AppBrand().appName.value,
                  appContexts: widget.appSetupData.appContexts,
                  store: widget.store,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
