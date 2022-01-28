import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:healthcloud/application/core/services/onboarding.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/domain/core/entities/core/processed_response.dart';
import 'package:http/http.dart' as http;
import 'package:shared_themes/constants.dart';

import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  group('Onboarding_utils', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
    });

    group('Process Response', () {
      testWidgets('should process a response with a status code of 500',
          (WidgetTester tester) async {
        final http.Response response =
            http.Response(json.encode(<String, dynamic>{}), 500);

        await buildTestWidget(
          tester: tester,
          store: store,
          widget: Container(),
        );

        final BuildContext context = tester.element(find.byType(Container));

        final ProcessedResponse processedResponse =
            processResponse(response, context);

        // verify the processed response
        expect(processedResponse, isA<ProcessedResponse>());
        expect(processedResponse.ok, false);
        expect(processedResponse.response, response);
        expect(
          processedResponse.message,
          'Sorry, an unknown error occurred. '
          'Try again or contact us $kBewellSupportPhoneNumber',
        );
      });

      testWidgets('should process a response with a status code of 408',
          (WidgetTester tester) async {
        final http.Response response =
            http.Response(json.encode(<String, dynamic>{'code': '0'}), 408);

        await buildTestWidget(
          tester: tester,
          store: store,
          widget: Container(),
        );

        final BuildContext context = tester.element(find.byType(Container));

        final ProcessedResponse processedResponse =
            processResponse(response, context);

        // verify the processed response
        expect(processedResponse, isA<ProcessedResponse>());
        expect(processedResponse.ok, false);
        expect(processedResponse.response, response);
        expect(
          processedResponse.message,
          'Slow internet connection. Please check your connection and try again',
        );
      });

      testWidgets(
          'should process a response with a status code of 400 and'
          ' response code 8', (WidgetTester tester) async {
        final http.Response response =
            http.Response(json.encode(<String, dynamic>{'code': '8'}), 400);

        await buildTestWidget(
          tester: tester,
          store: store,
          widget: const SizedBox(),
        );

        final BuildContext context = tester.element(find.byType(SizedBox));

        final ProcessedResponse processedResponse =
            processResponse(response, context);

        // verify the processed response
        expect(processedResponse, isA<ProcessedResponse>());
        expect(processedResponse.ok, false);
        expect(processedResponse.response, response);
        expect(store.state.miscState!.invalidCredentials, true);
        expect(processedResponse.message, 'Wrong login details provided');
      });

      testWidgets('should process a response with a status code of 400',
          (WidgetTester tester) async {
        final http.Response response =
            http.Response(json.encode(<String, dynamic>{'code': '4'}), 400);

        await buildTestWidget(
          tester: tester,
          store: store,
          widget: Container(),
        );

        final BuildContext context = tester.element(find.byType(Container));

        final ProcessedResponse processedResponse =
            processResponse(response, context);

        // verify the processed response
        expect(processedResponse, isA<ProcessedResponse>());
        expect(processedResponse.ok, false);
        expect(processedResponse.response, response);

        // confirm that the value of [accountExists] from state is true
        expect(store.state.miscState!.accountExists, true);
        expect(
          processedResponse.message,
          'User with that phone number exists.',
        );
      });

      testWidgets(
          'should update state when an unknown phone number error (code 7) has '
          ' been returned from the backend', (WidgetTester tester) async {
        final http.Response response =
            http.Response(json.encode(<String, dynamic>{'code': '7'}), 400);

        await buildTestWidget(
          tester: tester,
          store: store,
          widget: Container(),
        );

        final BuildContext context = tester.element(find.byType(Container));

        final ProcessedResponse processedResponse =
            processResponse(response, context);

        // verify the processed response
        expect(processedResponse, isA<ProcessedResponse>());
        expect(processedResponse.ok, false);
        expect(processedResponse.response, response);

        // confirm that the value of [accountExists] from state is true
        expect(store.state.miscState!.unKnownPhoneNo, true);
        expect(
          processedResponse.message,
          'We could not find a user with those details.',
        );
      });

      testWidgets(
          'should return a default response when processing a response with a '
          ' status code of 503', (WidgetTester tester) async {
        final http.Response response =
            http.Response(json.encode(<String, dynamic>{'code': '7'}), 503);

        await buildTestWidget(
          tester: tester,
          store: store,
          widget: Container(),
        );

        final BuildContext context = tester.element(find.byType(Container));

        final ProcessedResponse processedResponse =
            processResponse(response, context);

        // verify the processed response
        expect(processedResponse, isA<ProcessedResponse>());
        expect(processedResponse.ok, false);
        expect(processedResponse.response, response);

        expect(
          processedResponse.message,
          'Sorry, an error occurred. Please try again,'
          ' or contact Slade 360 Be.Well Support support'
          ' on $kBewellSupportPhoneNumber',
        );
      });
    });

    testWidgets('should process a response with a status code of 201',
        (WidgetTester tester) async {
      final http.Response response = http.Response(
        json.encode(<String, dynamic>{'message': 'success'}),
        201,
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: mockSILGraphQlClient,
        widget: const SizedBox(),
      );

      final BuildContext context = tester.element(find.byType(SizedBox));

      final ProcessedResponse processedResponse =
          processResponse(response, context);

      await tester.pump();

      expect(processedResponse, isA<ProcessedResponse>());
      expect(processedResponse.ok, true);
      expect(processedResponse.response, response);
      expect(processedResponse.message, '');
    });
  });
}
