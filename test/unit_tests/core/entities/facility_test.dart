// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:healthcloud/domain/core/entities/core/facility.dart';
import '../../../mocks/mocks.dart';

void main() {
  test('Facility fromJson', () {
    expect(
      Facility.fromJson(mockFacility),
      isA<Facility>(),
    );
    expect(Facility.initial(), isA<Facility>());
  });
}
