// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:healthcloud/domain/core/entities/login/create_pin.dart';

import '../../../../mocks/mocks.dart';

void main() {
  test('CreatePINState fromJson', () {
    expect(
      CreatePINState.fromJson(mockCreatePin),
      isA<CreatePINState>(),
    );
    expect(CreatePINState.initial(), isA<CreatePINState>());
  });
}
