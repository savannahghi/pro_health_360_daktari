import 'dart:convert';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:connectivity_plus_platform_interface/connectivity_plus_platform_interface.dart';
// Flutter imports:
import 'package:flutter/material.dart';
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
  'icon': mockIconDetails,
  'description':
      'Your Teleconsult with Dr Tibu for 11am has been set. Click this link to join ',
  'date': 'July 21 2021',
  'actions': <dynamic>[mockNotificationActions],
  'status': 'Missed'
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
    'photoUploadID': UNKNOWN,
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
final Map<String, dynamic> mockPendingServiceRequests = <String, dynamic>{
  'total': 4,
  'requestsTypeCount': <dynamic>[
    <String, dynamic>{'requestType': 'RED_FLAG', 'total': 2},
    <String, dynamic>{'requestType': 'PIN_RESET', 'total': 2},
  ],
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
    'photoUploadID': UNKNOWN,
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

    if (queryString.contains(getPendingServiceRequestsCountQuery)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'getPendingServiceRequestsCount': mockPendingServiceRequests
            }
          }),
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

    if (queryString.contains(pinResetRequestMutation)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(
            <String, dynamic>{
              'data': <String, dynamic>{'verifyPinResetServiceRequest': true}
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

    if (queryString.contains(assignRoleMutation)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(
            <String, dynamic>{
              'data': <String, dynamic>{'assignRoles': true}
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
  'gender': Gender.unknown.name,
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
  'gender': Gender.unknown.name,
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
  ]
};

final Map<String, dynamic> groupStateMock = <String, dynamic>{
  'listCommunityMembers': <dynamic>[
    <String, dynamic>{
      'user': <String, dynamic>{
        'ID': UNKNOWN,
        'userID': UNKNOWN,
        'name': UNKNOWN,
        'role': UNKNOWN,
        'username': UNKNOWN,
        'gender': 'unknown',
      },
      'isModerator': true,
    },
  ],
};

final Map<String, dynamic> clientResponseMock = <String, dynamic>{
  'searchClientsByCCCNumber': <dynamic>[
    <String, dynamic>{
      'ID': 'some-id',
      'CCCNumber': '1234',
      'User': <String, dynamic>{
        'ID': 'some-id',
        'Username': 'Username',
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
  'searchStaffByStaffNumber': <dynamic>[
    <String, dynamic>{
      'ID': 'some-id',
      'User': <String, dynamic>{
        'ID': 'some-id',
        'Username': 'Username',
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
    'ID': UNKNOWN,
    'CCCNumber': UNKNOWN,
    'StaffNumber': UNKNOWN,
    'rolesList': <String, dynamic>{'getUserRoles': <dynamic>[]},
    'User': <String, dynamic>{
      'ID': UNKNOWN,
      'Username': UNKNOWN,
      'TermsAccepted': false,
      'Active': false,
      'Contacts': <String, dynamic>{
        'ID': UNKNOWN,
        'Active': false,
        'ContactType': 'PHONE',
        'ContactValue': UNKNOWN,
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
    'serviceRequestContent': <String, dynamic>{},
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
    'ResponseType': SecurityQuestionResponseType.UNKNOWN.name,
    'Active': true,
  },
  <String, dynamic>{
    'SecurityQuestionID': 'id2',
    'QuestionStem': 'Which month did you start your treatment?',
    'Description': 'Enter the month you started your treatment',
    'ResponseType': SecurityQuestionResponseType.DATE.name,
    'Active': true,
  },
  <String, dynamic>{
    'SecurityQuestionID': 'id3',
    'QuestionStem': 'Which county is your clinic located?',
    'Description': 'nter the name of the county in small letters',
    'ResponseType': SecurityQuestionResponseType.UNKNOWN.name,
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

Map<String, dynamic> mockFAQContent = <String, dynamic>{
  'ID': 'id',
  'Active': true,
  'Title': 'title',
  'Body': 'body',
  'Description': 'description',
  'Flavour': Flavour.consumer.name,
};

final List<dynamic> listMembersMock = <dynamic>[
  <String, dynamic>{
    'ID': 'id1',
    'userID': 'some-user-id',
    'role': 'user',
    'name': 'Sam',
    'gender': Gender.male.name,
  },
  <String, dynamic>{
    'ID': 'id1',
    'userID': 'some-user-id',
    'role': 'user',
    'name': 'Jane',
    'gender': Gender.male.name,
  },
  <String, dynamic>{
    'ID': 'id1',
    'userID': 'some-user-id',
    'role': 'user',
    'name': 'Julian',
    'gender': Gender.male.name,
  },
];

final Map<String, dynamic> groupInfoPagePayloadMock = <String, dynamic>{
  'channelId': testString,
  'memberCount': 1,
  'channelName': 'Ruaraka Group'
};

final Map<String, dynamic> mockCommunitiesState = <String, dynamic>{
  'invitedCommunities': <dynamic>[
    <String, dynamic>{
      'id': UNKNOWN,
      'name': UNKNOWN,
      'memberCount': 0,
      'description': UNKNOWN,
      'createdBy': UNKNOWN,
    },
  ]
};

final Map<String, dynamic> mockCommunity = <String, dynamic>{
  'id': UNKNOWN,
  'name': UNKNOWN,
  'memberCount': 0,
  'description': UNKNOWN,
  'createdBy': UNKNOWN,
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
