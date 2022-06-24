import 'dart:async';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:prohealth360_daktari/application/core/graphql/mutations.dart';
import 'package:prohealth360_daktari/application/core/services/analytics_service.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_enums.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_events.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/domain/core/entities/create_group/create_group_payload.dart';
import 'package:http/http.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class CreateGroupAction extends ReduxAction<AppState> {
  final CreateGroupPayload createGroupPayload;
  final IGraphQlClient client;
  final VoidCallback onSuccess;

  CreateGroupAction({
    required this.createGroupPayload,
    required this.client,
    required this.onSuccess,
  });

  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(createGroupFlag));
  }

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(createGroupFlag));
    super.after();
  }

  @override
  Future<AppState?> reduce() async {
    final Map<String, dynamic> payload = createGroupPayload.toJson();

    final Response response = await client.query(
      createCommunity,
      <String, dynamic>{'input': payload},
    );

    final ProcessedResponse processedResponse = processHttpResponse(response);

    if (processedResponse.ok) {
      final Map<String, dynamic> body = client.toMap(response);
      client.close();

      final String? errors = client.parseError(body);

      if (errors != null) {
        Sentry.captureException(
          UserException(errors),
        );

        throw const UserException(somethingWentWrongText);
      }

      this.onSuccess();
      await AnalyticsService().logEvent(
        name: addNewGroup,
        eventType: AnalyticsEventType.INTERACTION,
        parameters: <String, dynamic>{
          'name': createGroupPayload.name,
          'clientType': createGroupPayload.clientType.toString(),
        },
      );
    } else {
      throw UserException(processedResponse.message);
    }

    return null;
  }
}
