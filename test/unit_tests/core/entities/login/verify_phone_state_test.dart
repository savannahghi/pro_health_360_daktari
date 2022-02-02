// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:healthcloud/domain/core/entities/login/verify_phone_state.dart';

import '../../../../mocks/mocks.dart';

void main() {
  test('VerifyPhoneState fromJson', () {
    expect(
      VerifyPhoneState.fromJson(mockVerifyPhoneState),
      isA<VerifyPhoneState>(),
    );
    expect(VerifyPhoneState.initial(), isA<VerifyPhoneState>());
  });
}
