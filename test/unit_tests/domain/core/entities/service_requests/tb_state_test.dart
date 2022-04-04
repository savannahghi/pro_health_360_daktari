// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:mycarehubpro/application/redux/states/service_requests/tb_state.dart';

void main() {
  final Map<String, dynamic> data = <String, dynamic>{
    'screeningQuestionItems': <dynamic>[],
  };
  test('TBState fromJson', () {
    expect(
      TBState.fromJson(data),
      isA<TBState>(),
    );
  });
}
