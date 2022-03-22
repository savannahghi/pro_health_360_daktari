import 'dart:convert';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mycarehubpro/domain/core/entities/search_user/search_user_response.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_widget_keys.dart';
import 'package:mycarehubpro/presentation/engagement/home/pages/home_page.dart';
import 'package:mycarehubpro/presentation/search/pages/search_page_detail_view.dart';
import 'package:mycarehubpro/presentation/search/widgets/client_search_widget.dart';
import 'package:mycarehubpro/presentation/search/widgets/search_details_information_widget.dart';
import 'package:mycarehubpro/presentation/search/widgets/staff_search_widget.dart';

import '../../../mocks/mocks.dart';
import '../../../mocks/test_helpers.dart';

void main() {
  group('Search Detail View Page', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        graphQlClient: MockTestGraphQlClient(),
        widget: SearchPageDetailView(
          searchUserResponse: SearchUserResponse.initial(),
          isClient: true,
        ),
      );

      await tester.pumpAndSettle();
      expect(find.byType(ClientSearchWidget), findsOneWidget);
      expect(find.byType(SearchDetailsInformationWidget), findsOneWidget);
    });

    testWidgets('renders correctly for staff', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        graphQlClient: MockTestGraphQlClient(),
        widget: SearchPageDetailView(
          searchUserResponse: SearchUserResponse.initial(),
          isClient: false,
        ),
      );

      await tester.pumpAndSettle();
      expect(find.byType(StaffSearchWidget), findsOneWidget);
      expect(find.byType(SearchDetailsInformationWidget), findsOneWidget);
    });

    testWidgets('invite button works correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        graphQlClient: MockTestGraphQlClient(),
        widget: SearchPageDetailView(
          searchUserResponse: SearchUserResponse.initial(),
          isClient: true,
        ),
      );

      await tester.pumpAndSettle();
      expect(find.byType(ClientSearchWidget), findsOneWidget);
      expect(find.byType(SearchDetailsInformationWidget), findsOneWidget);

      await tester.tap(find.byType(MyAfyaHubPrimaryButton));
      await tester.pumpAndSettle();

      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.byType(HomePage), findsOneWidget);
    });

    testWidgets('invite client button shows snackbar when there is an error',
        (WidgetTester tester) async {
      final MockShortGraphQlClient mockShortGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{'data': clientResponseMock}),
          200,
        ),
      );
      await buildTestWidget(
        tester: tester,
        graphQlClient: mockShortGraphQlClient,
        widget: SearchPageDetailView(
          searchUserResponse: SearchUserResponse.initial(),
          isClient: true,
        ),
      );

      await tester.pumpAndSettle();
      expect(find.byType(ClientSearchWidget), findsOneWidget);
      expect(find.byType(SearchDetailsInformationWidget), findsOneWidget);

      await tester.tap(find.byType(MyAfyaHubPrimaryButton));
      await tester.pumpAndSettle();

      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.byType(HomePage), findsOneWidget);
    });

    testWidgets('handles api error when invite client button is tapped',
        (WidgetTester tester) async {
      final MockShortGraphQlClient mockShortGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{'error': 'errors'}),
          400,
        ),
      );
      await buildTestWidget(
        tester: tester,
        graphQlClient: mockShortGraphQlClient,
        widget: SearchPageDetailView(
          searchUserResponse: SearchUserResponse.initial(),
          isClient: true,
        ),
      );

      await tester.pumpAndSettle();
      expect(find.byType(ClientSearchWidget), findsOneWidget);
      expect(find.byType(SearchDetailsInformationWidget), findsOneWidget);

      await tester.tap(find.byType(MyAfyaHubPrimaryButton));
      await tester.pumpAndSettle();

      expect(find.byType(HomePage), findsNothing);
    });

    testWidgets('invite staff button shows snackbar when there is an error',
        (WidgetTester tester) async {
      final MockShortGraphQlClient mockShortGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{'data': clientResponseMock}),
          200,
        ),
      );
      await buildTestWidget(
        tester: tester,
        graphQlClient: mockShortGraphQlClient,
        widget: SearchPageDetailView(
          searchUserResponse: SearchUserResponse.initial(),
          isClient: false,
        ),
      );

      await tester.pumpAndSettle();
      expect(find.byType(StaffSearchWidget), findsOneWidget);
      expect(find.byType(SearchDetailsInformationWidget), findsOneWidget);

      await tester.tap(find.byType(MyAfyaHubPrimaryButton).first);
      await tester.pumpAndSettle();

      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.byType(HomePage), findsOneWidget);
    });

    testWidgets('handles api error when invite staff button is tapped',
        (WidgetTester tester) async {
      final MockShortGraphQlClient mockShortGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{'error': 'errors'}),
          400,
        ),
      );
      await buildTestWidget(
        tester: tester,
        graphQlClient: mockShortGraphQlClient,
        widget: SearchPageDetailView(
          searchUserResponse: SearchUserResponse.initial(),
          isClient: false,
        ),
      );

      await tester.pumpAndSettle();
      expect(find.byType(StaffSearchWidget), findsOneWidget);
      expect(find.byType(SearchDetailsInformationWidget), findsOneWidget);

      await tester.tap(find.byType(MyAfyaHubPrimaryButton).first);
      await tester.pumpAndSettle();

      expect(find.byType(HomePage), findsNothing);
    });

    testWidgets('staff invite button works correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        graphQlClient: MockTestGraphQlClient(),
        widget: SearchPageDetailView(
          searchUserResponse: SearchUserResponse.initial(),
          isClient: false,
        ),
      );

      await tester.pumpAndSettle();
      expect(find.byKey(inviteStaffToMyCareHubButtonKey), findsOneWidget);
      expect(find.byType(SearchDetailsInformationWidget), findsOneWidget);

      await tester.tap(find.byKey(inviteStaffToMyCareHubButtonKey));
      await tester.pumpAndSettle();

      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.byType(HomePage), findsOneWidget);
    });

    testWidgets('update roles button works correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        graphQlClient: MockTestGraphQlClient(),
        widget: SearchPageDetailView(
          searchUserResponse: SearchUserResponse.initial(),
          isClient: false,
        ),
      );

      await tester.pumpAndSettle();
      await tester.ensureVisible(find.byKey(updateRolesButtonKey));

      expect(find.byKey(updateRolesButtonKey), findsOneWidget);
      expect(find.byType(SearchDetailsInformationWidget), findsOneWidget);

      await tester.tap(find.byKey(updateRolesButtonKey));
      await tester.pumpAndSettle();

      expect(find.byType(SnackBar), findsOneWidget);
    });

    testWidgets('checkboxes work correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        graphQlClient: MockTestGraphQlClient(),
        widget: SearchPageDetailView(
          searchUserResponse: SearchUserResponse.initial(),
          isClient: false,
        ),
      );

      await tester.pumpAndSettle();
      await tester.ensureVisible(find.byKey(updateRolesButtonKey));

      final Finder clientManagementFinder =
          find.byKey(const Key('Client management'));
      final Finder contentManagementFinder =
          find.byKey(const Key('Content management'));
      final Finder systemAdministrationFinder =
          find.byKey(const Key('System administrator'));
      final Finder communityManagementFinder =
          find.byKey(const Key('Community management'));

      expect(find.byKey(updateRolesButtonKey), findsOneWidget);
      expect(clientManagementFinder, findsOneWidget);
      expect(contentManagementFinder, findsOneWidget);
      expect(systemAdministrationFinder, findsOneWidget);
      expect(communityManagementFinder, findsOneWidget);

      await tester.tap(clientManagementFinder);
      await tester.pumpAndSettle();

      await tester.tap(contentManagementFinder);
      await tester.pumpAndSettle();

      await tester.tap(systemAdministrationFinder);
      await tester.pumpAndSettle();

      await tester.tap(communityManagementFinder);
      await tester.pumpAndSettle();

      expect(find.text(updateRoles), findsOneWidget);
      await tester.tap(find.text(updateRoles));

      await tester.pumpAndSettle();
      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.byType(HomePage), findsOneWidget);
    });

    testWidgets('assigning roles fails when api returns an error',
        (WidgetTester tester) async {
      final MockShortGraphQlClient mockShortSILGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{'assignRoles': false}
          }),
          200,
        ),
      );
      await buildTestWidget(
        tester: tester,
        graphQlClient: mockShortSILGraphQlClient,
        widget: SearchPageDetailView(
          searchUserResponse: SearchUserResponse.initial(),
          isClient: false,
        ),
      );

      await tester.pumpAndSettle();
      await tester.ensureVisible(find.byKey(updateRolesButtonKey));

      final Finder clientManagementFinder =
          find.byKey(const Key('Client management'));
      final Finder contentManagementFinder =
          find.byKey(const Key('Content management'));
      final Finder systemAdministrationFinder =
          find.byKey(const Key('System administrator'));
      final Finder communityManagementFinder =
          find.byKey(const Key('Community management'));

      expect(find.byKey(updateRolesButtonKey), findsOneWidget);
      expect(clientManagementFinder, findsOneWidget);
      expect(contentManagementFinder, findsOneWidget);
      expect(systemAdministrationFinder, findsOneWidget);
      expect(communityManagementFinder, findsOneWidget);

      await tester.tap(clientManagementFinder);
      await tester.pumpAndSettle();

      await tester.tap(contentManagementFinder);
      await tester.pumpAndSettle();

      await tester.tap(systemAdministrationFinder);
      await tester.pumpAndSettle();

      await tester.tap(communityManagementFinder);
      await tester.pumpAndSettle();

      expect(find.text(updateRoles), findsOneWidget);
      await tester.tap(find.text(updateRoles));

      await tester.pumpAndSettle();
      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.byType(HomePage), findsOneWidget);
    });
  });
}
