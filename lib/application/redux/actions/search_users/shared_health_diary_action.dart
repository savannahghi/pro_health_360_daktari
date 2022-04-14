import 'dart:async';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart';
import 'package:mycarehubpro/application/core/graphql/queries.dart';
import 'package:mycarehubpro/application/redux/actions/core/update_staff_profile_action.dart';
import 'package:mycarehubpro/application/redux/actions/flags/app_flags.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/domain/core/entities/health_diary/health_diary_entry.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class SharedHealthDiaryAction extends ReduxAction<AppState> {
  final IGraphQlClient client;
  String facilityID;
  String? clientID;

  SharedHealthDiaryAction({
    required this.client,
    required this.facilityID,
    this.clientID,
  });

  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(sharedHealthDiaryFlag));
  }

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(sharedHealthDiaryFlag));
    super.after();
  }

  @override
  Future<AppState?> reduce() async {
    final Map<String, dynamic> variables = <String, dynamic>{
      'facilityID': facilityID,
      'clientID': clientID,
    };

    final Response response =
        await client.query(recentlySharedHealthDiaryQuery, variables);

    final ProcessedResponse processedResponse = processHttpResponse(response);

    if (processedResponse.ok) {
      final Map<String, dynamic> body = client.toMap(response);
      client.close();

      final String? errors = client.parseError(body);

      if (errors != null) {
        Sentry.captureException(
          UserException(errors),
        );

        throw UserException(
          getErrorMessage('fetching recently shared health diary entries'),
        );
      }

      final HealthDiaryEdge healthDiaryResponse = HealthDiaryEdge.fromJson(
        body['data'] as Map<String, dynamic>,
      );

      dispatch(
        UpdateStaffProfileAction(
          healthDiaryEntries: healthDiaryResponse.healthDiaryEntry,
        ),
      );
    } else {
      throw UserException(processedResponse.message);
    }

    return null;
  }
}
