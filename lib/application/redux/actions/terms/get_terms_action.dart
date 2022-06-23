// Dart imports:
import 'dart:async';
import 'dart:convert';

// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:prohealth360_daktari/application/core/graphql/queries.dart';
import 'package:prohealth360_daktari/application/redux/actions/core/batch_update_misc_state_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/actions/terms/update_terms_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/entities/terms/terms_and_conditions_response.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:http/http.dart' as http;
import 'package:sentry_flutter/sentry_flutter.dart';

class GetTermsAction extends ReduxAction<AppState> {
  GetTermsAction({required this.client});

  final IGraphQlClient client;

  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(getTermsFlag));
    dispatch(BatchUpdateMiscStateAction(error: UNKNOWN));
  }

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(getTermsFlag));
    super.after();
  }

  @override
  Future<AppState?> reduce() async {
    final http.Response result = await client
        .query(getTermsQuery, <String, dynamic>{'flavour': Flavour.pro.name});

    final Map<String, dynamic> body = client.toMap(result);

    client.close();

    final Map<String, dynamic> responseMap =
        json.decode(result.body) as Map<String, dynamic>;

    final String? error = client.parseError(body);
    if (error != null || responseMap.isEmpty) {
      dispatch(BatchUpdateMiscStateAction(error: somethingWentWrongText));
      Sentry.captureException(UserException(error));
      return null;
    }

    final TermsAndConditionsResponse termsAndConditionsResponse =
        TermsAndConditionsResponse.fromJson(
      responseMap['data'] as Map<String, dynamic>,
    );

    dispatch(
      UpdateTermsAndConditionsAction(
        id: termsAndConditionsResponse.termsAndConditions.termsId,
        termsString: termsAndConditionsResponse.termsAndConditions.text,
      ),
    );

    return state;
  }
}
