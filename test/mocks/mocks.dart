import 'dart:convert';

import 'package:afya_moja_core/afya_moja_core.dart' as core;
import 'package:connectivity_plus_platform_interface/connectivity_plus_platform_interface.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_messaging_platform_interface/firebase_messaging_platform_interface.dart';
// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:flutter_graphql_client/graph_sqlite.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:mycarehubpro/application/core/graphql/mutations.dart';
import 'package:mycarehubpro/application/core/graphql/queries.dart';
// Project imports:
import 'package:mycarehubpro/domain/core/value_objects/app_asset_strings.dart';
import 'package:mycarehubpro/infrastructure/repository/initialize_db.dart';
import 'package:mycarehubpro/presentation/router/routes.dart';
// Project imports:
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockBuildContext extends Mock implements BuildContext {}

typedef DidNavigate = void Function(
  Route<dynamic>? route,
  Route<dynamic>? previousRoute,
);
const String testString = 'test';

class TestNavigatorObserver extends NavigatorObserver {
  TestNavigatorObserver({this.onPop, this.onPush});

  final DidNavigate? onPop;
  final DidNavigate? onPush;

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) =>
      onPop?.call(route, previousRoute);

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    onPush?.call(route, previousRoute);
  }
}

class MockInitializeDB extends Mock implements InitializeDB<MockStateDB> {
  @override
  String get dbName =>
      super.noSuchMethod(Invocation.getter(#dbName), returnValue: 'testDb')
          as String;

  @override
  Future<MockStateDB> database({MockStateDB? preInitializedDB}) =>
      super.noSuchMethod(
        Invocation.getter(#database),
        returnValue: Future<MockStateDB>.value(MockStateDB()),
      ) as Future<MockStateDB>;
}

const Size tabletLandscape = Size(1280, 720);
const Size typicalLargePhoneScreenSizePortrait = Size(300, 800);

class MockStateDB extends Mock implements Database {
  @override
  Future<List<Map<String, Object?>>> rawQuery(
    String sql, [
    List<Object?>? arguments,
  ]) =>
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
  Future<T> devInvokeSqlMethod<T>(
    String method,
    String sql, [
    List<Object?>? arguments,
  ]) {
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
  Future<int> insert(
    String table,
    Map<String, Object?> values, {
    String? nullColumnHack,
    ConflictAlgorithm? conflictAlgorithm,
  }) {
    throw UnimplementedError();
  }

  @override
  bool get isOpen => true;

  @override
  String get path => 'test';

  @override
  Future<List<Map<String, Object?>>> query(
    String table, {
    bool? distinct,
    List<String>? columns,
    String? where,
    List<Object?>? whereArgs,
    String? groupBy,
    String? having,
    String? orderBy,
    int? limit,
    int? offset,
  }) {
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
  Future<T> transaction<T>(
    Future<T> Function(Transaction txn) action, {
    bool? exclusive,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<int> update(
    String table,
    Map<String, Object?> values, {
    String? where,
    List<Object?>? whereArgs,
    ConflictAlgorithm? conflictAlgorithm,
  }) {
    throw UnimplementedError();
  }
}

class MockConnectivityPlatform extends Mock
    with MockPlatformInterfaceMixin
    implements ConnectivityPlatform {
  MockConnectivityPlatform({List<ConnectivityResult>? connectivityValues})
      : connectivityValues = connectivityValues ??
            <ConnectivityResult>[ConnectivityResult.mobile];

  final List<ConnectivityResult> connectivityValues;

  @override
  Future<ConnectivityResult> checkConnectivity() async {
    return connectivityValues.last;
  }

  @override
  Stream<ConnectivityResult> get onConnectivityChanged {
    return Stream<ConnectivityResult>.fromIterable(connectivityValues);
  }
}

final Map<String, dynamic> mockPrimaryContact = <String, dynamic>{
  'active': true,
  'contact': '+254717356476',
  'contactType': 'PHONE',
  'optedIn': true
};

final Map<String, dynamic> mockFacility = <String, dynamic>{
  'id': 'some_id',
  'name': 'facility name',
  'code': 123,
  'phone': '+254717356476',
  'active': false,
  'county': 'Nairobi',
  'description': 'detailed description',
};

final Map<String, dynamic> mockCreatePin = <String, dynamic>{
  'newPIN': '1234',
  'confirmPIN': '1234',
};

final Map<String, dynamic> mockPhoneLoginState = <String, dynamic>{
  'phoneNumber': '+254704002748',
  'pinCode': '1234',
};

final Map<String, dynamic> mockVerifyPhoneState = <String, dynamic>{
  'invalidOTP': false,
  'failedToSendOTP': false,
  'canResendOTP': false,
};

Map<String, dynamic> mockIconDetails = <String, dynamic>{
  'url': alertCircleIcon
};

Map<String, dynamic> mockNotificationActions = <String, dynamic>{
  'name': 'Calendar',
  'route': ' ',
  'icon': mockIconDetails
};

Map<String, dynamic> mockNotification = <String, dynamic>{
  'description':
      'Your Teleconsult with Dr Tibu for 11am has been set. Click this link to join ',
  'createdAt': '2022-04-28T07:00:20Z',
  'type': 'APPOINTMENT',
  'actions': <dynamic>[mockNotificationActions],
  'status': 'Missed',
  'id': 'some-id',
};
Map<String, dynamic> mockNotificationsResponse = <String, dynamic>{
  'fetchNotifications': <String, dynamic>{
    'notifications': <dynamic>[
      mockNotification,
      <String, dynamic>{
        'id': 'some-id',
        'title': 'title',
        'type': 'SERVICE_REQUEST',
        'body':
            'Your Teleconsult with Dr Tibu for 11am has been set. Click this link to join ',
        'isRead': false,
        'createdAt': '2022-04-28T07:00:20Z',
        'actions': <dynamic>[mockNotificationActions],
        'status': 'Missed'
      },
    ]
  }
};

Map<String, dynamic> mockClientResponse = <String, dynamic>{
  'ID': 'some-id',
  'User': <String, dynamic>{
    'Username': 'new-user',
    'Name': 'new name',
    'Active': false,
    'TermsAccepted': false,
    'Contacts': <String, dynamic>{
      'ContactType': 'PHONE',
      'ContactValue': '07000000',
      'Active': false,
      'OptedIn': false,
    }
  }
};

Map<String, dynamic> mockRoleResponse = <String, dynamic>{
  'roleID': 'some-id',
  'name': 'some-name',
};

Map<String, dynamic> mockRegisterClient = <String, dynamic>{
  'ID': 'id',
  'active': true,
  'clientType': 'clientType',
  'enrollmentDate': '2021-01-01',
  'fhirPatientID': 'some-id',
  'emrHealthRecordID': 'some-id',
  'treatmentBuddy': 'buddy',
  'counselled': false,
  'organisation': 'organisation',
  'userID': 'user_id',
  'currentFacilityID': 'some-id',
  'chv': 'chv',
  'caregiver': 'caregiver'
};

final Map<String, dynamic> mockRegisterStaff = <String, dynamic>{
  'ID': '',
  'active': false,
  'staffNumber': '12345678',
  'userID': 'some-id',
  'defaultFacility': '',
};

Map<String, dynamic> mockRegisterPayload = <String, dynamic>{
  'facility': 'Kanairo',
  'clientType': 'PMTCT',
  'clientName': 'Joker',
  'gender': 'male',
  'dateOfBirth': '1998-01-01',
  'phoneNumber': '+254704002748',
  'enrollmentDate': '2021-02-07',
  'cccNumber': 'joker1',
  'counselled': true
};

Map<String, dynamic> mockClientConfigurationPayload = <String, dynamic>{
  'clientType': 'PMTCT',
  'ageGroup': '14 - 16 yrs',
};

Map<String, dynamic> mockListFacilities = <String, dynamic>{
  'Facilities': <dynamic>[
    mockFacility,
  ]
};

final MockTestGraphQlClient mockGraphQlClient =
    MockTestGraphQlClient.withResponse(
  'idToken',
  'endpoint',
  http.Response('success response', 200),
);

final Map<String, dynamic> termsMock = <String, dynamic>{
  'termsID': 10001,
  'text': 'Dummy PRO Terms'
};

final Map<String, dynamic> mockAuthLoginResponse = <String, dynamic>{
  'profile': <String, dynamic>{
    'id': 'cf77a543-d5cc-427a-94ed-1b1e12dfb8f4',
    'userName': '@gifted_leavitt53101254',
    'verifiedIdentifiers': <Map<String, String>>[
      <String, String>{
        'uid': 'rnq23JxDXNMLJK3sSKNwaGWrfzp2',
        'timeStamp': '2021-04-30T09:50:01.50004Z',
        'loginProvider': 'PHONE'
      }
    ],
    'verifiedUIDS': <String>['rnq23JxDXNMLJK3sSKNwaGWrfzp2'],
    'primaryPhone': '+254717356476',
    'primaryEmailAddress': 'savannahtestacc@gmail.com',
    'secondaryPhoneNumbers': null,
    'secondaryEmailAddresses': null,
    'terms_accepted': true,
    'suspended': false,
    'photoUploadID': core.UNKNOWN,
    'userBioData': <String, String>{
      'firstName': 'BeWell',
      'lastName': 'Test',
      'dateOfBirth': '2003-04-30',
      'gender': 'male'
    }
  },
  'customerProfile': null,
  'communicationSettings': <String, dynamic>{
    'id': '45423625-d794-47d3-9f87-32b5a5f80c84',
    'profileID': 'cf77a543-d5cc-427a-94ed-1b1e12dfb8f4',
    'allowWhatsApp': true,
    'allowTextSMS': true,
    'allowPush': true,
    'allowEmail': true
  },
  'auth': <String, dynamic>{
    'customToken': 'custom-token',
    'id_token': 'id_token',
    'expires_in': '3600',
    'refresh_token': 'refresh_token',
    'uid': 'rnq23JxDXNMLJK3sSKNwaGWrfzp2',
    'is_admin': false,
    'is_anonymous': false,
    'can_experiment': false,
    'change_pin': false,
  },
};
final Map<String, dynamic> mockAssessmentResponsesByToolType =
    <String, dynamic>{
  'clientName': 'Byron Kimani',
  'dateAnswered': '2022-02-18T12:54:53Z',
  'clientID': '58074133-2d76-43ac-b233-3f33504a0bd8',
};

final Map<String, dynamic> mockToolAssessmentResponses = <String, dynamic>{
  'getScreeningToolServiceRequestResponses': <String, dynamic>{
    'serviceRequestID': 'test',
    'getAssessmentResponsesByToolType': <dynamic>[
      mockAssessmentResponsesByToolType,
      mockAssessmentResponsesByToolType,
    ]
  }
};

final Map<String, dynamic> mockPendingServiceRequestCount = <String, dynamic>{
  'data': <String, dynamic>{
    'getPendingServiceRequestsCount': <String, dynamic>{
      'clientsServiceRequestCount': <String, dynamic>{
        'requestsTypeCount': <Map<String, dynamic>>[
          <String, dynamic>{'requestType': 'RED_FLAG', 'total': 2},
          <String, dynamic>{'requestType': 'PIN_RESET', 'total': 2},
          <String, dynamic>{
            'requestType': 'SCREENING_TOOLS_RED_FLAG',
            'total': 2
          },
        ],
      },
      'staffServiceRequestCount': <String, dynamic>{
        'requestsTypeCount': <Map<String, dynamic>>[
          <String, dynamic>{'requestType': 'STAFF_PIN_RESET', 'total': 1}
        ]
      }
    }
  }
};

final Map<String, dynamic> mockChangePinAuthLoginResponse = <String, dynamic>{
  'profile': <String, dynamic>{
    'id': 'cf77a543-d5cc-427a-94ed-1b1e12dfb8f4',
    'userName': '@gifted_leavitt53101254',
    'verifiedIdentifiers': <Map<String, String>>[
      <String, String>{
        'uid': 'rnq23JxDXNMLJK3sSKNwaGWrfzp2',
        'timeStamp': '2021-04-30T09:50:01.50004Z',
        'loginProvider': 'PHONE'
      }
    ],
    'verifiedUIDS': <String>['rnq23JxDXNMLJK3sSKNwaGWrfzp2'],
    'primaryPhone': '+254717356476',
    'primaryEmailAddress': 'savannahtestacc@gmail.com',
    'secondaryPhoneNumbers': null,
    'secondaryEmailAddresses': null,
    'terms_accepted': true,
    'suspended': false,
    'photoUploadID': core.UNKNOWN,
    'userBioData': <String, String>{
      'firstName': 'BeWell',
      'lastName': 'Test',
      'dateOfBirth': '2003-04-30',
      'gender': 'male'
    }
  },
  'customerProfile': null,
  'communicationSettings': <String, dynamic>{
    'id': '45423625-d794-47d3-9f87-32b5a5f80c84',
    'profileID': 'cf77a543-d5cc-427a-94ed-1b1e12dfb8f4',
    'allowWhatsApp': true,
    'allowTextSMS': true,
    'allowPush': true,
    'allowEmail': true
  },
  'auth': <String, dynamic>{
    'customToken': 'custom-token',
    'id_token': 'id_token',
    'expires_in': '3600',
    'refresh_token': 'refresh_token',
    'uid': 'rnq23JxDXNMLJK3sSKNwaGWrfzp2',
    'is_anonymous': false,
    'is_admin': false,
    'can_experiment': false,
    'change_pin': true,
  },
};

/// a short client for providing custom responses
///
/// a good use case is when you want to return error responses
class MockShortGraphQlClient extends IGraphQlClient {
  MockShortGraphQlClient.withResponse(
    String idToken,
    String endpoint,
    this.response,
  ) {
    super.idToken = idToken;
    super.endpoint = endpoint;
  }

  final http.Response response;

  @override
  Future<http.Response> callRESTAPI({
    required String endpoint,
    required String method,
    Map<String, dynamic>? variables,
  }) {
    return Future<http.Response>.value(response);
  }

  @override
  Future<http.Response> query(
    String queryString,
    Map<String, dynamic> variables, [
    ContentType contentType = ContentType.json,
  ]) {
    return Future<http.Response>.value(response);
  }
}

class MockTestGraphQlClient extends IGraphQlClient {
  MockTestGraphQlClient();

  MockTestGraphQlClient.withResponse(
    String idToken,
    String endpoint,
    this.response,
  ) {
    super.idToken = idToken;
    super.endpoint = endpoint;
  }

  late final http.Response response;

  @override
  Future<http.Response> callRESTAPI({
    required String endpoint,
    required String method,
    Map<String, dynamic>? variables,
  }) {
    if (endpoint.contains('upload')) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(
            <String, dynamic>{
              'id': '1r1idoAs54kbZ90l9KkHSK7GKva',
            },
          ),
          201,
        ),
      );
    }

    if (endpoint.contains('login_by_phone')) {
      return Future<http.Response>.value(
        http.Response(json.encode(mockLoginResponse), 201),
      );
    }

    if (endpoint.contains('verify_otp')) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(
            <String, dynamic>{
              'data': <String, dynamic>{
                'getCurrentTerms': termsMock,
                'sendOTP': '123456',
                'sendRetryOTP': '123456',
                'verifyOTP': true
              }
            },
          ),
          201,
        ),
      );
    }

    if (endpoint.contains('send_otp')) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(
            <String, dynamic>{
              'data': <String, dynamic>{
                'getCurrentTerms': termsMock,
                'sendOTP': '123456',
                'sendRetryOTP': '123456',
                'verifyOTP': true
              }
            },
          ),
          201,
        ),
      );
    }
    if (endpoint.contains('opt-in')) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{'status': true}),
          201,
        ),
      );
    }

    return Future<http.Response>.value(
      http.Response(
        json.encode(
          <String, dynamic>{
            'data': <String, dynamic>{
              // add your data here
            }
          },
        ),
        201,
      ),
    );
  }

  @override
  Future<http.Response> query(
    String queryString,
    Map<String, dynamic> variables, [
    ContentType contentType = ContentType.json,
  ]) async {
    final String otpVariables = json.encode(<String, dynamic>{
      'msisdn': '+254717356476',
      'email': 'abiud.orina@savannahinformatics.com'
    });

    final String errorOtpVariables = json.encode(<String, dynamic>{
      'msisdn': '+254717356477',
      'email': 'abiud.orina@savannahinformatics.com'
    });

    if (json.encode(variables) == otpVariables) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{'generateAndEmailOTP': '123456'}
          }),
          201,
        ),
      );
    }

    if (json.encode(variables) == errorOtpVariables) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'Error': 'this is a sample error with an ID token'
          }),
          201,
        ),
      );
    }

    if (variables['phonenumber'] == '+254712345678') {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              // add your data here
              'otp': '1234'
            }
          }),
          201,
        ),
      );
    }

    if (queryString.contains('updateUserProfile')) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'updateUserProfile': <String, dynamic>{
                'userBioData': <String, String>{
                  'firstName': 'Test',
                  'lastName': 'Name'
                }
              },
            }
          }),
          201,
        ),
      );
    }

    if (queryString.contains(getTermsQuery)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{'getCurrentTerms': termsMock}
          }),
          201,
        ),
      );
    }

    if (queryString.contains(acceptTermsAndConditionsMutation)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{'acceptTerms': true}
          }),
          201,
        ),
      );
    }

    if (queryString.contains(recordSecurityQuestionResponsesMutation)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': mockRecordSecurityQuestionResponseData,
          }),
          201,
        ),
      );
    }

    if (queryString.contains(setUserPINMutation)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{'setUserPIN': true}
          }),
          201,
        ),
      );
    }

    if (queryString.contains(setNickNameMutation)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{'setNickName': true}
          }),
          201,
        ),
      );
    }

    if (queryString.contains(completeOnboardingTourMutation)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{'completeOnboardingTour': true}
          }),
          201,
        ),
      );
    }

    if (queryString.contains(registerClientMutation)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(
            <String, dynamic>{
              'data': <String, dynamic>{
                'registerClient': <String, dynamic>{
                  'ID': '',
                  'active': false,
                  'clientType': '',
                  'enrollmentDate': null,
                  'fhirPatientID': '',
                  'emrHealthRecordID': '',
                  'treatmentBuddy': '',
                  'counselled': false,
                  'organisation': '',
                  'userID': '',
                  'currentFacilityID': '',
                  'chv': '',
                  'caregiver': ''
                }
              }
            },
          ),
          201,
        ),
      );
    }

    if (queryString.contains(getServiceRequestsQuery)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': mockServiceRequests,
          }),
          201,
        ),
      );
    }

    if (queryString.contains(getResolvedServiceRequestsQuery)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': mockServiceRequests,
          }),
          201,
        ),
      );
    }

    if (queryString.contains(getPendingServiceRequestsCountQuery)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(mockPendingServiceRequestCount),
          201,
        ),
      );
    }

    if (queryString.contains(fetchFacilitiesQuery)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{'fetchFacilities': mockFacilities}
          }),
          201,
        ),
      );
    }

    if (queryString.contains(listMembersQuery)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'listMembers': listMembersMock,
            }
          }),
          201,
        ),
      );
    }

    if (queryString.contains(inviteMembersToCommunityQuery)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'inviteMembersToCommunity': true,
            }
          }),
          201,
        ),
      );
    }

    if (queryString.contains(listFlaggedMessagesQuery)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'listFlaggedMessages': mockListFlaggedMessages,
            }
          }),
          201,
        ),
      );
    }

    if (queryString.contains(deleteCommunityMessageMutation)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'deleteCommunityMessage': true,
            }
          }),
          201,
        ),
      );
    }

    if (queryString.contains(createCommunity)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'createCommunity': <String, dynamic>{
                'name': 'Test',
                'description': 'test group',
                'ageRange': <String, dynamic>{
                  'lowerBound': 17,
                  'upperBound': 25
                },
                'gender': <String>['male', 'female'],
                'clientType': <String>['PMTCT', 'OVC'],
                'inviteOnly': false
              }
            }
          }),
          201,
        ),
      );
    }

    if (queryString.contains(listCommunityMembersQuery)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{'data': groupStateMock}),
          201,
        ),
      );
    }

    if (queryString.contains(searchClientQuery)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{'data': clientResponseMock}),
          201,
        ),
      );
    }

    if (queryString.contains(recentlySharedHealthDiaryQuery)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{'data': mockDiaryEntry}),
          201,
        ),
      );
    }

    if (queryString.contains(listNotificationsQuery)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{'data': mockNotificationsResponse}),
          201,
        ),
      );
    }

    if (queryString.contains(searchStaffMemberQuery)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{'data': staffMembersResponseMock}),
          201,
        ),
      );
    }

    if (queryString.contains(registerStaffMutation)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(
            <String, dynamic>{
              'data': <String, dynamic>{
                'registerStaff': <String, dynamic>{
                  'ID': '',
                  'active': false,
                  'staffNumber': '12345678',
                  'userID': 'some-id',
                  'defaultFacility': '',
                }
              }
            },
          ),
          201,
        ),
      );
    }

    if (queryString.contains(verifyClientPinResetServiceRequestQuery)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(
            <String, dynamic>{
              'data': <String, dynamic>{
                'verifyClientPinResetServiceRequest': true
              }
            },
          ),
          201,
        ),
      );
    }
    if (queryString.contains(verifyStaffPinResetServiceRequestQuery)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(
            <String, dynamic>{
              'data': <String, dynamic>{
                'verifyStaffPinResetServiceRequest': true
              }
            },
          ),
          201,
        ),
      );
    }

    if (queryString.contains(inviteUserMutation)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(
            <String, dynamic>{
              'data': <String, dynamic>{'inviteUser': true}
            },
          ),
          201,
        ),
      );
    }

    if (queryString.contains(assignOrRevokeRoles)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(
            <String, dynamic>{
              'data': <String, dynamic>{'assignOrRevokeRoles': true}
            },
          ),
          201,
        ),
      );
    }
    if (queryString.contains(removeFromGroupMutation)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(
            <String, dynamic>{
              'data': <String, dynamic>{'removeMembersFromCommunity': true}
            },
          ),
          201,
        ),
      );
    }

    if (queryString.contains(banUserMutation)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(
            <String, dynamic>{
              'data': <String, dynamic>{'banUser': true}
            },
          ),
          201,
        ),
      );
    }
    if (queryString.contains(unBanUserMutation)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(
            <String, dynamic>{
              'data': <String, dynamic>{'unBanUser': true}
            },
          ),
          201,
        ),
      );
    }

    if (queryString.contains(getUserRolesQuery)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'getUserRoles': <dynamic>[
                <String, dynamic>{
                  'roleID': 'some_id',
                  'name': 'CONTENT_MANAGEMENT'
                },
              ]
            }
          }),
          200,
        ),
      );
    }

    if (queryString.contains(listSurveysQuery)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': surveysMock,
          }),
          200,
        ),
      );
    }
    if (queryString.contains(getAvailableFacilityScreeningToolsQuery)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'getAvailableFacilityScreeningTools': <dynamic>[
                <String, dynamic>{'toolType': 'TB_ASSESSMENT'},
                <String, dynamic>{'toolType': 'VIOLENCE_ASSESSMENT'},
                <String, dynamic>{'toolType': 'CONTRACEPTIVE_ASSESSMENT'},
                <String, dynamic>{'toolType': 'ALCOHOL_SUBSTANCE_ASSESSMENT'},
              ]
            }
          }),
          200,
        ),
      );
    }
    if (queryString.contains(getAssessmentResponsesByToolTypeQuery)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'getAssessmentResponsesByToolType': <dynamic>[
                mockAssessmentResponsesByToolType,
                mockAssessmentResponsesByToolType
              ]
            },
          }),
          200,
        ),
      );
    }
    if (queryString.contains(resolveServiceRequestMutation)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'resolveServiceRequest': true,
            }
          }),
          200,
        ),
      );
    }
    if (queryString.contains(readNotificationsMutation)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(
            <String, dynamic>{
              'data': <String, dynamic>{
                'readNotifications': true,
              }
            },
          ),
          201,
        ),
      );
    }
    if (queryString.contains(sendClientSurveyLinksMutation)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(
            <String, dynamic>{
              'data': <String, dynamic>{
                'sendClientSurveyLinks': true,
              }
            },
          ),
          201,
        ),
      );
    }

    if (queryString.contains(getScreeningToolServiceRequestResponsesQuery)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'getScreeningToolServiceRequestResponses': <String, dynamic>{
                'serviceRequestID': '980ef678-a163-4fc4-babd-f6307244d8e0',
                'screeningToolResponses': <dynamic>[
                  <String, dynamic>{
                    'toolIndex': 0,
                    'tool': 'Have you experienced a chough for any duration?',
                    'response': 'Yes',
                  },
                  <String, dynamic>{
                    'toolIndex': 1,
                    'tool': 'Do you have a fever?',
                    'response': 'Yes',
                  },
                  <String, dynamic>{
                    'toolIndex': 2,
                    'tool': 'Have you Noticed any weight loss?',
                    'response': 'Yes',
                  },
                  <String, dynamic>{
                    'toolIndex': 3,
                    'tool': 'Do you experience night sweats?',
                    'response': 'Yes',
                  }
                ]
              },
            }
          }),
          200,
        ),
      );
    }

    return Future<http.Response>.value(
      http.Response(json.encode(<String, dynamic>{}), 201),
    );
  }
}

