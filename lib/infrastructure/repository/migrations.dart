import 'package:healthcloud/infrastructure/repository/database_base.dart';

final List<String> migrations = <String>[
  '''
  CREATE TABLE IF NOT EXISTS ${Tables.miscState.name} (id INTEGER PRIMARY KEY, 
          miscState TEXT)''',
  '''
  CREATE TABLE IF NOT EXISTS ${Tables.userFeedState.name} (id INTEGER PRIMARY KEY, 
          userFeedState TEXT)''',
  '''
  CREATE TABLE IF NOT EXISTS ${Tables.userState.name} (id INTEGER PRIMARY KEY, 
          userState TEXT)''',
  '''
  CREATE TABLE IF NOT EXISTS ${Tables.clinicalState.name} (id INTEGER PRIMARY KEY, 
          clinicalState TEXT)''',
  '''
  CREATE TABLE IF NOT EXISTS ${Tables.navigationState.name} (id INTEGER PRIMARY KEY, 
          navigationState TEXT)''',
  '''
  CREATE TABLE IF NOT EXISTS ${Tables.practitionerKYCState.name} (id INTEGER PRIMARY KEY, 
          practitionerKYCState TEXT)''',
  '''
  CREATE TABLE IF NOT EXISTS ${Tables.userRegistrationState.name} (id INTEGER PRIMARY KEY, 
          userRegistrationState TEXT)''',
];
