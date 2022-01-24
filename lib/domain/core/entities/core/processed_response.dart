import 'package:http/http.dart' as http;

/// A blueprint for the data returned after processing a response from an
/// unauthenticated endpoint
class ProcessedResponse {
  final bool ok;
  final http.Response response;
  final String? message;

  ProcessedResponse({required this.ok, required this.response, this.message});
}
