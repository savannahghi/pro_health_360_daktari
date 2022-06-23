import 'dart:convert';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:prohealth360_daktari/domain/core/entities/core/get_stream_token.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:http/http.dart';

class StreamTokenProvider {
  final IGraphQlClient client;
  final String endpoint;

  StreamTokenProvider({required this.client, required this.endpoint});

  Future<String> tokenProvider(String userId) async {
    final Response httpResponse = await client.callRESTAPI(
      endpoint: endpoint,
      method: httpPOST,
      variables: <String, String>{'userID': userId},
    );

    final ProcessedResponse processedResponse =
        processHttpResponse(httpResponse);

    final Map<String, dynamic> responseBody =
        jsonDecode(httpResponse.body) as Map<String, dynamic>;

    if (processedResponse.ok) {
      final GetStreamToken result = GetStreamToken.fromJson(responseBody);

      return result.getStreamToken ?? '';
    }

    return '';
  }
}
