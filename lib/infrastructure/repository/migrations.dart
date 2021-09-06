import 'package:healthcloud/infrastructure/repository/database_base.dart';

final List<String> migrations = <String>[
  '''
  CREATE TABLE IF NOT EXISTS ${Tables.MiscState.name} (id INTEGER PRIMARY KEY, 
          miscState TEXT)''',
  '''
  CREATE TABLE IF NOT EXISTS ${Tables.UserFeedState.name} (id INTEGER PRIMARY KEY, 
          userFeedState TEXT)''',
  '''
  CREATE TABLE IF NOT EXISTS ${Tables.UserState.name} (id INTEGER PRIMARY KEY, 
          userState TEXT)''',
  '''
  CREATE TABLE IF NOT EXISTS ${Tables.ClinicalState.name} (id INTEGER PRIMARY KEY, 
          clinicalState TEXT)''',
  '''
  CREATE TABLE IF NOT EXISTS ${Tables.NavigationState.name} (id INTEGER PRIMARY KEY, 
          navigationState TEXT)''',
  '''
  CREATE TABLE IF NOT EXISTS ${Tables.PractitionerKYCState.name} (id INTEGER PRIMARY KEY, 
          practitionerKYCState TEXT)''',
  '''
  CREATE TABLE IF NOT EXISTS ${Tables.UserRegistrationState.name} (id INTEGER PRIMARY KEY, 
          userRegistrationState TEXT)''',
];
