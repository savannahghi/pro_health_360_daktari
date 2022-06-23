import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prohealth360_daktari/application/core/services/analytics_service.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_enums.dart';

import '../../mocks/mocks.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('AnalyticsService', () {
    final List<MethodCall> methodCallLog = <MethodCall>[];

    setUp(() async {
      setupFirebaseAnalyticsMocks(
        updateLogFunc: (MethodCall call) => methodCallLog.add(call),
      );

      await Firebase.initializeApp();
    });

    tearDown(() => methodCallLog.clear());

    test('should return the correct analytics observer', () {
      expect(
        AnalyticsService().getAnalyticsObserver(),
        isA<FirebaseAnalyticsObserver>(),
      );
    });

    test(
      'should initialize the analytics setup and set all properties correctly',
      () async {
        await AnalyticsService().init(environment: 'test');

        expect(methodCallLog.length, 4);
        expect(methodCallLog, <Matcher>[
          isMethodCall(
            'Analytics#setAnalyticsCollectionEnabled',
            arguments: <String, bool>{'enabled': true},
          ),
          isMethodCall(
            'Analytics#setUserProperty',
            arguments: <String, String>{
              'name': 'program',
              'value': 'myCareHub',
            },
          ),
          isMethodCall(
            'Analytics#setUserProperty',
            arguments: <String, Object>{
              'name': 'flavour',
              'value': 'PRO',
            },
          ),
          isMethodCall(
            'Analytics#setUserProperty',
            arguments: <String, Object>{
              'name': 'environment',
              'value': 'test',
            },
          ),
        ]);
      },
    );

    test('should reset the current user ID', () async {
      await AnalyticsService().reset();

      expect(methodCallLog.length, 1);
      expect(methodCallLog, <Matcher>[
        isMethodCall(
          'Analytics#setUserId',
          arguments: <String, dynamic>{'userId': null},
        ),
      ]);
    });

    test('should set the current user ID', () async {
      await AnalyticsService().setUserId('test-user-id');

      expect(methodCallLog.length, 1);
      expect(methodCallLog, <Matcher>[
        isMethodCall(
          'Analytics#setUserId',
          arguments: <String, dynamic>{'userId': 'test-user-id'},
        ),
      ]);
    });

    test('should set the current user facility', () async {
      await AnalyticsService().setUserFacility('test-user-facility-id');

      expect(methodCallLog.length, 1);
      expect(methodCallLog, <Matcher>[
        isMethodCall(
          'Analytics#setUserProperty',
          arguments: <String, Object>{
            'name': 'facilityID',
            'value': 'test-user-facility-id',
          },
        ),
      ]);
    });

    test(
      'should log an event when the userID and user names are available',
      () async {
        await AnalyticsService().logEvent(
          name: 'testEvent',
          eventType: AnalyticsEventType.AUTH,
          parameters: <String, dynamic>{'test_param': 'value'},
        );

        expect(methodCallLog.length, 1);
        expect(methodCallLog.first, isA<MethodCall>());
        expect(
          methodCallLog,
          <Matcher>[
            isMethodCall(
              'Analytics#logEvent',
              arguments: <String, dynamic>{
                'eventName': 'testEvent',
                'parameters': <String, dynamic>{
                  'eventType': 'AUTH',
                  'test_param': 'value',
                },
              },
            )
          ],
        );
      },
    );
  });
}
