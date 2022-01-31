// Package imports:
import 'package:domain_objects/value_objects.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:healthcloud/application/core/services/utils.dart';

void main() {
  group('Utils', () {
    test('genderFromJson should return correct values', () async {
      expect(genderFromJson('MALE'), Gender.male);
      expect(genderFromJson(''), Gender.unknown);
    });

    test('genderToJson should return correct values', () async {
      expect(genderToJson(Gender.male), 'MALE');
    });
  });
}
