// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:myharehubpro/domain/core/entities/register_client/list_facilities_response.dart';

import '../../../../../mocks/mocks.dart';

void main() {
  group('ListFacilitiesResponse', () {
    test('expects to convert NotificationDetails from json', () {
      final ListFacilitiesResponse mockListFacilitiesResponse =
          ListFacilitiesResponse.fromJson(mockListFacilities);
      expect(mockListFacilitiesResponse, isA<ListFacilitiesResponse>());
    });
  });
}