final List<Map<String, dynamic>> mockFacilities = <Map<String, dynamic>>[
  <String, dynamic>{
    'ID': 'bb046fb1-48f3-410f-813c-33a49324e636',
    'name': 'Test Facility',
    'description': ''
  },
  <String, dynamic>{
    'ID': 'c2f92466-c82f-4e25-80ec-91dbeb8f722c',
    'name': 'Kanairo',
    'description': 'Kanairo Hospital'
  }
];

Map<String, dynamic> mockSecurityQuestion = <String, dynamic>{
  'SecurityQuestionID': 'id',
  'QuestionStem': 'What are the last 4 digits of your CCC number?',
  'Description': 'description',
  'ResponseType': 'NUMBER',
  'Active': true,
};

Map<String, dynamic> mockSecurityQuestionResponse = <String, dynamic>{
  'id': 'id',
  'timeStamp': '2021-05-06T05:34:24Z',
  'userId': 'userId',
  'securityQuestionId': 'securityQuestionId',
  'response': 'response',
};

Map<String, dynamic> helpCenterFAQMock = <String, dynamic>{
  'data': <String, dynamic>{
    'getFaqsContent': <dynamic>[
      <String, dynamic>{
        'id': '5f89b9120251c700391da360',
        'createdAt': '2020-10-16T18:15:30+03:00',
        'excerpt': 'PRO',
        'featureImage':
            'https://images.unsplash.com/photo-1525466760727-1d8be8721154?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=2000&fit=max&ixid=eyJhcHBfaWQiOjExNzczfQ',
        'html': 'Reach 100 percent coverage first',
        'publishedAt': '2020-10-16T18:19:34+03:00',
        'slug': 'how-to-add-your-cover',
        'title': 'How to add your cover',
        'readingTime': 0,
        'tags': <dynamic>[
          <String, dynamic>{
            'id': '5f89b94a0251c700391da364',
            'name': 'faqs',
            'slug': 'faqs'
          }
        ]
      }
    ]
  }
};

