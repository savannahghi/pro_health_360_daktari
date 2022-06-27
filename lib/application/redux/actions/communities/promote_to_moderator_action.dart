import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart';
import 'package:prohealth360_daktari/application/core/graphql/mutations.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class PromoteToModeratorAction extends ReduxAction<AppState> {
  final IGraphQlClient client;
  final List<String> memberIds;
  final String communityId;
  final VoidCallback? successCallback;

  PromoteToModeratorAction({
    required this.client,
    required this.memberIds,
    required this.communityId,
    this.successCallback,
  });

  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(promoteToAdminFlag));
  }

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(promoteToAdminFlag));
    super.after();
  }

  @override
  Future<AppState?> reduce() async {
    final Map<String, dynamic> variables = <String, dynamic>{
      'memberIDs': memberIds,
      'communityID': communityId
    };

    final Response response =
        await client.query(promoteToModeratorMutation, variables);

    final ProcessedResponse processedResponse = processHttpResponse(response);

    if (processedResponse.ok) {
      final Map<String, dynamic> body = client.toMap(response);
      final String? error = parseError(body);

      if (error != null) {
        throw const UserException(errorPromotingAdminText);
      }

      final Map<String, dynamic>? data = body['data'] as Map<String, dynamic>?;

      final bool promotedSuccessfully = data?['addModerators'] as bool;

      if (promotedSuccessfully) {
        successCallback?.call();
        return null;
      } else {
        throw const UserException(errorPromotingAdminText);
      }
    } else {
      Sentry.captureException(
        const UserException(somethingWentWrongText),
        hint: <String, dynamic>{
          'memberIds': memberIds,
          'communityId': communityId,
          'mutation': promoteToModeratorMutation,
          'response': response,
        },
      );

      throw const UserException(somethingWentWrongText);
    }
  }

  @override
  Object? wrapError(dynamic error) {
    if (error.runtimeType == UserException) {
      return error;
    }

    Sentry.captureException(error);
    return const UserException(somethingWentWrongText);
  }
}
