import 'package:healthcloud/infrastructure/repository/initialize_db.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:mockito/mockito.dart';
import 'package:user_feed/user_feed.dart' as feed_obj;
import 'package:flutter_graphql_client/graph_sqlite.dart';
import 'package:flutter_test/flutter_test.dart';

EmailAddress testEmailAddress = EmailAddress.withValue('demo@gmail.com');

class MockInitializeDB extends Mock implements InitializeDB<MockStateDB> {
  @override
  String get dbName =>
      super.noSuchMethod(Invocation.getter(#dbName), returnValue: 'testDb')
          as String;

  @override
  Future<MockStateDB> database({MockStateDB? preInitializedDB}) =>
      super.noSuchMethod(Invocation.getter(#database),
              returnValue: Future<MockStateDB>.value(MockStateDB()))
          as Future<MockStateDB>;
}

class MockStateDB extends Mock implements Database {
  @override
  Future<List<Map<String, Object?>>> rawQuery(String sql,
          [List<Object?>? arguments]) =>
      super.noSuchMethod(
        Invocation.method(#rawQuery, <dynamic>[sql, arguments]),
        returnValue: Future<List<Map<String, Object?>>>.value(
          <Map<String, Object?>>[
            <String, Object?>{'miscState': 10}
          ],
        ),
      ) as Future<List<Map<String, Object?>>>;

  @override
  Future<int> rawInsert(String sql, [List<Object?>? arguments]) =>
      super.noSuchMethod(
        Invocation.method(#rawInsert, <dynamic>[sql, arguments]),
        returnValue: Future<int>.value(10),
      ) as Future<int>;

  @override
  Batch batch() {
    throw UnimplementedError();
  }

  @override
  Future<void> close() {
    throw UnimplementedError();
  }

  @override
  Future<int> delete(String table, {String? where, List<Object?>? whereArgs}) {
    throw UnimplementedError();
  }

  @override
  Future<T> devInvokeMethod<T>(String method, [dynamic arguments]) {
    throw UnimplementedError();
  }

  @override
  Future<T> devInvokeSqlMethod<T>(String method, String sql,
      [List<Object?>? arguments]) {
    throw UnimplementedError();
  }

  @override
  Future<void> execute(String sql, [List<Object?>? arguments]) {
    throw UnimplementedError();
  }

  @override
  Future<int> getVersion() {
    throw UnimplementedError();
  }

  @override
  Future<int> insert(String table, Map<String, Object?> values,
      {String? nullColumnHack, ConflictAlgorithm? conflictAlgorithm}) {
    throw UnimplementedError();
  }

  @override
  bool get isOpen => true;

  @override
  String get path => 'test';

  @override
  Future<List<Map<String, Object?>>> query(String table,
      {bool? distinct,
      List<String>? columns,
      String? where,
      List<Object?>? whereArgs,
      String? groupBy,
      String? having,
      String? orderBy,
      int? limit,
      int? offset}) {
    throw UnimplementedError();
  }

  @override
  Future<int> rawDelete(String sql, [List<Object?>? arguments]) {
    throw UnimplementedError();
  }

  @override
  Future<int> rawUpdate(String sql, [List<Object?>? arguments]) {
    throw UnimplementedError();
  }

  @override
  Future<void> setVersion(int version) {
    throw UnimplementedError();
  }

  @override
  Future<T> transaction<T>(Future<T> Function(Transaction txn) action,
      {bool? exclusive}) {
    throw UnimplementedError();
  }

  @override
  Future<int> update(String table, Map<String, Object?> values,
      {String? where,
      List<Object?>? whereArgs,
      ConflictAlgorithm? conflictAlgorithm}) {
    throw UnimplementedError();
  }
}

final Map<String, dynamic> mockUserFeed = <String, dynamic>{
  'data': <String, dynamic>{
    'getFeed': <String, dynamic>{
      'uid': 'LMqDCyyciFMWHfOsvYa76L6dya73',
      'isAnonymous': false,
      'flavour': feed_obj.Flavour.PRO.name,
      'actions': <dynamic>[
        <String, dynamic>{
          'id': '1nO8hIc8ZXThjaqmQFL1XHVXgCp',
          'sequenceNumber': 1,
          'name': 'SEARCH_PATIENT',
          'actionType': feed_obj.ActionType.SECONDARY.name,
          'handling': feed_obj.Handling.FULL_PAGE.name,
          'allowAnonymous': false
        }
      ],
      'nudges': <dynamic>[
        <String, dynamic>{
          'id': '1608729954',
          'sequenceNumber': 1608729964,
          'visibility': feed_obj.Visibility.SHOW.name,
          'status': feed_obj.Status.PENDING.name,
          'title': 'Complete your rider KYC',
          'text':
              'Fill in your Be.Well business KYC in order to start transacting',
          'actions': <dynamic>[
            <String, dynamic>{
              'id': '1608647889',
              'sequenceNumber': 1608647899,
              'name': 'COMPLETE_INDIVIDUAL_RIDER_KYC',
              'actionType': feed_obj.ActionType.PRIMARY.name,
              'handling': feed_obj.Handling.FULL_PAGE.name,
              'allowAnonymous': false
            }
          ],
          'groups': <String>['hOcaUv8dqqgmWYf9HEhjdudgf0b2'],
          'users': <String>['hOcaUv8dqqgmWYf9HEhjdudgf0b2'],
          'links': <dynamic>[
            <String, dynamic>{
              'id': '1608729974',
              'url': 'https://assets.healthcloud.co.ke/bewell_logo.png',
              'linkType': feed_obj.LinkType.PNG_IMAGE.name
            }
          ],
          'notificationChannels': <String>[
            feed_obj.Channel.EMAIL.name,
            feed_obj.Channel.FCM.name
          ],
        },
      ],
      'items': <dynamic>[]
    },
  }
};
