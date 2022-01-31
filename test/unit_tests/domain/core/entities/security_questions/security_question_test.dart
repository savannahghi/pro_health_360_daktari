// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:healthcloud/domain/core/entities/security_questions/security_question.dart';
import '../../../../../mocks/mocks.dart';

void main() {
  group('SecurityQuestion', () {
    test('expects to convert SecurityQuestion from json', () {
      final SecurityQuestion mockQuestion =
          SecurityQuestion.fromJson(mockSecurityQuestion);
      expect(mockQuestion, isA<SecurityQuestion>());
    });

    test('SecurityQuestion toJson', () {
      expect(
        SecurityQuestion(
          id: 'id',
          questionStem: 'question_stem',
          description: 'description',
          responseType: 'response_type',
          flavour: 'flavour',
          active: true,
          sequence: 1,
        ).toJson(),
        mockSecurityQuestion,
      );
    });
  });
}
