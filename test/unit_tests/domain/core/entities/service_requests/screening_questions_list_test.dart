// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mycarehubpro/application/redux/states/service_requests/screening_questions_list.dart';

void main() {
  final Map<String, dynamic> data = <String, dynamic>{
    'name': UNKNOWN,
    'date': UNKNOWN,
    'screeningQuestionsList': <dynamic>[],
  };
  test('ScreeningQuestionsList toJson', () {
    expect(
      ScreeningQuestionsList.initial().toJson(),
      data,
    );
  });

  test('ScreeningQuestion fromJson', () {
    expect(
      ScreeningQuestionsList.fromJson(data),
      isA<ScreeningQuestionsList>(),
    );
  });
}
