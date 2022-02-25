// Flutter imports:

// Package imports:
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
// Project imports:
import 'package:healthcloud/application/core/services/app_setup_data.dart';
import 'package:healthcloud/application/core/services/custom_client.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/application/redux/view_model_factories/app_entry_point_view_model_factory.dart';
import 'package:healthcloud/application/redux/view_models/app_entry_point_view_model.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:healthcloud/domain/core/value_objects/app_widget_keys.dart';
import 'package:healthcloud/presentation/core/auth_manager.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class MyCareHubProfessionalApp extends StatelessWidget {
  const MyCareHubProfessionalApp({
    Key? key,
    required this.store,
    required this.appSetupData,
  }) : super(key: key);

  final AppSetupData appSetupData;

  final Store<AppState> store;

  @override
  Widget build(BuildContext context) {
    final String apiKey = FlutterConfig.get('STREAM_API_KEY') as String;

    final StreamChatClient streamClient = StreamChatClient(
      apiKey,
      logLevel: Level.ALL,
    );
    return StoreProvider<AppState>(
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
            child: AuthManager(
              appName: appName,
              appContexts: appSetupData.appContexts,
              streamClient: streamClient,
            ),
          );
        },
      ),
    );
  }
}
