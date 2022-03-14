// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:mycarehubpro/application/redux/states/service_requests_state.dart';

void main() {
  group('ServiceRequestState', () {
    test('fromJson', () {
      // ServiceRequestState is empty for now. Test should probably change once
      // class is implemented
      expect(
        ServiceRequestState.fromJson(<String, dynamic>{}),
        isA<ServiceRequestState>(),
      );
    });
  });
}
