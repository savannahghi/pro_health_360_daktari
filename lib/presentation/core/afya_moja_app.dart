import 'package:async_redux/async_redux.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:flutter/material.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:dart_fcm/dart_fcm.dart';
import 'package:healthcloud/infrastructure/afyamoja_endpoint_context.dart';

import 'auth_manager.dart';

class AfyaMojaApp extends StatefulWidget {
  const AfyaMojaApp({
    Key? key,
    required this.store,
    required this.appContexts,
    this.customContext,
  }) : super(key: key);

  final List<AppContext> appContexts;
  final Store<CoreState> store;
  final BaseContext? customContext;

  @override
  _AfyaMojaAppState createState() => _AfyaMojaAppState();
}

class _AfyaMojaAppState extends State<AfyaMojaApp> {
  bool hasFinishedLaunching = false;
  static const Key globalStoreProviderKey = Key('global_store_provider');

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
    return StoreProvider<CoreState>(
      key: globalStoreProviderKey,
      store: widget.store,
      child: StoreConnector<CoreState, CoreState>(
        converter: (Store<CoreState> store) => store.state,
        builder: (BuildContext context, CoreState state) {
          return AppWrapper(
            appName: AppBrand().appName.value,
            baseContext: widget.customContext,
            graphQLClient: GraphQlClient(
              widget.store.state.userState!.auth!.idToken!,
              AfyaMojaEndpointContext.getGraphQLEndpoint(widget.appContexts),
            ),
            appContexts: widget.appContexts,
            child: Builder(
              builder: (BuildContext context) {
                return AuthManager(
                  appName: AppBrand().appName.value,
                  appContexts: widget.appContexts,
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
