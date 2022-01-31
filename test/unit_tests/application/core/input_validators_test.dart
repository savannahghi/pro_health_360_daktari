// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:healthcloud/application/core/services/input_invalidators.dart';

void main() {
  group('InputValidators', () {
    test('should validate a user PIN', () {
      expect(
        InputValidators.validatePin(value: ''),
        'A 4 digit PIN is required',
      );
      expect(
        InputValidators.validatePin(value: '123x'),
        'Only numbers are allowed, 0-9',
      );
      expect(
        InputValidators.validatePin(value: '123'),
        'Enter a four digit PIN',
      );

      expect(
        InputValidators.validatePin(
          value: '1234',
          initiallyEnteredPin: '0000',
        ),
        'PINs do not match',
      );

      expect(InputValidators.validatePin(value: '1234'), isNull);
      expect(
        InputValidators.validatePin(
          value: '1234',
          initiallyEnteredPin: '1234',
        ),
        isNull,
      );
    });
  });
}