Map<String, dynamic> mockFAQtag = <String, dynamic>{
  'id': '5f89b94a0251c700391da364',
  'name': 'faqs',
  'slug': 'faqs',
};

final Map<String, dynamic> mockUser = <String, dynamic>{
  'userID': 'UNKNOWN',
  'userName': 'UNKNOWN',
  'firstName': 'UNKNOWN',
  'lastName': 'UNKNOWN',
  'name': 'UNKNOWN',
  'userType': 'UNKNOWN',
  'gender': core.Gender.unknown.name,
  'active': false,
  'primaryContact': <String, dynamic>{
    'ID': 'UNKNOWN',
    'ContactType': 'PHONE',
    'ContactValue': 'UNKNOWN',
    'Active': false,
    'OptedIn': false,
  },
  'lastSuccessfulLogin': 'UNKNOWN',
  'lastFailedLogin': 'UNKNOWN',
  'failedLoginCount': 0,
  'nextAllowedLogin': 'UNKNOWN',
  'pinChangeRequired': false,
  'hasSetPin': false,
  'isPhoneVerified': false,
  'hasSetSecurityQuestions': false,
  'termsAccepted': false,
  'acceptedTermsID': 0,
  'suspended': false,
  'avatar': 'UNKNOWN'
};

final Map<String, dynamic> mockLoginUser = <String, dynamic>{
  'userID': 'UNKNOWN',
  'userName': 'UNKNOWN',
  'firstName': 'John',
  'lastName': 'Doe',
  'name': 'John Doe',
  'userType': 'UNKNOWN',
  'gender': core.Gender.unknown.name,
  'active': false,
  'primaryContact': <String, dynamic>{
    'contactType': 'PHONE',
    'contactValue': 'UNKNOWN',
    'active': false,
    'optedIn': false,
  },
  'lastSuccessfulLogin': 'UNKNOWN',
  'lastFailedLogin': 'UNKNOWN',
  'failedLoginCount': 0,
  'nextAllowedLogin': 'UNKNOWN',
  'pinChangeRequired': false,
  'hasSetPin': false,
  'isPhoneVerified': false,
  'hasSetSecurityQuestions': false,
  'termsAccepted': false,
  'acceptedTermsID': 0,
  'suspended': false,
  'avatar': 'UNKNOWN'
};

