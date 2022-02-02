// Project imports:
import 'package:healthcloud/infrastructure/repository/database_base.dart';

final List<String> migrations = <String>[
  '''
  CREATE TABLE IF NOT EXISTS ${Tables.AuthCredentials.name} (id INTEGER PRIMARY KEY, 
          credentials TEXT)''',
  '''
  CREATE TABLE IF NOT EXISTS ${Tables.HomeState.name} (id INTEGER PRIMARY KEY, 
          homeState TEXT)''',
  '''
  CREATE TABLE IF NOT EXISTS ${Tables.OnboardingState.name} (id INTEGER PRIMARY KEY, 
          onboardingState TEXT)''',
  '''
  CREATE TABLE IF NOT EXISTS ${Tables.BottomNavigationState.name} (id INTEGER PRIMARY KEY, 
          bottomNavigationState TEXT)''',
  '''
  CREATE TABLE IF NOT EXISTS ${Tables.MiscState.name} (id INTEGER PRIMARY KEY, 
          miscState TEXT)''',
  '''
  CREATE TABLE IF NOT EXISTS ${Tables.StaffState.name} (id INTEGER PRIMARY KEY, 
          staffState TEXT)''',
  '''
  CREATE TABLE IF NOT EXISTS ${Tables.SurveyState.name} (id INTEGER PRIMARY KEY, 
          surveyState TEXT)''',
  '''
  CREATE TABLE IF NOT EXISTS ${Tables.ServiceRequestState.name} (id INTEGER PRIMARY KEY, 
          serviceRequestState TEXT)''',
];
