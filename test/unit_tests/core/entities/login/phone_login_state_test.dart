// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:healthcloud/domain/core/entities/login/phone_login_state.dart';

import '../../../../mocks/mocks.dart';

void main() {
  test('PhoneLoginState fromJson', () {
    expect(
      PhoneLoginState.fromJson(mockPhoneLoginState),
      isA<PhoneLoginState>(),
    );
    expect(PhoneLoginState.initial(), isA<PhoneLoginState>());
  });
}
