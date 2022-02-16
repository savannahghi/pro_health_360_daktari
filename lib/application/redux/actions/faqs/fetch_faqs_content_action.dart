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
import 'package:healthcloud/application/core/graphql/queries.dart';
import 'package:healthcloud/application/redux/actions/faqs/update_faqs_content_action.dart';
import 'package:healthcloud/application/redux/actions/flags/app_flags.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:http/http.dart' as http;
import 'package:misc_utilities/misc.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
// Project imports:
import 'package:user_feed/user_feed.dart' as user_feed;

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
      'flavour': user_feed.Flavour.CONSUMER.name,
      'limit': limit,
    });

    final Map<String, dynamic> body = _client.toMap(result);

    final String? error = parseError(body);

    if (error != null) {
      Sentry.captureException(
        UserException(error),
      );

      dispatch(UpdateFAQsContentAction(errorFetchingFAQs: true));
      return null;
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
