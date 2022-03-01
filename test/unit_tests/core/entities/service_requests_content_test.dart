import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:healthcloud/domain/core/entities/service_requests/service_request_content.dart';

void main() {
  group('ServiceRequestContent', () {
    test('expects to convert ServiceRequestContent from json', () {
      final ServiceRequestContent mockResponse =
          ServiceRequestContent.fromJson(<String, dynamic>{
        'getServiceRequests': <dynamic>[],
      });
      expect(mockResponse, isA<ServiceRequestContent>());
    });
    test('expects to ServiceRequestContent,initial to return UNKNOWN', () {
      final ServiceRequestContent mockResponse =
          ServiceRequestContent.initial();
      expect(mockResponse.clientName, UNKNOWN);
    });
  });
}
