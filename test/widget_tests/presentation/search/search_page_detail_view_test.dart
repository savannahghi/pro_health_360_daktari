import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mycarehubpro/domain/core/entities/search_user/search_user_response.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_widget_keys.dart';
import 'package:mycarehubpro/presentation/search/pages/search_page_detail_view.dart';
import 'package:mycarehubpro/presentation/search/widgets/client_search_widget.dart';
import 'package:mycarehubpro/presentation/search/widgets/search_details_information_widget.dart';
import 'package:mycarehubpro/presentation/search/widgets/staff_search_widget.dart';

import '../../../mocks/test_helpers.dart';

void main() {
  group('Search Detail View Page', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        widget: SearchPageDetailView(
          idNumber: '123',
          clientResponse: SearchUserResponse.initial(),
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
        widget: SearchPageDetailView(
          idNumber: '123',
          clientResponse: SearchUserResponse.initial(),
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
        widget: SearchPageDetailView(
          idNumber: '123',
          clientResponse: SearchUserResponse.initial(),
          isClient: true,
        ),
      );

      await tester.pumpAndSettle();
      expect(find.byType(ClientSearchWidget), findsOneWidget);
      expect(find.byType(SearchDetailsInformationWidget), findsOneWidget);

      await tester.tap(find.byType(MyAfyaHubPrimaryButton));
      await tester.pumpAndSettle();

      expect(find.byType(SnackBar), findsOneWidget);
    });

    testWidgets('staff invite button works correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        widget: SearchPageDetailView(
          idNumber: '123',
          clientResponse: SearchUserResponse.initial(),
          isClient: false,
        ),
      );

      await tester.pumpAndSettle();
      expect(find.byKey(inviteStaffToMyCareHubButtonKey), findsOneWidget);
      expect(find.byType(SearchDetailsInformationWidget), findsOneWidget);

      await tester.tap(find.byKey(inviteStaffToMyCareHubButtonKey));
      await tester.pumpAndSettle();

      expect(find.byType(SnackBar), findsOneWidget);
    });

    testWidgets('update roles button works correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        widget: SearchPageDetailView(
          idNumber: '123',
          clientResponse: SearchUserResponse.initial(),
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
        widget: SearchPageDetailView(
          idNumber: '123',
          clientResponse: SearchUserResponse.initial(),
          isClient: false,
        ),
      );

      await tester.pumpAndSettle();
      await tester.ensureVisible(find.byKey(updateRolesButtonKey));

      expect(find.byKey(updateRolesButtonKey), findsOneWidget);
      expect(find.byKey(clientManagementKey), findsOneWidget);
      expect(find.byKey(contentManagementKey), findsOneWidget);
      expect(find.byKey(systemAdminstrationKey), findsOneWidget);
      expect(find.byKey(communityManagementKey), findsOneWidget);

      await tester.tap(find.byKey(clientManagementKey));
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(contentManagementKey));
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(systemAdminstrationKey));
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(communityManagementKey));
      await tester.pumpAndSettle();

      // todo(byron) add assertions once API is ready
    });
  });
}
