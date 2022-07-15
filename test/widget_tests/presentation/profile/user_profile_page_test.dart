// Flutter imports:
import 'dart:convert';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/entities/core/facility.dart';
import 'package:prohealth360_daktari/domain/core/entities/core/staff_state.dart';
import 'package:prohealth360_daktari/domain/core/entities/core/user.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/communities/invited_groups/pages/invited_groups_page.dart';
import 'package:prohealth360_daktari/presentation/contact_admin/pages/contact_admin_page.dart';
import 'package:prohealth360_daktari/presentation/engagement/home/widgets/action_card.dart';
import 'package:prohealth360_daktari/presentation/profile/faqs/pages/profile_faqs_page.dart';
import 'package:prohealth360_daktari/presentation/profile/pages/add_facility_contact_page.dart';
import 'package:prohealth360_daktari/presentation/profile/pages/facility_contacts_page.dart';
import 'package:prohealth360_daktari/presentation/profile/pages/settings_page.dart';
import 'package:prohealth360_daktari/presentation/profile/pages/user_profile_page.dart';
import 'package:prohealth360_daktari/presentation/profile/widgets/user_details_card_widget.dart'
    as local;

import '../../../mocks/mocks.dart';
import '../../../mocks/test_helpers.dart';

void main() {
  group('UserProfilePage', () {
    final MockShortGraphQlClient mockShortSILGraphQlClient =
        MockShortGraphQlClient.withResponse(
      'idToken',
      'endpoint',
      Response(
        json.encode(<String, dynamic>{
          'data': <String, dynamic>{
            'getFAQContent': <dynamic>[],
          },
        }),
        201,
      ),
    );
    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        widget: Builder(
          builder: (BuildContext context) {
            return UserProfilePage();
          },
        ),
      );
      await tester.pumpAndSettle();
      expect(find.byType(local.UserDetailsCard), findsWidgets);
      final Finder userProfileListItem = find.byType(InformationListCard);
      final Finder backButton = find.byKey(appBarBackButtonKey);
      expect(userProfileListItem, findsNWidgets(6));
      expect(backButton, findsOneWidget);
    });

    testWidgets('navigates to contact admin page correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        widget: Builder(
          builder: (BuildContext context) {
            return UserProfilePage();
          },
        ),
      );
      await tester.pumpAndSettle();
      expect(find.byType(local.UserDetailsCard), findsWidgets);
      final Finder userProfileListItem = find.byType(InformationListCard);
      final Finder backButton = find.byKey(appBarBackButtonKey);
      expect(userProfileListItem, findsNWidgets(6));
      expect(backButton, findsOneWidget);

      await tester.tap(find.text(helpContactAdminString));
      await tester.pumpAndSettle(const Duration(seconds: 1));
      expect(find.byType(ContactAdminPage), findsOneWidget);
    });
    testWidgets('displays ScaffoldMessenger correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        graphQlClient: MockTestGraphQlClient(),
        widget: Builder(
          builder: (BuildContext context) {
            return UserProfilePage();
          },
        ),
      );
      await tester.pumpAndSettle();
      expect(find.byType(local.UserDetailsCard), findsWidgets);
      final Finder userProfileListItem = find.byType(InformationListCard);
      final Finder backButton = find.byKey(appBarBackButtonKey);
      expect(userProfileListItem, findsNWidgets(6));
      expect(backButton, findsOneWidget);

      await tester.tap(find.text(settingsString));
      await tester.pumpAndSettle(const Duration(seconds: 1));
      expect(find.byType(ScaffoldMessenger), findsOneWidget);
    });

    testWidgets('navigates to profile faqs correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        graphQlClient: mockShortSILGraphQlClient,
        widget: Builder(
          builder: (BuildContext context) {
            return UserProfilePage();
          },
        ),
      );

      final Finder faqsTile = find.text(faqsText);
      await tester.pumpAndSettle();

      await tester.ensureVisible(faqsTile);
      await tester.tap(faqsTile);
      await tester.pumpAndSettle();
      expect(find.byType(ProfileFaqsPage), findsWidgets);
    });

    testWidgets('navigates to facility contacts page correctly',
        (WidgetTester tester) async {
      final Store<AppState> store = Store<AppState>(
        initialState: AppState.initial().copyWith(
          staffState: StaffState(
            defaultFacility: 'test',
            defaultFacilityName: 'test',
            facilities: <Facility>[Facility.initial()],
            user: User(
              roles: <Role>[
                Role(
                  active: true,
                  name: RoleValue.SYSTEM_ADMINISTRATOR,
                  roleID: 'test',
                )
              ],
            ),
          ),
        ),
      );

      await buildTestWidget(
        tester: tester,
        graphQlClient: mockShortSILGraphQlClient,
        store: store,
        widget: Builder(
          builder: (BuildContext context) {
            return UserProfilePage();
          },
        ),
      );

      final Finder facilityContactsTile = find.text(facilityContactsString);
      final Finder createContactBtn = find.text(createContactString);
      await tester.pumpAndSettle();

      await tester.ensureVisible(facilityContactsTile);
      await tester.tap(facilityContactsTile);
      await tester.pumpAndSettle();
      expect(find.byType(FacilityContactsPage), findsOneWidget);

      await tester.tap(createContactBtn);
      await tester.pumpAndSettle();
      expect(find.byType(AddFacilityContactPage), findsOneWidget);
    });

    testWidgets('navigates to resolved service requests page correctly',
        (WidgetTester tester) async {
      setupFirebaseAnalyticsMocks();
      await Firebase.initializeApp();
      await buildTestWidget(
        tester: tester,
        graphQlClient: mockShortSILGraphQlClient,
        widget: Builder(
          builder: (BuildContext context) {
            return UserProfilePage();
          },
        ),
      );
      final Finder appBarBackButton = find.byKey(appBarBackButtonKey);

      await tester.tap(find.text(resolvedRequestsString));
      await tester.pumpAndSettle();
      expect(find.byType(ActionCard), findsNWidgets(2));

      await tester.tap(appBarBackButton);
      await tester.pumpAndSettle();
      expect(find.byType(UserProfilePage), findsOneWidget);
    });

    testWidgets('navigates to invited groups page correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        graphQlClient: mockShortSILGraphQlClient,
        widget: Builder(
          builder: (BuildContext context) {
            return UserProfilePage();
          },
        ),
      );

      await tester.tap(find.text(conversationsInvitesTitle));
      await tester.pumpAndSettle(const Duration(seconds: 1));
      expect(find.byType(InvitedGroupsPage), findsOneWidget);
    });

    testWidgets('navigates to settings page correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        graphQlClient: mockShortSILGraphQlClient,
        widget: Builder(
          builder: (BuildContext context) {
            return UserProfilePage();
          },
        ),
      );
      final Finder settings = find.text(settingsString);
      await tester.ensureVisible(settings);
      expect(settings, findsOneWidget);
      await tester.tap(settings);
      await tester.pumpAndSettle(const Duration(seconds: 1));
      expect(find.byType(SettingsPage), findsOneWidget);
    });
  });
}