final Map<String, dynamic> mockStaffState = <String, dynamic>{
  'id': 'UNKNOWN',
  'user_id': 'UNKNOWN',
  'active': false,
  'staff_number': 'UNKNOWN',
  'facilities': <dynamic>[],
  'default_facility': 'UNKNOWN',
  'user': mockUser,
  'userState': <String, dynamic>{
    'userProfile': <String, dynamic>{
      'id': 'UNKNOWN',
      'userName': 'UNKNOWN',
      'primaryPhone': null,
      'primaryEmailAddress': 'unknown@email.co.ke',
      'secondaryPhoneNumbers': null,
      'secondaryEmailAddresses': null,
      'terms_accepted': false,
      'suspended': false,
      'photoUploadID': 'UNKNOWN',
      'covers': null,
      'userBioData': <String, dynamic>{
        'firstName': 'UNKNOWN',
        'lastName': 'UNKNOWN',
        'dateOfBirth': 'UNKNOWN',
        'gender': 'unknown'
      },
      'homeAddress': null,
      'workAddress': null,
      'referralLink': null,
      'assistant': null
    },
    'customerProfile': null,
    'communicationSettings': <String, dynamic>{
      'profileID': 'UNKNOWN',
      'allowWhatsApp': false,
      'allowTextSMS': false,
      'allowPush': false,
      'allowEmail': false
    },
    'auth': <String, dynamic>{
      'customToken': 'UNKNOWN',
      'id_token': 'UNKNOWN',
      'expires_in': 'UNKNOWN',
      'refresh_token': 'UNKNOWN',
      'uid': 'UNKNOWN',
      'is_admin': false,
      'is_anonymous': true,
      'can_experiment': false,
      'change_pin': null
    },
    'isSignedIn': false,
    'signedInTime': 'UNKNOWN',
    'inActivitySetInTime': 'UNKNOWN',
    'tokenExpiryTime': 'UNKNOWN'
  }
};
final Map<String, dynamic> mockServiceRequests = <String, dynamic>{
  'getServiceRequests': <dynamic>[
    <String, dynamic>{
      'ID': 'test',
      'RequestType': 'RED_FLAG',
      'Request': 'test',
      'ClientID': 'test',
      'FacilityID': 'test',
      'ClientName': 'test',
      'ClientContact': 'test',
      'ResolvedAt': 'test',
      'ResolvedBy': 'test',
      'ResolvedByName': 'test',
      'CreatedAt': '2022-02-09T08:40:46Z'
    },
    <String, dynamic>{
      'ID': 'test',
      'RequestType': 'STAFF_PIN_RESET',
      'Request': 'I have not been myself lately',
      'ClientID': 'test',
      'FacilityID': 'test',
      'ClientName': 'Calvin Ojiambo',
      'ClientContact': '+254712345678',
      'StaffName': 'Calvin Ojiambo',
      'StaffContact': '+254712345678',
      'ResolvedAt': '2022-02-09T08:40:46Z',
      'ResolvedBy': 'test',
      'ResolvedByName': 'test',
      'CreatedAt': '2022-02-09T08:40:46Z',
      'Meta': <String, dynamic>{
        'ccc_number': '1234567890',
        'is_ccc_number_valid': true
      }
    },
    <String, dynamic>{
      'ID': 'test',
      'RequestType': 'PIN_RESET',
      'Request': 'I am feeling very bad',
      'ClientID': 'test',
      'FacilityID': 'test',
      'ClientName': 'Jenny McLaren',
      'ClientContact': '+254712345678',
      'StaffName': 'Jenny McLaren',
      'StaffContact': '+254712345678',
      'ResolvedAt': 'test',
      'ResolvedBy': 'test',
      'ResolvedByName': 'test',
      'CreatedAt': '2022-02-09T08:40:46Z',
      'Meta': <String, dynamic>{
        'ccc_number': '1234567890',
        'is_ccc_number_valid': false
      }
    },
    <String, dynamic>{
      'ID': 'test',
      'RequestType': 'SCREENING_TOOLS_RED_FLAG',
      'Request': 'I have not been myself lately',
      'ClientID': 'test',
      'FacilityID': 'test',
      'ClientName': 'Calvin Ojiambo',
      'ClientContact': '+254712345678',
      'StaffName': 'Calvin Ojiambo',
      'StaffContact': '+254712345678',
      'ResolvedAt': '2022-02-09T08:40:46Z',
      'ResolvedBy': 'test',
      'ResolvedByName': 'test',
      'CreatedAt': '2022-02-09T08:40:46Z',
      'Meta': <String, dynamic>{
        'ccc_number': '1234567890',
        'is_ccc_number_valid': true
      }
    },
    <String, dynamic>{
      'ID': 'test',
      'Request': 'I have not been myself lately',
      'ClientID': 'test',
      'FacilityID': 'test',
      'ClientName': 'Calvin Ojiambo',
      'ClientContact': '+254712345678',
      'StaffName': 'Calvin Ojiambo',
      'StaffContact': '+254712345678',
      'ResolvedAt': '2022-02-09T08:40:46Z',
      'ResolvedBy': 'test',
      'ResolvedByName': 'test',
      'CreatedAt': '2022-02-09T08:40:46Z',
      'Meta': <String, dynamic>{
        'ccc_number': '1234567890',
        'is_ccc_number_valid': true
      }
    },
  ]
};

