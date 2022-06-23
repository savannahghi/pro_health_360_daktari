import 'dart:async';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart';
import 'package:prohealth360_daktari/application/core/graphql/mutations.dart';
import 'package:prohealth360_daktari/application/core/services/helpers.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/entities/register_staff/register_staff_payload.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class RegisterStaffAction extends ReduxAction<AppState> {
  final RegisterStaffPayload registerStaffPayload;
  final IGraphQlClient client;
  final VoidCallback onSuccess;

  RegisterStaffAction({
    required this.registerStaffPayload,
    required this.client,
    required this.onSuccess,
  });

  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(registerStaffFlag));
  }

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(registerStaffFlag));
    super.after();
  }

  @override
  Future<AppState?> reduce() async {
    final Map<String, dynamic> payload = registerStaffPayload.toJson();

    final Response response = await client.query(
      registerStaffMutation,
      <String, dynamic>{'input': payload},
    );

    final ProcessedResponse processedResponse = processHttpResponse(response);

    if (processedResponse.ok) {
      final Map<String, dynamic> body = client.toMap(response);
      client.close();

      final String? errors = client.parseError(body);

      if (errors != null) {
        if (errors.contains(phoneExists)) {
          throw const UserException(userWithPhoneExists);
        }

        if (errors.contains(cccExists)) {
          throw const UserException(staffCccExists);
        }

        Sentry.captureException(UserException(errors));

        throw const UserException(somethingWentWrongText);
      }

      this.onSuccess();
    } else {
      await captureException(
        errorPhoneLogin,
        error: processedResponse.message,
        response: processedResponse.response.body,
      );
      throw UserException(processedResponse.message);
    }

    return null;
  }
}
