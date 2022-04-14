import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart';
import 'package:mycarehubpro/application/core/graphql/mutations.dart';
import 'package:mycarehubpro/application/redux/actions/flags/app_flags.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/application/redux/states/service_requests/tool_assessment_response.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class ResolveScreeningToolServiceRequestAction extends ReduxAction<AppState> {
  final IGraphQlClient client;
  final String serviceRequestId;
  final VoidCallback? onSuccess;
  final VoidCallback? onFailure;

  ResolveScreeningToolServiceRequestAction({
    required this.serviceRequestId,
    required this.client,
    this.onSuccess,
    this.onFailure,
  });

  @override
  void before() {
    super.before();
    dispatch(
      WaitAction<AppState>.add(
        resolveServiceRequestFlag,
      ),
    );
  }

  @override
  void after() {
    dispatch(
      WaitAction<AppState>.remove(
        resolveServiceRequestFlag,
      ),
    );
    super.after();
  }

  @override
  Future<AppState?> reduce() async {
    final String staffId = state.staffState?.user?.userId ?? '';

    final Map<String, dynamic> variables = <String, dynamic>{
      'staffID': staffId,
      'requestID': serviceRequestId,
    };

    final Response result = await client.query(
      resolveServiceRequestMutation,
      variables,
    );

    client.close();

    final Map<String, dynamic> payLoad = client.toMap(result);
    final String? error = parseError(payLoad);

    if (error != null) {
      onFailure?.call();
      Sentry.captureException(
        error,
        hint: 'Error while resolving service request',
      );

      return null;
    }

    final bool? isResolved = payLoad['data']['resolveServiceRequest'] as bool?;

    if (isResolved ?? false) {
      final List<ToolAssessmentResponse>? toolAssessmentResponses = state
          .serviceRequestState?.screeningToolsState?.toolAssessmentResponses;

      if (toolAssessmentResponses?.isNotEmpty ?? false) {
        toolAssessmentResponses!.removeWhere(
          (ToolAssessmentResponse request) =>
              request.serviceRequestID == serviceRequestId,
        );
      }

      onSuccess?.call();
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
