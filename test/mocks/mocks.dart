// Dart imports:
import 'dart:convert';
import 'dart:io';

// Package imports:
import 'package:app_wrapper/app_wrapper.dart';
import 'package:bewell_pro_core/application/core/graphql/mutations.dart';
import 'package:domain_objects/value_objects.dart';
// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:flutter_graphql_client/graph_sqlite.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:healthcloud/domain/core/value_objects/app_asset_strings.dart';
// Project imports:
import 'package:healthcloud/infrastructure/repository/initialize_db.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:user_feed/user_feed.dart' as feed_obj;

EmailAddress testEmailAddress = EmailAddress.withValue('demo@gmail.com');

class MockBuildContext extends Mock implements BuildContext {}

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

class MockDeviceCapabilities extends IDeviceCapabilities {}

final MockDeviceCapabilities deviceCapabilities = MockDeviceCapabilities();

const Size tabletPortrait = Size(720, 1280);
const Size tabletLandscape = Size(1280, 720);
const Size typicalLargePhoneScreenSizePortrait = Size(300, 800);

String testPath(String relativePath) {
  final Directory current = Directory.current;
  final String path =
      current.path.endsWith('/test') ? current.path : '${current.path}/test';

  return '$path/$relativePath';
}

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

/// a short client for providing custom responses
///
/// a good use case is when you want to return error responses
class MockShortSILGraphQlClient extends IGraphQlClient {
  MockShortSILGraphQlClient.withResponse(
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

final MockSILGraphQlClient mockSILGraphQlClient =
    MockSILGraphQlClient.withResponse(
  'idToken',
  'endpoint',
  http.Response('success response', 200),
);

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

class MockSILGraphQlClient extends IGraphQlClient {
  MockSILGraphQlClient();

  MockSILGraphQlClient.withResponse(
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
        http.Response(json.encode(mockAuthLoginResponse), 201),
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

    if (queryString == registerDeviceTokenMutation) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{'registerPushToken': true}
          }),
          201,
        ),
      );
    }

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

    if (queryString.contains('addOrganizationPractitionerKYC')) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'input': <String, dynamic>{
              'kraPIN': <String>['12345678'],
              'organizationTypeName': 'Demo Organization',
              'certificateOfIncorporation': '',
              'certificateOfInCorporationUploadID': '',
              'organizationCertificate': '',
              'cadre': ''
            }
          }),
          201,
        ),
      );
    }

    if (queryString.contains('addIndividualPractitionerKYC')) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'input': <String, dynamic>{
              'kraPIN': <String>['12345678'],
              'supportingDocumentsUploadID  ': '',
              'registrationNumber': '',
              'practiceLicenseID': '',
              'cadre': ''
            }
          }),
          201,
        ),
      );
    }

    if (queryString.contains('checkSupplierKYCSubmitted')) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{'checkSupplierKYCSubmitted': false}
          }),
          201,
        ),
      );
    }

    if (queryString.contains('getFeed')) {
      return Future<http.Response>.value(
        http.Response(json.encode(mockUserFeed), 201),
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

    return Future<http.Response>.value(
      http.Response(json.encode(<String, dynamic>{}), 201),
    );
  }
}

String testKYCSupportingDocumentTitle = 'document-title';
String testKYCSupportingDocumentDescription = 'document-description';
String testKYCCertificateOfIncorporationNumber = '12345678';
String testKYCLicenceNumber = '84678939';
String testKYCKraNumber = 'A2345788';
String testKYCIdNumber = '12345678';
String testKYCIdType = 'National ID';
String testKYCRegistrationNumber = '12345678';

Map<String, dynamic> mockSecurityQuestion = <String, dynamic>{
  'id': 'id',
  'questionStem': 'question_stem',
  'description': 'description',
  'responseType': 'response_type',
  'flavour': 'flavour',
  'active': true,
  'sequence': 1,
};

Map<String, dynamic> mockSecurityQuestionResponse = <String, dynamic>{
  'id': 'id',
  'timeStamp': '2021-05-06T05:34:24Z',
  'userId': 'userId',
  'securityQuestionId': 'securityQuestionId',
  'response': 'response',
};

final Map<String, dynamic> mockFeedContent = <String, dynamic>{
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
      'text': 'Fill in your Be.Well business KYC in order to start transacting',
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

final Map<String, dynamic> mockStaffState = <String, dynamic>{
  'userState': <String, dynamic>{
    'userProfile': <String, dynamic>{
      'id': 'UNKNOWN',
      'userName': 'UNKNOWN',
      'primaryPhone': null,
      'primaryEmailAddress': 'unknown@bewell.co.ke',
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

final Map<String, dynamic> mockMiscState = <String, dynamic>{
  'visitCount': 'UNKNOWN',
  'title': 'UNKNOWN',
  'message': 'UNKNOWN',
  'phoneNumber': 'UNKNOWN',
  'otpCode': 'UNKNOWN',
  'pinCode': 'UNKNOWN',
  'acceptedTerms': false,
  'faqList': <dynamic>[],
  'eventState': <String, dynamic>{
    'eventName': 'UNKNOWN',
    'eventPayload': 'UNKNOWN'
  },
  'defaultLocation': 'UNKNOWN',
  'createPin': 'UNKNOWN',
  'confirmPin': 'UNKNOWN',
  'invalidCredentials': false,
  'unKnownPhoneNo': false,
  'accountExists': false,
  'invalidPin': false,
  'patientSearchTerm': null,
  'hasCompletedEnteringOTP': false,
  'isResendingOTP': false
};

final Map<String, dynamic> appstateMock = <String, dynamic>{
  'homeState': <String, dynamic>{},
  'onboardingState': <String, dynamic>{},
  'bottomNavigationState': <String, dynamic>{'currentBottomNavIndex': 0},
  'miscState': mockMiscState,
  'staffState': mockStaffState,
  'surveyState': <String, dynamic>{},
  'serviceRequestState': <String, dynamic>{},
};
