// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:mycarehubpro/domain/core/entities/surveys/survey.dart';

import '../../../../../mocks/mocks.dart';

void main() {
  group('Survey', () {
    test('expects to convert Survey from json', () {
      expect(Survey.initial(), isA<Survey>());
      final Survey mockSurveyResponse = Survey.fromJson(mockSurvey);
      expect(mockSurveyResponse, isA<Survey>());
    });
  });
}
