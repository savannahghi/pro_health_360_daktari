// Package imports:
import 'package:flutter_test/flutter_test.dart';
// Project imports:
import 'package:mycarehubpro/domain/core/entities/health_diary/health_diary_entry.dart';

import '../../../mocks/mocks.dart';

void main() {
  test('HealthDiaryEntry should convert to/from JSON', () {
    expect(HealthDiaryEntry.initial().toJson().containsKey('mood'), true);

    expect(HealthDiaryEntry.fromJson(mockDiaryEntries.first).mood, 'HAPPY');
  });
}
