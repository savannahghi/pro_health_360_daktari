import 'package:healthcloud/infrastructure/repository/database_base.dart';
import 'package:healthcloud/infrastructure/repository/migrations.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AfyaMojaDatabaseMobile', () {
    test('Tables enum returns correct values', () {
      expect(Tables.MiscState.name, 'miscState');
      expect(Tables.UserFeedState.name, 'userFeedState');
      expect(Tables.UserState.name, 'userState');
      expect(Tables.ClinicalState.name, 'clinicalState');
      expect(Tables.NavigationState.name, 'navigationState');
      expect(Tables.PractitionerKYCState.name, 'practitionerKYCState');
      expect(Tables.UserRegistrationState.name, 'userRegistrationState');
    });

    test('migrations', () {
      expect(migrations, isA<List<String>>());
      expect(migrations.length, 7);
    });
  });
}
