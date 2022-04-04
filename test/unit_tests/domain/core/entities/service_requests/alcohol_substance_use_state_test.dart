// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:mycarehubpro/application/redux/states/service_requests/alcohol_substance_use_state.dart';

void main() {
  final Map<String, dynamic> data = <String, dynamic>{
    'screeningQuestionItems': <dynamic>[],
  };
  test('AlcoholSubstanceUseState fromJson', () {
    expect(
      AlcoholSubstanceUseState.fromJson(data),
      isA<AlcoholSubstanceUseState>(),
    );
  });
}
