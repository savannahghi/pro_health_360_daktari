// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:flutter_test/flutter_test.dart';
// Project imports:
import 'package:healthcloud/infrastructure/repository/database_base.dart';
import 'package:healthcloud/infrastructure/repository/database_mobile.dart';
import 'package:healthcloud/infrastructure/repository/initialize_db.dart';
import 'package:mockito/mockito.dart';

import '../../../mocks/mocks.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final MockStateDB mockDb = MockStateDB();

  final MockInitializeDB initDb = MockInitializeDB();

  when(initDb.database()).thenAnswer(
    (Invocation realInvocation) => Future<MockStateDB>.value(mockDb),
  );

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
      returnsNormally,
    );

    final InitializeDB<MockStateDB> initDB =
        InitializeDB<MockStateDB>(dbName: 'test_db');

    final AfyaMojaDatabaseMobile<MockStateDB> _db =
        AfyaMojaDatabaseMobile<MockStateDB>(initializeDB: initDB);

    expect(_db.clearDatabase(), throwsException);
  });

  test('should throw exception on real state db. Missing plugin', () {
    expect(() => InitializeDB<MockStateDB>(dbName: 'test_db'), returnsNormally);
    expect(
      () => InitializeDB<MockStateDB>(dbName: 'test_db').database(),
      throwsException,
    );

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
      buildWhenMock('homeState', 10);
      buildWhenMock('onboardingState', 10);
      buildWhenMock('bottomNavigationState', 10);
      buildWhenMock('miscState', 10);
      buildWhenMock('staffState', 10);
      buildWhenMock('surveyState', 10);
      buildWhenMock('serviceRequestState', 10);
      expect(await db.isDatabaseEmpty(), false);
    });

    test('isDatabaseEmpty should return true', () async {
      buildWhenMock('homeState', 0);
      buildWhenMock('onboardingState', 0);
      buildWhenMock('bottomNavigationState', 0);
      buildWhenMock('miscState', 0);
      buildWhenMock('staffState', 0);
      buildWhenMock('surveyState', 0);
      buildWhenMock('serviceRequestState', 0);
      expect(await db.isDatabaseEmpty(), true);
    });
  });

  test('retrieveState should return state from miscState table', () async {
    when(
      mockDb.rawQuery('SELECT * FROM miscState ORDER BY id DESC LIMIT 1'),
    ).thenAnswer(
      (_) => Future<List<Map<String, Object?>>>.value(
        <Map<String, Object?>>[
          <String, Object?>{'miscState': json.encode(mockUserFeed)}
        ],
      ),
    );

    expect(await db.retrieveState(Tables.MiscState), mockUserFeed);
  });

  test('saveState should call rawInsert', () async {
    final String tableName = Tables.HomeState.name;

    final String query = 'INSERT INTO $tableName($tableName) VALUES(?)';

    when(mockDb.rawInsert(query, <dynamic>[jsonEncode(mockUserFeed)]))
        .thenAnswer((_) => Future<int>.value(10));

    await db.saveState(data: mockUserFeed, table: Tables.HomeState);
    verify(await mockDb.rawInsert(query, <dynamic>[jsonEncode(mockUserFeed)]))
        .called(1);
  });
}
