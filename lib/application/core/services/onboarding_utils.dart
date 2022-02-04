import 'dart:convert';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:healthcloud/presentation/router/routes.dart';
import 'package:http/http.dart' as http;
import 'package:shared_themes/constants.dart';

void toggleLoadingIndicator({
  required BuildContext context,
  required String? flag,
  bool show = true,
}) {
  if (flag != null) {
    show
        ? StoreProvider.dispatch(
            context,
            WaitAction<AppState>.add(flag, ref: '${flag}_ref'),
          )
        : StoreProvider.dispatch(
            context,
            WaitAction<AppState>.remove(flag, ref: '${flag}_ref'),
          );
  }
}

Future<http.Response> retrieveOTP({
  required IGraphQlClient httpClient,
  required BuildContext context,
  required bool isResetPin,
  required bool isResend,
  required Map<String, dynamic> variables,
}) async {
  final String verifyPhoneEndpoint =
      AppWrapperBase.of(context)!.customContext!.verifyPhoneEndpoint;

  final String sendOTPEndpoint =
      AppWrapperBase.of(context)!.customContext!.sendRecoverAccountOtpEndpoint;

  final String reSendOTPEndpoint =
      AppWrapperBase.of(context)!.customContext!.retryResendOtpEndpoint;

  if (isResetPin || (isResetPin && isResend)) {
    return httpClient.callRESTAPI(
      endpoint: verifyPhoneEndpoint,
      method: httpPOST,
      variables: variables,
    );
  } else {
    return httpClient.callRESTAPI(
      endpoint: isResend ? reSendOTPEndpoint : sendOTPEndpoint,
      method: httpPOST,
      variables: variables,
    );
  }
}


/// [processHttpResponse] routine is used to process a network call response, for errors, bad requests, timeouts and correct responses.
///
/// errors are further processed using our own custom error codes to determine if it an error within our error codes
ProcessedResponse processHTTPResponse(
  http.Response response, [
  BuildContext? context,
]) {
  if (<int>[200, 201, 202].contains(response.statusCode)) {
    return ProcessedResponse(ok: true, response: response);
  }

  if (response.statusCode == 400) {
    final Map<String, dynamic> body =
        json.decode(response.body) as Map<String, dynamic>;

    if ((body['code'] == 7) && context != null) {
      return ProcessedResponse(
        ok: false,
        response: response,
        message: getUserFriendlyMsg(body['code'] as int),
      );
    }

    return ProcessedResponse(
      ok: false,
      response: response,
      message: getUserFriendlyMsg(body['code'] as int),
    );
  }

  if (response.statusCode == 500) {
    final int code = json.decode(response.body)['code'] != null
        ? json.decode(response.body)['code'] as int
        : 11;

    return ProcessedResponse(
      ok: false,
      response: response,
      message: getUserFriendlyMsg(code),
    );
  }
  if (response.statusCode == 408) {
    return ProcessedResponse(
      ok: false,
      response: response,
      message: getUserFriendlyMsg(0),
    );
  }
  return ProcessedResponse(
    ok: false,
    response: response,
    message: UserFeedBackTexts.getErrorMessage(),
  );
}
