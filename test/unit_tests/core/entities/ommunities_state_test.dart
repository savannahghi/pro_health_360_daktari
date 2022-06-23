// Package imports:

import 'package:flutter_test/flutter_test.dart';
import 'package:prohealth360_daktari/application/redux/states/communities_state.dart';

import '../../../mocks/mocks.dart';

void main() {
  test('CommunitiesState fromJson', () {
    expect(CommunitiesState.initial(), isA<CommunitiesState>());
    expect(
      CommunitiesState.fromJson(mockCommunitiesState),
      isA<CommunitiesState>(),
    );
  });
}
