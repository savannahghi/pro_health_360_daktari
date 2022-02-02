// Flutter imports:

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_graphql_client/graph_client.dart';

// Project imports:
import 'package:healthcloud/application/core/services/app_setup_data.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
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
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      key: globalStoreProviderKey,
      store: widget.store,
      child: StoreConnector<AppState, AppState>(
        converter: (Store<AppState> store) => store.state,
        builder: (BuildContext context, AppState state) {
          return AppWrapper(
            appContexts: widget.appSetupData.appContexts,
            appName: appName,
            baseContext: widget.appSetupData.customContext,
            graphQLClient: GraphQlClient(
              widget.store.state.credentials!.idToken!,
              widget.appSetupData.customContext!.graphqlEndpoint,
            ),
            child: AuthManager(
              appName: appName,
              appContexts: widget.appSetupData.appContexts,
              store: widget.store,
            ),
          );
        },
      ),
    );
  }
}
