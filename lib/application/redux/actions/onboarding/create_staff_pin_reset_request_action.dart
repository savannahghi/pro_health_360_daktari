import 'dart:async';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart';
import 'package:mycarehubpro/application/redux/actions/flags/app_flags.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';
import 'package:mycarehubpro/presentation/router/routes.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class CreateStaffPINResetRequestAction extends ReduxAction<AppState> {
  CreateStaffPINResetRequestAction({
    required this.client,
    required this.pinResetServiceRequestEndpoint,
    this.onError,
    this.onSuccess,
  });

  final IGraphQlClient client;
  final VoidCallback? onError;
  final VoidCallback? onSuccess;
  final String pinResetServiceRequestEndpoint;

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(staffPinResetServiceRequestFlag));
    super.after();
  }

  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(staffPinResetServiceRequestFlag));
  }

  @override
  Future<AppState?> reduce() async {
    final String phoneNumber = state.onboardingState?.phoneNumber ?? '';
    final Map<String, dynamic> variables = <String, dynamic>{
      'phoneNumber': phoneNumber,
      'flavour': Flavour.pro.name,
    };
    final Response response = await client.callRESTAPI(
      endpoint: pinResetServiceRequestEndpoint,
      method: httpPOST,
      variables: variables,
    );
    client.close();
    final Map<String, dynamic> payLoad = client.toMap(response);
    final ProcessedResponse processedResponse = processHttpResponse(response);
    if (processedResponse.ok) {
      final bool? status = payLoad['status'] as bool?;
      if (status ?? false) {
        onSuccess?.call();
        dispatch(
          NavigateAction<AppState>.pushNamedAndRemoveUntil(
            AppRoutes.pinRequestSentPage,
            (Route<dynamic> route) => false,
          ),
        );

        return state;
      } else {
        onError?.call();
        Sentry.captureException('PIN service request failed');

        return null;
      }
    }

    final String? error = parseError(payLoad);

    onError?.call();
    Sentry.captureException(error, hint: 'PIN service request failed');

    return null;
  }
}
