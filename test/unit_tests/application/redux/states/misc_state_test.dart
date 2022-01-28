import 'package:flutter_test/flutter_test.dart';
import 'package:healthcloud/application/redux/states/misc_state.dart';

import '../../../../mocks/mocks.dart';

void main() {
  group('MiscState', () {
    test('fromJson', () {
      expect(
        MiscState.fromJson(mockMiscState),
        MiscState.initial(),
      );
    });
  });
}
