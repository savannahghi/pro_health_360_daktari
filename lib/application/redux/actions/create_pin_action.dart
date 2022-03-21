import 'dart:convert';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:mycarehubpro/application/core/graphql/mutations.dart';
import 'package:mycarehubpro/application/redux/actions/core/batch_update_misc_state_action.dart';
import 'package:mycarehubpro/application/redux/actions/flags/app_flags.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';
import 'package:http/http.dart' as http;
import 'package:sentry_flutter/sentry_flutter.dart';

/// [CreatePINAction] is a Redux Action whose job is to update a users PIN from an old one,
///  to the new provided one
///
/// Otherwise delightfully notify user of any Error that might occur during update PIN process
///
/// should initiate change PIN process

class CreatePINAction extends ReduxAction<AppState> {
  CreatePINAction({
    required this.client,
    this.successCallback,
    this.pinMismatchCallback,
  });

  final IGraphQlClient client;
  final VoidCallback? successCallback;
  final VoidCallback? pinMismatchCallback;

  /// [wrapError] used to wrap error thrown during execution of the `reduce()` method
  /// returns a bottom sheet that gives the user a friendly message and an option to create an account
  @override
  void before() {
    dispatch(WaitAction<AppState>.add(createPinFlag));
  }

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(createPinFlag));
    super.after();
  }

  @override
  Future<AppState?> reduce() async {
    final String? userID = state.staffState?.user?.userId;
    final String? newPIN = state.onboardingState?.pin;
    final String? confirmPIN = state.onboardingState?.confirmPIN;

    // check if the new PIN matches the confirmed PIN entered by the user
    if (newPIN == confirmPIN) {
      // initializing of the updateUserPin mutation
      final Map<String, String?> _updateUserPinVariables = <String, String?>{
        'userID': userID,
        'pin': newPIN,
        'confirmPIN': confirmPIN,
        'flavour': Flavour.pro.name,
      };
      final http.Response result = await client.query(
        setUserPINMutation,
        setUserPINMutationVariables(_updateUserPinVariables),
      );

      final Map<String, dynamic> body = client.toMap(result);
      client.close();

      final Map<String, dynamic> responseMap =
          json.decode(result.body) as Map<String, dynamic>;

      final String? error = client.parseError(body);

      if (error != null || responseMap.isEmpty) {
        dispatch(BatchUpdateMiscStateAction(error: somethingWentWrongText));
        Sentry.captureException(
          UserException(error),
        );
        return null;
      }

      if (responseMap['data']['setUserPIN'] == true) {
        successCallback?.call();
      }
    } else {
      pinMismatchCallback?.call();
    }

    return state;
  }
}
