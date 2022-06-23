// Package imports:

import 'package:flutter_test/flutter_test.dart';
// Project imports:
import 'package:prohealth360_daktari/domain/core/entities/community_members/community.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_enums.dart';

import '../../../mocks/mocks.dart';

void main() {
  test('Community fromJson', () {
    final Community community = Community.fromJson(mockCommunity);

    expect(
      Community.fromJson(mockCommunity),
      isA<Community>(),
    );

    expect(community.clientType?.first.name, ClientType.PMTCT.name);
  });
}