final Map<String, dynamic> groupStateMock = <String, dynamic>{
  'listCommunityMembers': <dynamic>[
    <String, dynamic>{
      'user': <String, dynamic>{
        'id': core.UNKNOWN,
        'userID': core.UNKNOWN,
        'name': core.UNKNOWN,
        'role': core.UNKNOWN,
        'username': core.UNKNOWN,
        'gender': 'unknown',
        'extraData': <String, dynamic>{
          'bannedInCommunity': false,
        }
      },
      'isModerator': true,
    },
  ],
};

final Map<String, dynamic> mockSurvey = <String, dynamic>{
  'projectId': 2,
  'name': 'project-name',
};

final Map<String, dynamic> surveysMock = <String, dynamic>{
  'listSurveys': <dynamic>[
    mockSurvey,
    mockSurvey,
  ],
};

final Map<String, dynamic> clientResponseMock = <String, dynamic>{
  'searchClientsByCCCNumber': <dynamic>[
    <String, dynamic>{
      'ID': 'some-id',
      'CCCNumber': '1234',
      'Active': true,
      'User': <String, dynamic>{
        'ID': 'some-id',
        'Username': 'Username',
        'Name': 'User Name',
        'Active': false,
        'TermsAccepted': false,
        'Contacts': <String, dynamic>{
          'ContactType': 'PHONE',
          'ContactValue': '07000000',
          'Active': false,
          'OptedIn': false,
        }
      }
    }
  ]
};

final Map<String, dynamic> staffMembersResponseMock = <String, dynamic>{
  'searchStaffUser': <dynamic>[
    <String, dynamic>{
      'ID': 'some-id',
      'CCCNumber': '12345',
      'active': true,
      'User': <String, dynamic>{
        'ID': 'some-id',
        'Username': 'Username',
        'Name': 'User Name',
        'Active': false,
        'TermsAccepted': false,
        'Contacts': <String, dynamic>{
          'ContactType': 'PHONE',
          'ContactValue': '07000000',
          'Active': false,
          'OptedIn': false,
        }
      },
      'StaffNumber': 'some-id'
    },
  ]
};

final Map<String, dynamic> mockMiscState = <String, dynamic>{
  'message': 'UNKNOWN',
  'otpCode': 'UNKNOWN',
  'acceptedTerms': false,
  'faqList': <dynamic>[],
  'eventState': <String, dynamic>{
    'eventName': 'UNKNOWN',
    'eventPayload': 'UNKNOWN'
  },
  'createPin': 'UNKNOWN',
  'confirmPin': 'UNKNOWN',
  'accountExists': false,
  'invalidPin': false,
  'patientSearchTerm': null,
  'hasCompletedEnteringOTP': false,
  'isResendingOTP': false,
  'initialRoute': AppRoutes.loginPage,
  'profileFAQsContentState': <String, dynamic>{
    'profileFAQs': <dynamic>[],
    'errorFetchingFAQs': false,
    'timeoutFetchingFAQs': false
  },
  'communityMembers': <dynamic>[],
  'groupState': groupStateMock,
  'searchUserResponseState': mockSearchUserResponseState,
};

final Map<String, dynamic> mockSearchUserResponseState = <String, dynamic>{
  'searchUserResponses': <dynamic>[],
  'selectedSearchUserResponse': <String, dynamic>{
    'ID': core.UNKNOWN,
    'CCCNumber': core.UNKNOWN,
    'StaffNumber': core.UNKNOWN,
    'Active': true,
    'rolesList': <String, dynamic>{'getUserRoles': <dynamic>[]},
    'User': <String, dynamic>{
      'ID': core.UNKNOWN,
      'Username': core.UNKNOWN,
      'TermsAccepted': false,
      'Active': false,
      'Contacts': <String, dynamic>{
        'ID': core.UNKNOWN,
        'Active': false,
        'ContactType': 'PHONE',
        'ContactValue': core.UNKNOWN,
        'OptedIn': false
      },
    }
  },
  'errorSearchingUser': false,
  'timeoutSearchingUser': false,
  'noUserFound': null,
};

final Map<String, dynamic> mockOnboardingState = <String, dynamic>{
  'termsAndConditions': <String, dynamic>{'termsID': 0, 'text': 'UNKNOWN'},
  'pin': 'UNKNOWN',
  'confirmPIN': 'UNKNOWN',
  'securityQuestions': <dynamic>[],
  'securityQuestionResponses': <dynamic>[],
  'invalidOTP': false,
  'otp': 'UNKNOWN',
  'failedToSendOTP': false,
  'canResendOTP': false,
  'invalidCredentials': false,
  'phoneNumber': 'UNKNOWN',
  'isPhoneVerified': false,
  'hasSetPin': false,
  'hasAcceptedTerms': false,
  'hasSetSecurityQuestions': false,
  'hasVerifiedSecurityQuestions': false,
  'hasSetNickName': false,
  'failedLoginCount': 0,
};

final Map<String, dynamic> appStateMock = <String, dynamic>{
  'credentials': <String, dynamic>{
    'expiresIn': 'UNKNOWN',
    'idToken': 'UNKNOWN',
    'refreshToken': 'UNKNOWN',
    'tokenExpiryTimestamp': 'UNKNOWN',
    'isSignedIn': false,
    'signedInTime': 'UNKNOWN',
  },
  'homeState': <String, dynamic>{},
  'onboardingState': mockOnboardingState,
  'bottomNavigationState': <String, dynamic>{'currentBottomNavIndex': 0},
  'miscState': mockMiscState,
  'staffState': mockStaffState,
  'surveyState': <String, dynamic>{},
  'serviceRequestState': <String, dynamic>{
    'ServiceRequest': <String, dynamic>{},
    'pendingServiceRequests': <String, dynamic>{
      'total': 0,
      'requestsTypeCount': <dynamic>[]
    },
    'errorFetchingServiceRequests': false,
  },
  'connectivityState': <String, dynamic>{'isConnected': false},
};

final Map<String, dynamic> mockLoginResponse = <String, dynamic>{
  'code': 0,
  'message': 'success',
  'response': <String, dynamic>{
    'credentials': <String, dynamic>{
      'expiresIn': '3600',
      'idToken': 'some id token',
      'refreshToken': 'some-refresh-token',
      'tokenExpiryTimestamp': 'UNKNOWN',
      'isSignedIn': false,
      'signedInTime': 'UNKNOWN',
    },
    'staffProfile': <String, dynamic>{
      'id': 'UNKNOWN',
      'user_id': 'UNKNOWN',
      'active': false,
      'staff_number': 'UNKNOWN',
      'facilities': <dynamic>[],
      'default_facility': 'UNKNOWN',
      'user': mockLoginUser,
    }
  }
};

final Map<String, dynamic> pinChangeRequiredMock = <String, dynamic>{
  'code': 0,
  'message': 'success',
  'response': <String, dynamic>{
    'credentials': <String, dynamic>{
      'expiresIn': '3600',
      'idToken': 'some id token',
      'refreshToken': 'some-refresh-token',
      'tokenExpiryTimestamp': 'UNKNOWN',
      'isSignedIn': false,
      'signedInTime': 'UNKNOWN',
    },
    'staffProfile': <String, dynamic>{
      'id': 'UNKNOWN',
      'user_id': 'UNKNOWN',
      'active': false,
      'staff_number': 'UNKNOWN',
      'facilities': <dynamic>[],
      'default_facility': 'UNKNOWN',
      'user': <String, dynamic>{
        'userID': 'UNKNOWN',
        'userName': 'UNKNOWN',
        'firstName': 'John',
        'lastName': 'Doe',
        'name': 'John Doe',
        'userType': 'UNKNOWN',
        'gender': core.Gender.unknown.name,
        'active': false,
        'primaryContact': <String, dynamic>{
          'contactType': 'PHONE',
          'contactValue': 'UNKNOWN',
          'active': false,
          'optedIn': false,
        },
        'lastSuccessfulLogin': 'UNKNOWN',
        'lastFailedLogin': 'UNKNOWN',
        'failedLoginCount': 0,
        'nextAllowedLogin': 'UNKNOWN',
        'pinChangeRequired': true,
        'pinUpdateRequired': true,
        'hasSetPin': false,
        'isPhoneVerified': false,
        'hasSetSecurityQuestions': false,
        'termsAccepted': false,
        'acceptedTermsID': 0,
        'suspended': false,
        'avatar': 'UNKNOWN'
      },
    }
  }
};

