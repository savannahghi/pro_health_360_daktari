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
import 'package:healthcloud/infrastructure/connectivity/connectivity_interface.dart';
import 'package:healthcloud/presentation/core/auth_manager.dart';

class AfyaMojaApp extends StatelessWidget {
  const AfyaMojaApp({
    Key? key,
    required this.store,
    required this.appSetupData,
    required this.connectivityStatus,
  }) : super(key: key);

  final AppSetupData appSetupData;

  final Store<AppState> store;

  final ConnectivityStatus connectivityStatus;

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      key: globalStoreProviderKey,
      store: store,
      child: StoreConnector<AppState, AppState>(
        converter: (Store<AppState> store) => store.state,
        builder: (BuildContext context, AppState state) {
          return AppWrapper(
            appContexts: appSetupData.appContexts,
            appName: appName,
            baseContext: appSetupData.customContext,
            graphQLClient: GraphQlClient(
              store.state.credentials?.idToken ?? '',
              appSetupData.customContext?.graphqlEndpoint ?? '',
            ),
            child: AuthManager(
              appName: appName,
              appContexts: appSetupData.appContexts,
              connectivityStatus: connectivityStatus,
            ),
          );
        },
      ),
    );
  }
}
