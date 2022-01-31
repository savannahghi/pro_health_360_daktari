// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:healthcloud/application/redux/states/onboarding_state.dart';

void main() {
  group('OnboardingState', () {
    test('fromJson', () {
      // OnboardingState is empty for now. Test should probably change once
      // class is implemented
      expect(
        OnboardingState.fromJson(<String, dynamic>{}),
        isA<OnboardingState>(),
      );
    });
  });
}
