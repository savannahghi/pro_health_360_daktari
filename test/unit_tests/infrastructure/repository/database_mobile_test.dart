import 'dart:convert';
import 'package:healthcloud/infrastructure/repository/database_base.dart';
import 'package:healthcloud/infrastructure/repository/database_mobile.dart';
import 'package:healthcloud/infrastructure/repository/initialize_db.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../mocks/mocks.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final MockStateDB mockDb = MockStateDB();

  final MockInitializeDB initDb = MockInitializeDB();

  when(initDb.database()).thenAnswer(
      (Invocation realInvocation) => Future<MockStateDB>.value(mockDb));

  final AfyaMojaDatabaseMobile<MockStateDB> db =
      AfyaMojaDatabaseMobile<MockStateDB>(initializeDB: initDb);

  Future<List<Map<String, Object?>>> returnVal(int count) =>
      Future<List<Map<String, Object?>>>.value(
        <Map<String, Object?>>[
          <String, Object?>{'users': count}
        ],
      );

  test('should call initialize and clear database : mock', () {
    expect(() => InitializeDB<MockStateDB>(dbName: 'test_db'), returnsNormally);
    expect(
        () => InitializeDB<MockStateDB>(dbName: 'test_db')
            .database(preInitializedDB: mockDb),
        returnsNormally);

    final InitializeDB<MockStateDB> initDB =
        InitializeDB<MockStateDB>(dbName: 'test_db');

    final AfyaMojaDatabaseMobile<MockStateDB> _db =
        AfyaMojaDatabaseMobile<MockStateDB>(initializeDB: initDB);

    expect(_db.clearDatabase(), throwsException);
  });

  test('should throw exception on real state db. Missing plugin', () {
    expect(() => InitializeDB<MockStateDB>(dbName: 'test_db'), returnsNormally);
    expect(() => InitializeDB<MockStateDB>(dbName: 'test_db').database(),
        throwsException);

    final InitializeDB<MockStateDB> initDB =
        InitializeDB<MockStateDB>(dbName: 'test_db');

    final AfyaMojaDatabaseMobile<MockStateDB> _db =
        AfyaMojaDatabaseMobile<MockStateDB>(initializeDB: initDB);

    expect(_db.clearDatabase(), throwsException);
  });

  test('countTableRecords should return 0 entries when checking miscState',
      () async {
    when(mockDb.rawQuery('SELECT COUNT(*) FROM miscState'))
        .thenAnswer((_) async => returnVal(10));

    expect(await db.countTableRecords(Tables.MiscState), 10);
  });

  group('isDatabaseEmpty', () {
    void buildWhenMock(String arg, int count) {
      when(mockDb.rawQuery('SELECT COUNT(*) FROM $arg'))
          .thenAnswer((_) => returnVal(count));
    }

    test('isDatabaseEmpty should return false', () async {
      buildWhenMock('miscState', 10);
      buildWhenMock('userFeedState', 10);
      buildWhenMock('userState', 10);
      buildWhenMock('clinicalState', 10);
      buildWhenMock('navigationState', 10);
      buildWhenMock('practitionerKYCState', 10);
      buildWhenMock('userRegistrationState', 10);
      expect(await db.isDatabaseEmpty(), false);
    });

    test('isDatabaseEmpty should return true', () async {
      buildWhenMock('miscState', 0);
      buildWhenMock('userFeedState', 0);
      buildWhenMock('userState', 0);
      buildWhenMock('clinicalState', 0);
      buildWhenMock('navigationState', 0);
      buildWhenMock('practitionerKYCState', 0);
      buildWhenMock('userRegistrationState', 0);
      expect(await db.isDatabaseEmpty(), true);
    });
  });

  test('retrieveState should return state from userFeedState table', () async {
    when(mockDb
            .rawQuery('SELECT * FROM userFeedState ORDER BY id DESC LIMIT 1'))
        .thenAnswer(
      (_) => Future<List<Map<String, Object?>>>.value(
        <Map<String, Object?>>[
          <String, Object?>{'userFeedState': json.encode(mockUserFeed)}
        ],
      ),
    );

    expect(await db.retrieveState(Tables.UserFeedState), mockUserFeed);
  });

  test('saveState should call rawInsert', () async {
    final String tableName = Tables.UserFeedState.name;

    final String query = 'INSERT INTO $tableName($tableName) VALUES(?)';

    when(mockDb.rawInsert(query, <dynamic>[jsonEncode(mockUserFeed)]))
        .thenAnswer((_) => Future<int>.value(10));

    await db.saveState(data: mockUserFeed, table: Tables.UserFeedState);
    verify(await mockDb.rawInsert(query, <dynamic>[jsonEncode(mockUserFeed)]))
        .called(1);
  });
}
