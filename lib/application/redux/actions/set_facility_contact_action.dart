import 'dart:convert';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:prohealth360_daktari/application/core/graphql/mutations.dart';
import 'package:prohealth360_daktari/application/core/services/analytics_service.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:http/http.dart' as http;
import 'package:prohealth360_daktari/domain/core/value_objects/app_enums.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_events.dart';

/// [SetFacilityContactAction] is a Redux Action whose job is to update a staff's
/// default facility's contact. Otherwise delightfully notify user of any Error that might occur
///  during the process.
class SetFacilityContactAction extends ReduxAction<AppState> {
  SetFacilityContactAction({
    required this.client,
    this.onSuccess,
    this.onError,
    required this.phone,
  });

  final void Function()? onSuccess;
  final void Function(String message)? onError;
  final IGraphQlClient client;
  final String phone;

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(addFacilityContactFlag));
    super.after();
  }

  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(addFacilityContactFlag));
  }

  @override
  Future<AppState> reduce() async {
    final String? facilityID = state.staffState?.defaultFacility;

    final Map<String, String?> variables = <String, String?>{
      'facilityID': facilityID,
      'contact': phone,
    };

    final http.Response result = await client.query(
      addFacilityContactMutation,
      variables,
    );

    final Map<String, dynamic> body = client.toMap(result);
    client.close();

    final Map<String, dynamic> responseMap =
        json.decode(result.body) as Map<String, dynamic>;

    final String? errors = client.parseError(body);

    if (errors != null) {
      onError?.call(getErrorMessage("updating your facility's contact"));
    }
    final Map<String, dynamic>? data =
        responseMap['data'] as Map<String, dynamic>?;
    if (data?['addFacilityContact'] != null &&
        data?['addFacilityContact'] == true) {
      onSuccess?.call();

      await AnalyticsService().logEvent(
        name: addFacilityContactEvent,
        eventType: AnalyticsEventType.INTERACTION,
        parameters: <String, dynamic>{
          'facilityID': facilityID,
          'contact': phone,
        },
      );
    } else {
      onError?.call(getErrorMessage("updating your facility's contact"));
    }
    return state;
  }
}
