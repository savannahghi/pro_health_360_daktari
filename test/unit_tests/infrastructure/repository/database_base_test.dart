// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:healthcloud/infrastructure/repository/database_base.dart';
import 'package:healthcloud/infrastructure/repository/migrations.dart';

void main() {
  group('AfyaMojaDatabaseMobile', () {
    test('Tables enum returns correct values', () {
      expect(Tables.HomeState.name, 'homeState');
      expect(Tables.OnboardingState.name, 'onboardingState');
      expect(Tables.BottomNavigationState.name, 'bottomNavigationState');
      expect(Tables.MiscState.name, 'miscState');
      expect(Tables.StaffState.name, 'staffState');
      expect(Tables.SurveyState.name, 'surveyState');
      expect(Tables.ServiceRequestState.name, 'serviceRequestState');
    });

    test('migrations', () {
      expect(migrations, isA<List<String>>());
      expect(migrations.length, 7);
    });
  });
}
