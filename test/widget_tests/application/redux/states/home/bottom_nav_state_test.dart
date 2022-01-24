import 'package:flutter_test/flutter_test.dart';
import 'package:healthcloud/application/redux/states/home/bottom_nav_state.dart';

void main() {
  group('BottomNavigationState', () {
    test('fromJson works correctly', () {
      final BottomNavigationState mockBottomNavigationState =
          BottomNavigationState.fromJson(
        BottomNavigationState.initial().toJson(),
      );

      expect(mockBottomNavigationState, isA<BottomNavigationState>());
    });
  });
}
