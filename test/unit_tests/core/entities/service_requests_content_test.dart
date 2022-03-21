import 'package:flutter_test/flutter_test.dart';
import 'package:mycarehubpro/domain/core/entities/service_requests/service_request_content.dart';

void main() {
  group('ServiceRequestContent', () {
    test('expects to convert ServiceRequestContent from json', () {
      final ServiceRequestContent mockResponse =
          ServiceRequestContent.fromJson(<String, dynamic>{
        'getServiceRequests': <dynamic>[],
      });
      expect(mockResponse, isA<ServiceRequestContent>());
    });
  });
}
