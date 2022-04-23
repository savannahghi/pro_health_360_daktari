import 'dart:async';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:mycarehubpro/application/core/graphql/queries.dart';
import 'package:mycarehubpro/application/redux/actions/flags/app_flags.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:http/http.dart';
import 'package:mycarehubpro/application/redux/states/service_requests/tool_assessment_response.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_enums.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class FetchScreeningToolResponsesAction extends ReduxAction<AppState> {
  final IGraphQlClient client;
  final ScreeningToolsType toolsType;
  final String clientID;
  final VoidCallback? onFailure;

  FetchScreeningToolResponsesAction({
    required this.toolsType,
    required this.client,
    required this.clientID,
    this.onFailure,
  });

  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(fetchScreeningToolResponsesFlag));
  }

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(fetchScreeningToolResponsesFlag));
    super.after();
  }

  @override
  Future<AppState?> reduce() async {
    final Map<String, dynamic> variables = <String, dynamic>{
      'clientID': clientID,
      'toolType': toolsType.name,
    };
    final Response response = await client.query(
      getScreeningToolServiceRequestResponsesQuery,
      variables,
    );
    client.close();

    final Map<String, dynamic> payLoad = client.toMap(response);

    final String? error = parseError(payLoad);

    if (error != null) {
      Sentry.captureException(UserException(error));

      onFailure?.call();

      return null;
    }

    final ToolAssessmentResponse loadedAssessmentResponses =
        ToolAssessmentResponse.fromJson(
      payLoad['data'] as Map<String, dynamic>,
    );

    if (loadedAssessmentResponses
            .toolAssessmentRequestResponse?.questionsResponses?.isNotEmpty ??
        false) {
      final List<ToolAssessmentResponse>? toolAssessmentResponses = state
          .serviceRequestState?.screeningToolsState?.toolAssessmentResponses;

      if (toolAssessmentResponses?.isNotEmpty ?? false) {
        for (int i = 0; i < toolAssessmentResponses!.length; i++) {
          if (toolAssessmentResponses[i].clientID == clientID) {
            toolAssessmentResponses[i] =
                toolAssessmentResponses[i].copyWith.call(
                      toolAssessmentRequestResponse: loadedAssessmentResponses
                          .toolAssessmentRequestResponse,
                    );
            break;
          }
        }
      }

      return state.copyWith(
        serviceRequestState: state.serviceRequestState?.copyWith(
          screeningToolsState: state.serviceRequestState?.screeningToolsState
              ?.copyWith(toolAssessmentResponses: toolAssessmentResponses),
        ),
      );
    }
    onFailure?.call();

    return null;
  }
}
