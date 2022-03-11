// Dart imports:
// ignore_for_file: unused_local_variable

import 'dart:async';
import 'dart:convert';

// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart' as http;
import 'package:myharehubpro/application/core/graphql/queries.dart';
import 'package:myharehubpro/application/redux/actions/faqs/update_faqs_content_action.dart';
import 'package:myharehubpro/application/redux/actions/flags/app_flags.dart';
import 'package:myharehubpro/application/redux/states/app_state.dart';
import 'package:myharehubpro/domain/core/value_objects/app_strings.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
// Project imports:

class FetchFAQSContentAction extends ReduxAction<AppState> {
  FetchFAQSContentAction({
    required this.context,
    this.limit = 10,
  });

  final BuildContext context;
  final int limit;

  @override
  void before() {
    dispatch(WaitAction<AppState>.add(getFAQsFlag));
    super.before();
  }

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(getFAQsFlag));
    super.after();
  }

  @override
  Future<AppState?> reduce() async {
    final IGraphQlClient _client = AppWrapperBase.of(context)!.graphQLClient;

    final http.Response result =
        await _client.query(getFAQContentQuery, <String, dynamic>{
      'flavour': Flavour.pro.name,
      'limit': limit,
    });

    final Map<String, dynamic> body = _client.toMap(result);

    final String? errors = _client.parseError(body);

    if (errors != null) {
      Sentry.captureException(
        UserException(errors),
      );

      throw const UserException(somethingWentWrongText);
    }

    final Map<String, dynamic> responseMap =
        json.decode(result.body) as Map<String, dynamic>;

    final FAQContentResponse profileFAQsData = FAQContentResponse.fromJson(
      responseMap['data'] as Map<String, dynamic>,
    );

    if (profileFAQsData.profileFAQsContent != null) {
      final List<FAQContent>? items = profileFAQsData.profileFAQsContent;

      if (items != null && items.isNotEmpty) {
        dispatch(
          UpdateFAQsContentAction(
            profileFAQs: profileFAQsData.profileFAQsContent,
          ),
        );
      } else {
        dispatch(
          UpdateFAQsContentAction(
            profileFAQs: <FAQContent>[],
            errorFetchingFAQs: false,
            timeoutFetchingFAQs: false,
          ),
        );
      }
    }

    return state;
  }
}