final Map<String, dynamic> mockAuthCredentials = <String, dynamic>{
  'expiresIn': '3600',
  'idToken': 'some id token',
  'refreshToken': 'some refresh token'
};

final List<dynamic> securityQuestionsMock = <dynamic>[
  <String, dynamic>{
    'SecurityQuestionID': 'id1',
    'QuestionStem': 'What are the last 4 digits of your CCC number?',
    'Description': 'Please provide the last 4 digits of your clinic number',
    'ResponseType': core.SecurityQuestionResponseType.UNKNOWN.name,
    'Active': true,
  },
  <String, dynamic>{
    'SecurityQuestionID': 'id2',
    'QuestionStem': 'Which month did you start your treatment?',
    'Description': 'Enter the month you started your treatment',
    'ResponseType': core.SecurityQuestionResponseType.DATE.name,
    'Active': true,
  },
  <String, dynamic>{
    'SecurityQuestionID': 'id3',
    'QuestionStem': 'Which county is your clinic located?',
    'Description': 'nter the name of the county in small letters',
    'ResponseType': core.SecurityQuestionResponseType.UNKNOWN.name,
    'Active': true,
  },
];

Map<String, dynamic> mockRecordSecurityQuestionResponseData = <String, dynamic>{
  'recordSecurityQuestionResponses': recordSecurityQuestionReponseMock
};

final List<dynamic> recordSecurityQuestionReponseMock = <dynamic>[
  <String, dynamic>{
    'securityQuestionID': 'id1',
    'isCorrect': true,
  },
  <String, dynamic>{
    'SecurityQuestionID': 'id2',
    'isCorrect': true,
  },
  <String, dynamic>{
    'SecurityQuestionID': 'id3',
    'isCorrect': true,
  },
];

final List<dynamic> listMembersMock = <dynamic>[
  <String, dynamic>{
    'id': 'id1',
    'userID': 'some-user-id',
    'role': 'user',
    'userType': 'CLIENT',
    'username': 'Sam',
    'gender': core.Gender.male.name,
  },
  <String, dynamic>{
    'id': 'id1',
    'userID': 'some-user-id',
    'role': 'user',
    'userType': 'STAFF',
    'username': 'Jane',
    'gender': core.Gender.male.name,
  },
  <String, dynamic>{
    'id': 'id1',
    'userID': 'some-user-id',
    'role': 'user',
    'userType': 'STAFF',
    'username': 'Julian',
    'gender': core.Gender.male.name,
  },
];

final List<dynamic> mockListFlaggedMessages = <dynamic>[
  <String, dynamic>{
    'message': <String, dynamic>{
      'id': '1fc5d6be-8550-47a4-8f46-e515ae04f7a9',
      'text': 'Test',
      'created_at': '2022-04-08T12:02:20Z',
      'attachments': <dynamic>[],
      'mentioned_users': <dynamic>[],
      'user': <String, dynamic>{
        'id': '740128ce-32b4-4b5e-8359-a92442c8f741',
        'userID': '',
        'name': 'John Ngugi',
        'username': ''
      }
    }
  },
  <String, dynamic>{
    'message': <String, dynamic>{
      'id': '71a64e8a-98cb-4a27-9ee7-4786eb7a8135',
      'text': "Who's available?",
      'created_at': '2022-03-04T12:45:54Z',
      'attachments': <dynamic>[],
      'mentioned_users': <dynamic>[],
      'user': <String, dynamic>{
        'id': 'da614cc4-b503-4bd8-9530-a7eb0d676433',
        'userID': '',
        'name': 'Nairoua Salaton',
        'username': ''
      }
    }
  },
  <String, dynamic>{
    'message': <String, dynamic>{
      'id': '1c2a059c-f49b-4b6e-a130-2812777bb280',
      'text': 'Hi I am now available',
      'created_at': '2022-04-09T08:07:38Z',
      'attachments': <dynamic>[],
      'mentioned_users': <dynamic>[],
      'user': <String, dynamic>{
        'id': '305db9b5-2ff9-4e4c-9a7a-57660b31df4c',
        'userID': '',
        'name': 'Abiud Consumer',
        'username': ''
      }
    }
  }
];

final Map<String, dynamic> groupInfoPagePayloadMock = <String, dynamic>{
  'channelId': testString,
  'memberCount': 1,
  'channelName': 'Ruaraka Group'
};

final Map<String, dynamic> mockInvitedCommunities = <String, dynamic>{
  'invitedCommunities': <dynamic>[
    <String, dynamic>{
      'id': core.UNKNOWN,
      'name': core.UNKNOWN,
      'memberCount': 0,
      'description': core.UNKNOWN,
      'createdBy': core.UNKNOWN,
    },
  ]
};

final Map<String, dynamic> mockCommunity = <String, dynamic>{
  'id': core.UNKNOWN,
  'name': core.UNKNOWN,
  'memberCount': 0,
  'description': core.UNKNOWN,
  'createdBy': core.UNKNOWN,
};

final Map<String, dynamic> mockCommunitiesState = <String, dynamic>{
  'invitedCommunities': <dynamic>[],
  'flaggedMessages': <dynamic>[],
};

final Map<String, dynamic> mockPendingInvites = <String, dynamic>{
  'listPendingInvites': <dynamic>[
    <String, dynamic>{
      'id': '12345',
      'name': 'Test',
      'memberCount': 3,
      'gender': <dynamic>[],
      'description': '',
      'createdBy': null
    }
  ]
};

final Map<String, dynamic> mockDiaryEntry = <String, dynamic>{
  'getSharedHealthDiaryEntries': <dynamic>[
    <String, dynamic>{
      'id': 'some-id',
      'mood': 'HAPPY',
      'note': 'I am healthy',
      'sharedAt': '2021-11-30T16:17:57Z',
      'active': true,
    }
  ]
};

final List<Map<String, dynamic>> mockDiaryEntries = <Map<String, dynamic>>[
  <String, dynamic>{
    'id': 'some-id',
    'active': true,
    'mood': 'HAPPY',
    'note': 'I am healthy',
    'sharedAt': '2021-11-30T16:17:57Z'
  },
  <String, dynamic>{
    'id': 'some-id',
    'active': true,
    'mood': 'HAPPY',
    'note': 'I am very healthy',
    'sharedAt': '2021-11-30T16:17:53Z'
  },
];

final MockFirebaseMessaging kMockMessagingPlatform = MockFirebaseMessaging();

void setupFirebaseMessagingMocks() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelFirebase.channel
      .setMockMethodCallHandler((MethodCall call) async {
    if (call.method == 'Firebase#initializeCore') {
      return <Map<String, dynamic>>[
        <String, dynamic>{
          'name': defaultFirebaseAppName,
          'options': <String, dynamic>{
            'apiKey': '123',
            'appId': '123',
            'messagingSenderId': '123',
            'projectId': '123',
          },
          'pluginConstants': <String, dynamic>{},
        }
      ];
    }

    if (call.method == 'Firebase#initializeApp') {
      return <String, dynamic>{
        'name': call.arguments['appName'],
        'options': call.arguments['options'],
        'pluginConstants': <String, dynamic>{},
      };
    }

    return null;
  });

  // // Mock Platform Interface Methods
  // // ignore: invalid_use_of_protected_member
  when(kMockMessagingPlatform.delegateFor(app: anyNamed('app')))
      .thenReturn(kMockMessagingPlatform);
  // ignore: invalid_use_of_protected_member
  when(
    kMockMessagingPlatform.setInitialValues(
      isAutoInitEnabled: anyNamed('isAutoInitEnabled'),
    ),
  ).thenReturn(kMockMessagingPlatform);
}

Future<T> neverEndingFuture<T>() async {
  // ignore: literal_only_boolean_expressions
  while (true) {
    await Future<T>.delayed(const Duration(minutes: 5));
  }
}

