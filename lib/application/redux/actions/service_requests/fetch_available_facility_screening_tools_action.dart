import 'dart:async';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:prohealth360_daktari/application/core/graphql/queries.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/actions/service_requests/update_screening_tools_state_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/service_requests/update_service_requests_state_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:http/http.dart';
import 'package:prohealth360_daktari/application/redux/states/service_requests/screening_tools_state.dart';
import 'package:prohealth360_daktari/domain/core/entities/service_requests/tool_type.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class FetchAvailableFacilityScreeningToolsAction extends ReduxAction<AppState> {
  final IGraphQlClient client;

  FetchAvailableFacilityScreeningToolsAction({
    required this.client,
  });

  @override
  void before() {
    super.before();
    dispatch(
      UpdateServiceRequestsStateAction(
        errorFetchingPendingServiceRequests: false,
      ),
    );
    dispatch(WaitAction<AppState>.add(fetchAvailableScreeningToolsFlag));
  }

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(fetchAvailableScreeningToolsFlag));
    super.after();
  }

  @override
  Future<AppState?> reduce() async {
    final String facilityID = state.staffState?.defaultFacility ?? '';

    final Map<String, dynamic> variables = <String, dynamic>{
      'facilityID': facilityID,
    };
    final Response response = await client.query(
      getAvailableFacilityScreeningToolsQuery,
      variables,
    );
    client.close();

    final Map<String, dynamic> payLoad = client.toMap(response);

    final String? error = parseError(payLoad);

    if (error != null) {
      Sentry.captureException(UserException(error));

      dispatch(
        UpdateServiceRequestsStateAction(
          errorFetchingPendingServiceRequests: true,
        ),
      );

      return null;
    }

    final ScreeningToolsState screeningToolsState =
        ScreeningToolsState.fromJson(
      payLoad['data'] as Map<String, dynamic>,
    );

    final List<ToolType> availableTools =
        screeningToolsState.availableTools ?? <ToolType>[];

    dispatch(
      UpdateScreeningToolsStateAction(
        availableTools: availableTools,
      ),
    );

    return state;
  }
}
