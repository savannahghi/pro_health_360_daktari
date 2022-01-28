import 'package:flutter_test/flutter_test.dart';
import 'package:healthcloud/application/redux/states/home_state.dart';

void main() {
  group('HomeState', () {
    test('fromJson', () {
      // HomeState is empty for now. Test should probably change once
      // class is implemented
      expect(
        HomeState.fromJson(<String, dynamic>{}),
        isA<HomeState>(),
      );
    });
  });
}
