import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/domain/core/entities/core/role.dart';
import 'package:mycarehubpro/domain/core/entities/search_user/roles_list.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_enums.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_widget_keys.dart';
import 'package:mycarehubpro/presentation/search/widgets/search_details_information_widget.dart';
import 'package:mycarehubpro/presentation/search/widgets/staff_search_widget.dart';

import '../../../mocks/mocks.dart';
import '../../../mocks/test_helpers.dart';

void main() {
  final Store<AppState> store =
      Store<AppState>(initialState: AppState.initial());

  group('StaffSearchWidget', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: StaffSearchWidget(
          rolesList: RolesList(
            roles: <Role>[
              Role(roleID: 'some_id', name: RoleValue.CONTENT_MANAGEMENT),
            ],
          ),
        ),
      );

      await tester.pumpAndSettle();
      expect(find.byType(SearchDetailsInformationWidget), findsWidgets);
      expect(find.text(myCareHubReInviteText), findsOneWidget);
    });

    testWidgets('handle unauthorized person successfully',
        (WidgetTester tester) async {
      final MockShortGraphQlClient mockShortSILGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(
            <String, dynamic>{
              'errors': <dynamic>[
                <String, dynamic>{
                  'message': '65: user not authorized:',
                  'path': <dynamic>['assignOrRevokeRoles']
                }
              ],
              'data': null
            },
          ),
          200,
        ),
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: mockShortSILGraphQlClient,
        widget: StaffSearchWidget(
          rolesList: RolesList(
            roles: <Role>[
              Role(roleID: 'some_id', name: RoleValue.CONTENT_MANAGEMENT),
            ],
          ),
        ),
      );
      final Finder updateButtonFinder = find.byKey(updateRolesButtonKey);
      await tester.pumpAndSettle();
      expect(find.byType(SearchDetailsInformationWidget), findsWidgets);
      expect(updateButtonFinder, findsOneWidget);

      await tester.ensureVisible(updateButtonFinder);
      await tester.tap(updateButtonFinder);
      await tester.pumpAndSettle();

      expect(find.byType(SnackBar), findsOneWidget);
    });
  });
}
