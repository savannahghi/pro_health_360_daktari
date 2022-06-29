import 'dart:async';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:prohealth360_daktari/application/core/graphql/queries.dart';
import 'package:prohealth360_daktari/application/redux/actions/core/update_staff_profile_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/entities/core/facility.dart';
import 'package:prohealth360_daktari/domain/core/entities/register_client/fetch_facilities_response.dart';
import 'package:http/http.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class SearchFacilitiesAction extends ReduxAction<AppState> {
  final IGraphQlClient client;
  final void Function(String message)? onFailure;
  final String mflCode;

  SearchFacilitiesAction({
    required this.client,
    this.onFailure,
    required this.mflCode,
  });

  @override
  void before() {
    super.before();
    dispatch(UpdateStaffProfileAction(facilities: <Facility>[]));
    dispatch(WaitAction<AppState>.add(fetchFacilitiesFlag));
  }

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(fetchFacilitiesFlag));
    super.after();
  }

  @override
  Future<AppState?> reduce() async {
    final bool hasConnection = state.connectivityState?.isConnected ?? false;
    if (!hasConnection) {
      onFailure?.call('connection failure');
      return null;
    }

    final Map<String, dynamic> variables = <String, dynamic>{
      'searchParameter': mflCode,
    };

    final Response response =
        await client.query(searchFacilityQuery, variables);

    final ProcessedResponse processedResponse = processHttpResponse(response);

    if (processedResponse.ok) {
      final Map<String, dynamic> body = client.toMap(response);
      client.close();

      final String? errors = client.parseError(body);

      if (errors != null) {
        Sentry.captureException(
          UserException(errors),
        );

        throw UserException(getErrorMessage('fetching facilities'));
      }

      final FetchFacilitiesResponse facilities =
          FetchFacilitiesResponse.fromJson(
        body['data'] as Map<String, dynamic>,
      );

      dispatch(UpdateStaffProfileAction(facilities: facilities.facilities));
    } else {
      throw UserException(processedResponse.message);
    }
    return null;
  }
}