class MockFirebaseMessaging extends Mock
    with MockPlatformInterfaceMixin
    implements FirebaseMessagingPlatform {
  MockFirebaseMessaging() {
    TestFirebaseMessagingPlatform();
  }

  @override
  bool get isAutoInitEnabled {
    return super.noSuchMethod(
      Invocation.getter(#isAutoInitEnabled),
      returnValue: true,
      returnValueForMissingStub: true,
    ) as bool;
  }

  @override
  FirebaseMessagingPlatform delegateFor({FirebaseApp? app}) {
    return super.noSuchMethod(
      Invocation.method(
        #delegateFor,
        <Object?>[],
        <Symbol, Object?>{#app: app},
      ),
      returnValue: TestFirebaseMessagingPlatform(),
      returnValueForMissingStub: TestFirebaseMessagingPlatform(),
    ) as FirebaseMessagingPlatform;
  }

  @override
  FirebaseMessagingPlatform setInitialValues({bool? isAutoInitEnabled}) {
    return super.noSuchMethod(
      Invocation.method(
        #setInitialValues,
        <Object?>[],
        <Symbol, Object?>{#isAutoInitEnabled: isAutoInitEnabled},
      ),
      returnValue: TestFirebaseMessagingPlatform(),
      returnValueForMissingStub: TestFirebaseMessagingPlatform(),
    ) as FirebaseMessagingPlatform;
  }

  @override
  Future<RemoteMessage?> getInitialMessage() {
    return super.noSuchMethod(
      Invocation.method(#getInitialMessage, <Object?>[]),
      returnValue: neverEndingFuture<RemoteMessage>(),
      returnValueForMissingStub: neverEndingFuture<RemoteMessage>(),
    ) as Future<RemoteMessage?>;
  }

  @override
  Future<void> deleteToken() {
    return super.noSuchMethod(
      Invocation.method(#deleteToken, <Object?>[]),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future<void>.value(),
    ) as Future<void>;
  }

  @override
  Future<String?> getAPNSToken() {
    return super.noSuchMethod(
      Invocation.method(#getAPNSToken, <Object?>[]),
      returnValue: Future<String>.value(''),
      returnValueForMissingStub: Future<String>.value(''),
    ) as Future<String?>;
  }

  @override
  Future<String> getToken({String? vapidKey}) {
    return super.noSuchMethod(
      Invocation.method(
        #getToken,
        <Object?>[],
        <Symbol, Object?>{#vapidKey: vapidKey},
      ),
      returnValue: Future<String>.value(''),
      returnValueForMissingStub: Future<String>.value(''),
    ) as Future<String>;
  }

  @override
  Future<void> setAutoInitEnabled(bool? enabled) {
    return super.noSuchMethod(
      Invocation.method(#setAutoInitEnabled, <Object?>[enabled]),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future<void>.value(),
    ) as Future<void>;
  }

  @override
  Stream<String> get onTokenRefresh {
    return super.noSuchMethod(
      Invocation.getter(#onTokenRefresh),
      returnValue: const Stream<String>.empty(),
      returnValueForMissingStub: const Stream<String>.empty(),
    ) as Stream<String>;
  }

  @override
  Future<NotificationSettings> requestPermission({
    bool? alert = true,
    bool? announcement = false,
    bool? badge = true,
    bool? carPlay = false,
    bool? criticalAlert = false,
    bool? provisional = false,
    bool? sound = true,
  }) {
    return super.noSuchMethod(
      Invocation.method(#requestPermission, <Object?>[], <Symbol, Object?>{
        #alert: alert,
        #announcement: announcement,
        #badge: badge,
        #carPlay: carPlay,
        #criticalAlert: criticalAlert,
        #provisional: provisional,
        #sound: sound
      }),
      returnValue: neverEndingFuture<NotificationSettings>(),
      returnValueForMissingStub: neverEndingFuture<NotificationSettings>(),
    ) as Future<NotificationSettings>;
  }

  @override
  Future<void> subscribeToTopic(String? topic) {
    return super.noSuchMethod(
      Invocation.method(#subscribeToTopic, <Object?>[topic]),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future<void>.value(),
    ) as Future<void>;
  }

  @override
  Future<void> unsubscribeFromTopic(String? topic) {
    return super.noSuchMethod(
      Invocation.method(#unsubscribeFromTopic, <Object?>[topic]),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future<void>.value(),
    ) as Future<void>;
  }
}

class TestFirebaseMessagingPlatform extends FirebaseMessagingPlatform {
  TestFirebaseMessagingPlatform() : super();
}

final List<Map<String, dynamic>> contentMock = <Map<String, dynamic>>[
  <String, dynamic>{
    'ID': 1,
    'title': 'Tips on how to keep yourself healthy',
    'date': '2021-08-23T06:42:05.085216Z',
    'intro': 'Keep yourself healthy',
    'authorName': 'Abiud Orina',
    'authorAvatar': 'https://i.postimg.cc/9XpbrC25/profile-image.png',
    'author': <String, dynamic>{'ID': 'some-id'},
    'itemType': 'ARTICLE',
    'timeEstimateSeconds': 180,
    'body':
        'The coronavirus pandemic has affected our lives, our economy, and nearly every corner of the globe. Almost 4 billion vaccine doses have been administered worldwide; 53 for every 100 people. But the worldwide numbers of infections continue to rise, driven by the Delta variant with highly vaccinated regions like Western Europe and the United States, where cases are relatively low but climbing fast. As cases continue to surge, you can take some steps to keep yourself and your family safe. Here are some tips from our trusted science team.',
    'heroImageRendition': <String, dynamic>{
      'url': 'https://i.postimg.cc/zvW46yxk/wellness.jpg',
    },
    'likeCount': 180,
    'bookmarkCount': 180,
    'viewCount': 180,
    'shareCount': 180,
    'hasSaved': false,
    'hasLiked': false,
    'documents': <dynamic>[],
    'isNew': true,
    'firstPublishedAt': '2021-08-23T06:42:05.085216Z',
    'meta': <String, dynamic>{
      'contentHTMLURL': 'https://mycarehub.co.ke/',
      'firstPublishedAt': '2021-08-23T06:42:05.085216Z',
    },
    'tagNames': <String>['Recommended', 'Health', 'Fitness'],
    'featuredMedia': <Map<String, dynamic>>[
      <String, dynamic>{
        'ID': 7,
        'url':
            'https://storage.googleapis.com/mycarehub-test/media/media/Background_Music_Soft_Piano_Music.aac',
        'title': 'Background',
        'type': 'audio',
        'width': 0,
        'duration': 6,
        'height': 0,
        'thumbnail': ''
      }
    ]
  },
  <String, dynamic>{
    'ID': 12,
    'title': 'Test article',
    'date': '2022-01-06',
    'intro': 'This is a test article',
    'authorName': 'John Ngugi',
    'tagNames': <String>['test'],
    'meta': <String, dynamic>{
      'contentType': 'content.ContentItem',
      'contentHTMLURL':
          'http://mycarehub-stage.savannahghi.org/health-education/test-article/',
      'slug': 'test-article',
      'showInMenus': false,
      'seoTitle': '',
      'searchDescription': '',
      'firstPublishedAt': '2022-01-06T09:18:42.024393+03:00',
      'locale': 'en'
    },
    'itemType': 'AUDIO_VIDEO',
    'timeEstimateSeconds': 6,
    'body': '<p data-block-key="9gd2w">Test article</p>',
    'heroImage': <String, dynamic>{'ID': 10, 'title': 'sunbeds3'},
    'heroImageRendition': <String, dynamic>{
      'url':
          'https://storage.googleapis.com/mycarehub-test/media/images/sunbeds3_VNXQPgI.2e16d0ba.fill-800x1200.jpegquality-60.jpg',
      'width': 800,
      'height': 1200,
      'alt': 'sunbeds3'
    },
    'likeCount': 6,
    'bookmarkCount': 2,
    'viewCount': 0,
    'shareCount': 1,
    'author': <String, dynamic>{'ID': 'cd92a709-c397-4b04-a963-709eb7e08486'},
    'categoryDetails': <Map<String, dynamic>>[
      <String, dynamic>{
        'ID': 6,
        'categoryName': 'recommended',
        'categoryIcon': ''
      }
    ],
    'featuredMedia': <Map<String, dynamic>>[
      <String, dynamic>{
        'ID': 2,
        'url':
            'https://storage.googleapis.com/mycarehub-test/media/media/Background_Music_Soft_Piano_Music_ppKS2s4.aac',
        'title': 'soft_piano_music',
        'type': 'audio',
        'duration': 141,
        'width': 0,
        'height': 0,
        'thumbnail': ''
      }
    ],
    'galleryImages': <Map<String, dynamic>>[
      <String, dynamic>{
        'ID': 1,
        'image': <String, dynamic>{
          'ID': 8,
          'title': 'Contrail',
          'meta': <String, dynamic>{
            'imageDownloadUrl':
                'https://storage.googleapis.com/mycarehub-test/media/original_images/jake-nackos-zAeD6Gug2PY-unsplash_IXYJr4K.jpg'
          }
        }
      },
      <String, dynamic>{
        'ID': 2,
        'image': <String, dynamic>{
          'ID': 7,
          'title': 'Plane_with_background',
          'meta': <String, dynamic>{
            'imageDownloadUrl':
                'https://storage.googleapis.com/mycarehub-test/media/original_images/vino-li-kpcJgsvpY3Q-unsplash_9w4CILs.jpg'
          }
        }
      },
      <String, dynamic>{
        'ID': 3,
        'image': <String, dynamic>{
          'ID': 9,
          'title': 'sunbeds3',
          'meta': <String, dynamic>{
            'imageDownloadUrl':
                'https://storage.googleapis.com/mycarehub-test/media/original_images/valentin-b-kremer-icXbm3QDw2w-unsplash_YNcTzbk.jpg'
          }
        }
      },
      <String, dynamic>{
        'ID': 4,
        'image': <String, dynamic>{
          'ID': 11,
          'title': 'syringe',
          'meta': <String, dynamic>{
            'imageDownloadUrl':
                'https://storage.googleapis.com/mycarehub-test/media/original_images/mika-baumeister-fPE_qTJu3Ws-unsplash_4NqBMVN.jpg'
          }
        }
      }
    ],
  },
  <String, dynamic>{
    'ID': 1,
    'title': 'Tips on how to keep yourself healthy',
    'date': '2021-08-23T06:42:05.085216Z',
    'intro': 'Keep yourself healthy',
    'authorName': 'Abiud Orina',
    'authorAvatar': 'https://i.postimg.cc/9XpbrC25/profile-image.png',
    'author': <String, dynamic>{'ID': 'some-id'},
    'itemType': 'ARTICLE',
    'timeEstimateSeconds': 180,
    'body':
        'The coronavirus pandemic has affected our lives, our economy, and nearly every corner of the globe. Almost 4 billion vaccine doses have been administered worldwide; 53 for every 100 people. But the worldwide numbers of infections continue to rise, driven by the Delta variant with highly vaccinated regions like Western Europe and the United States, where cases are relatively low but climbing fast. As cases continue to surge, you can take some steps to keep yourself and your family safe. Here are some tips from our trusted science team.',
    'heroImageRendition': <String, dynamic>{
      'url': 'https://i.postimg.cc/zvW46yxk/wellness.jpg',
    },
    'likeCount': 180,
    'bookmarkCount': 180,
    'viewCount': 180,
    'shareCount': 180,
    'hasSaved': false,
    'hasLiked': false,
    'documents': <dynamic>[],
    'isNew': true,
    'firstPublishedAt': '2021-08-23T06:42:05.085216Z',
    'meta': <String, dynamic>{
      'contentHTMLURL': 'https://mycarehub.co.ke/',
      'firstPublishedAt': '2021-08-23T06:42:05.085216Z',
    },
    'tagNames': <String>['Recommended', 'Health', 'Fitness'],
    'featuredMedia': <Map<String, dynamic>>[
      <String, dynamic>{
        'ID': 7,
        'url':
            'https://storage.googleapis.com/mycarehub-test/media/media/Background_Music_Soft_Piano_Music.aac',
        'title': 'Background',
        'type': 'audio',
        'width': 0,
        'duration': 6,
        'height': 0,
        'thumbnail': ''
      }
    ],
    'galleryImages': <Map<String, dynamic>>[
      mockGalleryImage,
      mockGalleryImage,
      mockGalleryImage,
      mockGalleryImage,
      mockGalleryImage,
    ],
  },
];

final Map<String, dynamic> documentContentMock = <String, dynamic>{
  'ID': 16,
  'title': 'Test Document',
  'date': '2022-01-13',
  'intro': 'This is a test document',
  'authorName': 'Test',
  'tagNames': <String>['test'],
  'meta': <String, dynamic>{
    'contentType': 'content.ContentItem',
    'contentHTMLURL': 'http://test-document/',
    'slug': 'test-document',
    'showInMenus': false,
    'seoTitle': '',
    'searchDescription': '',
    'firstPublishedAt': '2022-01-13T11:36:56.749531+03:00',
    'locale': 'en'
  },
  'itemType': 'PDF_DOCUMENT',
  'timeEstimateSeconds': 10,
  'body': '''
<p data-block-key="sg8u8">Test document</p>''',
  'heroImage': <String, dynamic>{'ID': 14, 'title': 'document'},
  'heroImageRendition': <String, dynamic>{
    'url': 'https://test.jpg',
    'width': 720,
    'height': 1080,
    'alt': 'document'
  },
  'likeCount': 0,
  'bookmarkCount': 0,
  'viewCount': 0,
  'shareCount': 0,
  'author': <String, dynamic>{'ID': 'test-id-001'},
  'documents': <Map<String, dynamic>>[
    <String, dynamic>{
      'ID': 10001,
      'Document': <String, dynamic>{
        'ID': 10001,
        'title': 'myCareHub Requirements',
        'meta': <String, dynamic>{
          'documentDetailUrl':
              'http://www.africau.edu/images/default/sample.pdf',
          'documentDownloadUrl':
              'http://www.africau.edu/images/default/sample.pdf'
        }
      }
    }
  ],
  'categoryDetails': <Map<String, dynamic>>[
    <String, dynamic>{
      'ID': 6,
      'categoryName': 'recommended',
      'categoryIcon': 'https://test.png'
    }
  ],
};

final List<Map<String, dynamic>> categoriesMock = <Map<String, dynamic>>[
  <String, dynamic>{
    'id': 2,
    'name': 'recommended',
    'iconUrl': 'test-image.png',
  },
  <String, dynamic>{
    'id': 1,
    'name': 'welcome',
    'iconUrl': 'test-image.png',
  },
  <String, dynamic>{
    'id': 3,
    'name': 'exercise',
    'iconUrl': 'test-image.png',
  },
  <String, dynamic>{
    'id': 4,
    'name': 'diet',
    'iconUrl': 'test-image.png',
  },
  <String, dynamic>{
    'id': 10002,
    'name': 'pro-faqs',
    'iconUrl': 'test-image.png',
  }
];

final core.Content mockVideoContent =
    core.Content.fromJson(videoContentMock.first);

final List<Map<String, dynamic>> videoContentMock = <Map<String, dynamic>>[
  <String, dynamic>{
    'ID': 1,
    'title': 'Tips on how to keep yourself healthy',
    'date': '2021-08-23T06:42:05.085216Z',
    'intro': 'Keep yourself healthy',
    'authorName': 'Abiud Orina',
    'authorAvatar': 'https://i.postimg.cc/9XpbrC25/profile-image.png',
    'author': <String, dynamic>{'ID': 'some-id'},
    'itemType': 'AUDIO_VIDEO',
    'timeEstimateSeconds': 180,
    'body':
        'The coronavirus pandemic has affected our lives, our economy, and nearly every corner of the globe. Almost 4 billion vaccine doses have been administered worldwide; 53 for every 100 people. But the worldwide numbers of infections continue to rise, driven by the Delta variant with highly vaccinated regions like Western Europe and the United States, where cases are relatively low but climbing fast. As cases continue to surge, you can take some steps to keep yourself and your family safe. Here are some tips from our trusted science team.',
    'heroImageRendition': <String, dynamic>{
      'url': 'https://i.postimg.cc/zvW46yxk/wellness.jpg',
    },
    'likeCount': 180,
    'bookmarkCount': 180,
    'viewCount': 180,
    'shareCount': 180,
    'hasSaved': false,
    'hasLiked': false,
    'documents': <dynamic>[],
    'isNew': true,
    'featuredMedia': <dynamic>[
      <String, dynamic>{
        'ID': 1,
        'url':
            'https://storage.googleapis.com/mycarehub-test/media/media/production_ID_4473012.mp4',
        'title': 'Awesome diet video',
        'type': 'video',
        'duration': 165,
        'width': 100,
        'height': 0,
        'thumbnail':
            'https://storage.googleapis.com/mycarehub-test/media/media_thumbnails/vitalii-pavlyshynets-kcRFW-Hje8Y-unsplash_1.jpg',
      }
    ],
    'firstPublishedAt': '2021-08-23T06:42:05.085216Z',
    'meta': <String, dynamic>{
      'contentHTMLURL': 'https://mycarehub.co.ke/',
      'firstPublishedAt': '2021-08-23T06:42:05.085216Z',
    },
    'tagNames': <String>['Recommended', 'Health', 'Fitness'],
  },
];

final Map<String, dynamic> mockGalleryImage = <String, dynamic>{
  'id': 2,
  'image': <String, dynamic>{
    'title': 'mockImage',
    'meta': <String, String>{'imageDownloadUrl': 'testImage'}
  }
};
