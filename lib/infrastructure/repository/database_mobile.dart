import 'dart:async';
import 'dart:convert';
import 'package:healthcloud/infrastructure/repository/database_base.dart';
import 'package:healthcloud/infrastructure/repository/initialize_db.dart';
import 'package:healthcloud/infrastructure/repository/sqlite.dart';
import 'package:sqflite/sqflite.dart';

/// [BeWellDatabaseMobile] is the main entry for interacting with the database for healthcloud mobile
/// It uses sqlite which is a common RDMS. Unlike other key:value storage, sqlite offers
/// high flexibility when storing structured data.
/// The idea is to store, sessions, permissions(highly structured) and anything else
/// that required persistence.
/// When a new state has been added, it needs to be serialized so that it may be saved in the database
/// The command to serialize is [flutter pub run build_runner build --delete-conflicting-outputs]
/// Ref : https://flutter.dev/docs/development/data-and-backend/json
///     : https://pub.dev/packages/built_value
class BeWellDatabaseMobile<T extends DatabaseExecutor>
    implements BeWellDatabaseBase<T> {
  BeWellDatabaseMobile({this.initializeDB});

  final InitializeDB<T>? initializeDB;

  /// [database] creates and returns an instance of the database as a future
  @override
  Future<T> get database async {
    return initializeDB!.database();
  }

  @override
  Future<void> clearDatabase() =>
      clearDatabaseHelper(this.initializeDB!.dbName);

  @override
  Future<int> countTableRecords(Tables table) async {
    final T _db = await this.database;
    final int? count = Sqflite.firstIntValue(
        await _db.rawQuery('SELECT COUNT(*) FROM ${table.name}'));
    return Future<int>.value(count);
  }

  @override
  Future<bool> isDatabaseEmpty() async {
    final int t1 = await countTableRecords(Tables.miscState);
    final int t2 = await countTableRecords(Tables.userFeedState);
    final int t3 = await countTableRecords(Tables.userState);
    final int t4 = await countTableRecords(Tables.clinicalState);
    final int t5 = await countTableRecords(Tables.navigationState);
    final int t6 = await countTableRecords(Tables.practitionerKYCState);

    final int counts = t1 + t2 + t3 + t4 + t5 + t6;
    if (counts > 0) {
      return false;
    }
    return true;
  }

  Future<Map<String, dynamic>> retrieveWorker(Tables table) async {
    final T _db = await this.database;
    final List<Map<dynamic, dynamic>> states = await _db
        .rawQuery('SELECT * FROM ${table.name} ORDER BY id DESC LIMIT 1');
    final Map<String, dynamic> _state = Map<String, dynamic>.from(states.first);

    return _state;
  }

  /// [retrieveState] get the current states.
  @override
  Future<Map<String, dynamic>> retrieveState(Tables table) async {
    final Map<String, dynamic> _state = await retrieveWorker(table);

    final dynamic state = json.decode(_state[table.name] as String);

    return state as Map<String, dynamic>;
  }

  /// [saveState] saves the current states by an [INSERT] in the database
  /// IMPORTANT: THIS METHOD WORKS ON THE ASSUMPTION THAT THE TABLE NAME
  /// MATCHES THE INSERTION FIELD NAME
  @override
  Future<void> saveState(
      {required Map<String, dynamic> data, required Tables table}) async {
    final String _tableName = table.name;

    final T _db = await this.database;
    final String dataAsString = jsonEncode(data);
    await _db.rawInsert('INSERT INTO $_tableName($_tableName) VALUES(?)',
        <dynamic>[dataAsString]);
    return;
  }
}
