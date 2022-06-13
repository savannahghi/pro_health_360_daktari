// Flutter imports:

// Package imports:
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
// Project imports:
import 'package:mycarehubpro/application/core/services/app_setup_data.dart';
import 'package:mycarehubpro/application/core/services/custom_client.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/application/redux/view_model_factories/app_entry_point_view_model_factory.dart';
import 'package:mycarehubpro/application/redux/view_models/app_entry_point_view_model.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_widget_keys.dart';
import 'package:mycarehubpro/infrastructure/connectivity/connectivity_interface.dart';
import 'package:mycarehubpro/infrastructure/connectivity/connectivity_provider.dart';
import 'package:mycarehubpro/presentation/core/pre_load_app.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class MyCareHubProApp extends StatelessWidget {
  const MyCareHubProApp({
    Key? key,
    required this.store,
    required this.appSetupData,
    required this.streamClient,
    required this.connectivityChecker,
    required this.analyticsObserver,
  }) : super(key: key);

  final AppSetupData appSetupData;
  final ConnectivityChecker connectivityChecker;
  final Store<AppState> store;
  final StreamChatClient streamClient;
  final FirebaseAnalyticsObserver analyticsObserver;

  @override
  Widget build(BuildContext context) {
    return ConnectivityCheckerProvider(
      connectivityChecker: connectivityChecker,
      child: StoreProvider<AppState>(
        key: globalStoreProviderKey,
        store: store,
        child: StoreConnector<AppState, AppEntryPointViewModel>(
          vm: () => AppEntryPointViewModelFactory(),
          builder: (BuildContext context, AppEntryPointViewModel vm) {
            final String idToken = vm.idToken ?? '';

            final String graphqlEndpoint =
                appSetupData.customContext!.graphqlEndpoint;

            final String refreshTokenEndpoint =
                appSetupData.customContext?.refreshTokenEndpoint ?? '';

            final String userID = vm.userId ?? '';

            return AppWrapper(
              appContexts: appSetupData.appContexts,
              appName: appName,
              baseContext: appSetupData.customContext,
              graphQLClient: CustomClient(
                idToken,
                graphqlEndpoint,
                context: context,
                refreshTokenEndpoint: refreshTokenEndpoint,
                userID: userID,
              ),
              child: PreLoadApp(
                appName: appName,
                appContexts: appSetupData.appContexts,
                streamClient: streamClient,
                analyticsObserver: analyticsObserver,
              ),
            );
          },
        ),
      ),
    );
  }
}
