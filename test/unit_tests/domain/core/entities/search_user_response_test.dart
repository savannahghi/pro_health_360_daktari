// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:prohealth360_daktari/domain/core/entities/search_user/search_user_response.dart';

// Project imports:

import '../../../../mocks/mocks.dart';

void main() {
  group('SearchUserResponse', () {
    test('expects to convert SearchUserResponse from json', () {
      final SearchUserResponse mockResponse =
          SearchUserResponse.fromJson(mockClientResponse);
      expect(mockResponse, isA<SearchUserResponse>());
      expect(SearchUserResponse.initial(), isA<SearchUserResponse>());
    });
  });
}
