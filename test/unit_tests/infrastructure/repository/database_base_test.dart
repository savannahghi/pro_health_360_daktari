import 'package:healthcloud/infrastructure/repository/database_base.dart';
import 'package:healthcloud/infrastructure/repository/migrations.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AfyaMojaDatabaseMobile', () {
    test('Tables enum returns correct values', () {
      expect(Tables.miscState.name, 'miscState');
      expect(Tables.userFeedState.name, 'userFeedState');
      expect(Tables.userState.name, 'userState');
      expect(Tables.clinicalState.name, 'clinicalState');
      expect(Tables.navigationState.name, 'navigationState');
      expect(Tables.practitionerKYCState.name, 'practitionerKYCState');
      expect(Tables.userRegistrationState.name, 'userRegistrationState');
    });

    test('migrations', () {
      expect(migrations, isA<List<String>>());
      expect(migrations.length, 7);
    });
  });
}
