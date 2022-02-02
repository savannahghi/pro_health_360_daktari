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
    when(mockDb.rawQuery('SELECT COUNT(*) FROM ${Tables.MiscState.name}'))
        .thenAnswer((_) async => returnVal(10));

    expect(await db.countTableRecords(Tables.MiscState), 10);
  });

  group('isDatabaseEmpty', () {
    void buildWhenMock(String arg, int count) {
      when(mockDb.rawQuery('SELECT COUNT(*) FROM $arg'))
          .thenAnswer((_) => returnVal(count));
    }

    test('isDatabaseEmpty should return false', () async {
      buildWhenMock('credentials', 10);
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
      buildWhenMock('credentials', 0);
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
  test('retrieveWorker should return record from database', () async {
    when(
      mockDb.rawQuery(
        'SELECT * FROM bottomNavigationState ORDER BY id DESC LIMIT 1',
      ),
    ).thenAnswer((_) => returnVal(4));
    expect(
      await db.retrieveWorker(Tables.BottomNavigationState),
      <String, Object?>{'users': 4},
    );
  });

  test('retrieveState should return state from bottomNavigationState table',
      () async {
    when(
      mockDb.rawQuery(
        'SELECT * FROM bottomNavigationState ORDER BY id DESC LIMIT 1',
      ),
    ).thenAnswer(
      (_) => Future<List<Map<String, Object?>>>.value(<Map<String, Object?>>[
        <String, Object?>{
          'bottomNavigationState':
              json.encode(<String, String>{'currentBottomNavIndex': '2'})
        }
      ]),
    );
    expect(
      await db.retrieveState(Tables.BottomNavigationState),
      <String, String>{'currentBottomNavIndex': '2'},
    );
  });

  test('saveState should call rawInsert', () async {
    final String tableName = Tables.BottomNavigationState.name;
    final Map<String, dynamic> data = <String, dynamic>{
      'currentBottomNavIndex': 1
    };
    final String query = 'INSERT INTO $tableName($tableName) VALUES(?)';
    when(mockDb.rawInsert(query, <dynamic>[jsonEncode(data)]))
        .thenAnswer((_) => Future<int>.value(1));
    await db.saveState(data: data, table: Tables.BottomNavigationState);
    verify(await mockDb.rawInsert(query, <dynamic>[jsonEncode(data)]))
        .called(1);
  });
}
