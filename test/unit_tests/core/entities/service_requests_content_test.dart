import 'package:flutter_test/flutter_test.dart';
import 'package:prohealth360_daktari/domain/core/entities/service_requests/service_request.dart';

void main() {
  group('ServiceRequest', () {
    test('expects to convert ServiceRequest from json', () {
      final ServiceRequest mockResponse =
          ServiceRequest.fromJson(<String, dynamic>{
        'getServiceRequests': <dynamic>[],
      });
      expect(mockResponse, isA<ServiceRequest>());
    });
  });
}
