// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:mycarehubpro/application/redux/states/service_requests/contraceptive_state.dart';

void main() {
  final Map<String, dynamic> data = <String, dynamic>{
    'screeningQuestionItems': <dynamic>[],
  };
  test('ContraceptiveState fromJson', () {
    expect(
      ContraceptiveState.fromJson(data),
      isA<ContraceptiveState>(),
    );
  });
}
