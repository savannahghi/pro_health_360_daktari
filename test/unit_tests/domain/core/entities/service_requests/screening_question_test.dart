// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mycarehubpro/application/redux/states/service_requests/screening_question.dart';

void main() {
  final Map<String, dynamic> data = <String, dynamic>{
    'questionText': UNKNOWN,
    'answer': UNKNOWN,
  };
  test('ScreeningQuestion toJson', () {
    expect(
      ScreeningQuestion.initial().toJson(),
      data,
    );
  });

  test('ScreeningQuestion fromJson', () {
    expect(
      ScreeningQuestion.fromJson(data),
      isA<ScreeningQuestion>(),
    );
  });
}
