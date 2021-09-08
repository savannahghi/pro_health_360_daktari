import 'package:healthcloud/application/redux/actions/flags/app_flags.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:bewell_pro_core/application/core/services/helpers.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/presentation/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart';

class SaveKYCDetailsAction extends ReduxAction<CoreState> {
  SaveKYCDetailsAction({
    required this.context,
    required this.queryString,
    required this.variables,
    required this.kycName,
  });

  final BuildContext context;
  final String kycName;
  final String queryString;
  final Map<String, dynamic> variables;

  @override
  void after() {
    dispatch(WaitAction<CoreState>.remove(kycSavingFlag));
  }

  @override
  void before() {
    dispatch(WaitAction<CoreState>.add(kycSavingFlag));
  }

  @override
  Future<AppState?> reduce() async {
    final IGraphQlClient _client = AppWrapperBase.of(context)!.graphQLClient;

    final Response _response = await _client.query(queryString, variables);

    final Map<String, dynamic> _body = _client.toMap(_response);
    final int _statusCode = _response.statusCode;
    final String? _error = _client.parseError(_body);

    if (_error != null || _statusCode == 500 || _body['data'] == null) {
      await captureException(
        'Error while saving $kycName KYC',
        query: queryString,
        variables: variables,
        response: _body,
        error: _error,
      );
      showAlertSnackBar(context: context, title: '');
      return null;
    } else {
      UserFeedStore().refreshFeed.add(true);

      showAlertSnackBar(
          context: context, message: kycSaveSuccessMsg, title: '');
      await triggerNavigationEvent(context: context, route: homePageRoute);
    }
  }
}
