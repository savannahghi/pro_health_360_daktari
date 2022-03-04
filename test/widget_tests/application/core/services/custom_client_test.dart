import 'dart:convert';
import 'dart:typed_data';

import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myharehubpro/application/core/services/custom_client.dart';
import 'package:myharehubpro/application/redux/states/app_state.dart';
import 'package:myharehubpro/domain/core/entities/core/auth_credentials.dart';
import 'package:myharehubpro/infrastructure/endpoints.dart' as app_endpoints;
import 'package:http/http.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';
import 'custom_client_test.mocks.dart' as mocks;

@GenerateMocks(<Type>[Request, Client])
void main() {
  group('CustomClient', () {
    final MockTestGraphQlClient mockSILGraphQlClient =
        MockTestGraphQlClient.withResponse(
      'idToken',
      'endpoint',
      Response('', 200),
    );
    testWidgets('should proceed normally if token has not expired',
        (WidgetTester tester) async {
      final DateTime tokenExpiryDate =
          DateTime.now().add(const Duration(hours: 10));

      final Store<AppState> store = Store<AppState>(
        initialState: AppState.initial().copyWith(
          credentials: AuthCredentials(
            isSignedIn: true,
            tokenExpiryTimestamp: tokenExpiryDate.toIso8601String(),
          ),
        ),
      );

      late CustomClient customClient;

      await tester.pumpWidget(
        StoreProvider<AppState>(
          store: store,
          child: Builder(
            builder: (BuildContext context) {
              customClient = CustomClient(
                '',
                '',
                refreshTokenEndpoint: '',
                userID: '',
                context: context,
              );
              return Container();
            },
          ),
        ),
      );
      await tester.pumpAndSettle();

      final mocks.MockRequest baseRequest = mocks.MockRequest();
      final String jsonContent = json.encode(mockSecurityQuestionResponse);

      when(baseRequest.url).thenReturn(
        Uri.parse(app_endpoints.kTestGraphqlEndpoint),
      );

      when(baseRequest.send()).thenAnswer((_) {
        final List<int> responseBytes = utf8.encode(jsonContent);
        final StreamedResponse streamedResponse =
            StreamedResponse(Stream<List<int>>.value(responseBytes), 200);

        return Future<StreamedResponse>.value(streamedResponse);
      });

      when(baseRequest.headers).thenAnswer((_) => <String, String>{});

      final StreamedResponse resp = await customClient.send(baseRequest);

      final String respBody = await resp.stream.bytesToString();
      expect(jsonDecode(respBody), mockSecurityQuestionResponse);
    });

    testWidgets('should skip checks if request is login',
        (WidgetTester tester) async {
      final Store<AppState> store = Store<AppState>(
        initialState: AppState.initial(),
      );

      late CustomClient customClient;

      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: mockSILGraphQlClient,
        widget: Builder(
          builder: (BuildContext context) {
            customClient = CustomClient(
              '',
              '',
              refreshTokenEndpoint: '',
              userID: '',
              context: context,
            );
            return Container();
          },
        ),
      );

      await tester.pumpAndSettle();

      final mocks.MockRequest baseRequest = mocks.MockRequest();
      final String jsonContent = json.encode(mockLoginResponse);

      when(baseRequest.url).thenReturn(
        Uri.parse(app_endpoints.kTestLoginByPhoneEndpoint),
      );

      when(baseRequest.send()).thenAnswer((_) {
        final List<int> responseBytes = utf8.encode(jsonContent);
        final StreamedResponse streamedResponse =
            StreamedResponse(Stream<List<int>>.value(responseBytes), 200);

        return Future<StreamedResponse>.value(streamedResponse);
      });
      when(baseRequest.headers).thenAnswer((_) => <String, String>{});

      final StreamedResponse resp = await customClient.send(baseRequest);

      final String respBody = await resp.stream.bytesToString();
      expect(jsonDecode(respBody), mockLoginResponse);
    });

    testWidgets('should refresh token if abnormal expiry date',
        (WidgetTester tester) async {
      final AppState state = AppState(
        credentials: AuthCredentials.initial().copyWith(isSignedIn: true),
      );

      final Store<AppState> store = Store<AppState>(initialState: state);

      late CustomClient customClient;

      final mocks.MockClient client = mocks.MockClient();

      const String userId = 'some-user-id';

      when(
        client.post(
          any,
          headers: <String, String>{'content-type': 'application/json'},
          body: jsonEncode(<String, String>{'userID': userId}),
        ),
      ).thenAnswer((_) {
        return Future<Response>.value(
          Response(
            jsonEncode(mockAuthCredentials),
            200,
            request: Request(
              'POST',
              Uri.parse(
                app_endpoints.kTestRefreshTokenEndpoint,
              ),
            ),
            headers: <String, String>{'content-type': 'application/json'},
          ),
        );
      });

      await tester.pumpWidget(
        StoreProvider<AppState>(
          store: store,
          child: Builder(
            builder: (BuildContext context) {
              customClient = CustomClient(
                '',
                '',
                refreshTokenEndpoint: app_endpoints.kTestRefreshTokenEndpoint,
                userID: userId,
                client: client,
                context: context,
              );
              return Container();
            },
          ),
        ),
      );
      await tester.pumpAndSettle();

      final mocks.MockRequest mockRequest = mocks.MockRequest();
      final String jsonContent = json.encode(mockSecurityQuestionResponse);

      when(mockRequest.headers).thenReturn(
        <String, String>{'content-type': 'application/json'},
      );

      when(mockRequest.send()).thenAnswer((_) {
        final List<int> responseBytes = utf8.encode(jsonContent);
        final StreamedResponse streamedResponse =
            StreamedResponse(Stream<List<int>>.value(responseBytes), 200);

        return Future<StreamedResponse>.value(streamedResponse);
      });

      when(mockRequest.headers).thenAnswer((_) => <String, String>{});
      when(mockRequest.method).thenReturn('POST');
      when(mockRequest.url).thenReturn(
        Uri.parse(app_endpoints.kTestGraphqlEndpoint),
      );
      when(mockRequest.encoding).thenReturn(Encoding.getByName('utf-8')!);
      when(mockRequest.body).thenReturn(jsonContent);
      when(mockRequest.bodyBytes).thenReturn(
        Uint8List.fromList(utf8.encode(jsonContent)),
      );

      final StreamedResponse resp = await customClient.send(mockRequest);
      final String respBody = await resp.stream.bytesToString();

      expect(jsonDecode(respBody), mockSecurityQuestionResponse);
      expect(store.state.credentials?.idToken, mockAuthCredentials['idToken']);
    });

    testWidgets(
        'should refresh token if token has expired, and then proceed normally',
        (WidgetTester tester) async {
      final AppState state = AppState(
        credentials: AuthCredentials(isSignedIn: true),
      );

      final Store<AppState> store = Store<AppState>(initialState: state);

      late CustomClient customClient;

      final mocks.MockClient client = mocks.MockClient();

      const String userId = 'some-user-id';

      when(
        client.post(
          any,
          headers: <String, String>{'content-type': 'application/json'},
          body: jsonEncode(<String, String>{'userID': userId}),
        ),
      ).thenAnswer((_) {
        return Future<Response>.value(
          Response(
            jsonEncode(mockAuthCredentials),
            200,
            request: Request(
              'POST',
              Uri.parse(
                app_endpoints.kTestRefreshTokenEndpoint,
              ),
            ),
            headers: <String, String>{'content-type': 'application/json'},
          ),
        );
      });

      await tester.pumpWidget(
        StoreProvider<AppState>(
          store: store,
          child: Builder(
            builder: (BuildContext context) {
              customClient = CustomClient(
                '',
                '',
                refreshTokenEndpoint: app_endpoints.kTestRefreshTokenEndpoint,
                userID: userId,
                client: client,
                context: context,
              );
              return Container();
            },
          ),
        ),
      );
      await tester.pumpAndSettle();

      final mocks.MockRequest mockRequest = mocks.MockRequest();
      final String jsonContent = json.encode(mockSecurityQuestionResponse);

      when(mockRequest.headers).thenReturn(
        <String, String>{'content-type': 'application/json'},
      );

      when(mockRequest.send()).thenAnswer((_) {
        final List<int> responseBytes = utf8.encode(jsonContent);
        final StreamedResponse streamedResponse =
            StreamedResponse(Stream<List<int>>.value(responseBytes), 200);

        return Future<StreamedResponse>.value(streamedResponse);
      });

      when(mockRequest.headers).thenAnswer((_) => <String, String>{});
      when(mockRequest.method).thenReturn('POST');
      when(mockRequest.url).thenReturn(
        Uri.parse(app_endpoints.kTestGraphqlEndpoint),
      );
      when(mockRequest.encoding).thenReturn(Encoding.getByName('utf-8')!);
      when(mockRequest.body).thenReturn(jsonContent);
      when(mockRequest.bodyBytes).thenReturn(
        Uint8List.fromList(utf8.encode(jsonContent)),
      );

      final StreamedResponse resp = await customClient.send(mockRequest);
      final String respBody = await resp.stream.bytesToString();

      expect(jsonDecode(respBody), mockSecurityQuestionResponse);
      expect(store.state.credentials?.idToken, mockAuthCredentials['idToken']);
    });
  });
}

class MockCustomClient extends CustomClient {
  MockCustomClient(
    String idToken,
    String endpoint, {
    required BuildContext context,
    required this.customResponse,
  }) : super(
          idToken,
          endpoint,
          refreshTokenEndpoint: kTestRefreshTokenEndpoint,
          userID: '',
          context: context,
        );

  final Map<String, dynamic> customResponse;

  @override
  Future<StreamedResponse> send(BaseRequest request) async {
    super.send(request);
    final String jsonResponse = jsonEncode(customResponse);
    final List<int> byteResponse = utf8.encode(jsonResponse);

    return StreamedResponse(Stream<List<int>>.value(byteResponse), 200);
  }
}
