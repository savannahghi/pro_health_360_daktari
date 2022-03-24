// Package imports:

import 'package:flutter_test/flutter_test.dart';
// Project imports:
import 'package:mycarehubpro/domain/core/entities/community_members/community.dart';

import '../../../mocks/mocks.dart';

void main() {
  test('Community fromJson', () {
    expect(Community.initial(), isA<Community>());
    expect(
      Community.fromJson(mockCommunity),
      isA<Community>(),
    );
  });
}
