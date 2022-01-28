import 'package:flutter_test/flutter_test.dart';
import 'package:healthcloud/application/redux/states/staff_state.dart';

import '../../../../mocks/mocks.dart';

void main() {
  group('StaffState', () {
    test('fromJson', () {
      expect(
        StaffState.fromJson(mockStaffState),
        StaffState.initial(),
      );
    });
  });
}
