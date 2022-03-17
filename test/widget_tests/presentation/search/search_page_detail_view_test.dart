import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mycarehubpro/domain/core/entities/profile/client_response.dart';
import 'package:mycarehubpro/presentation/search/pages/search_page_detail_view.dart';
import 'package:mycarehubpro/presentation/search/widgets/client_details_information_widget.dart';
import 'package:mycarehubpro/presentation/search/widgets/client_search_widget.dart';

import '../../../mocks/test_helpers.dart';

void main() {
  group('Search Detail View Page', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        widget: SearchPageDetailView(
          cccNumber: '123',
          clientResponse: ClientResponse.initial(),
        ),
      );

      await tester.pumpAndSettle();
      expect(find.byType(ClientSearchWidget), findsOneWidget);
      expect(find.byType(ClientDetailsInformationWidget), findsOneWidget);
    });

    testWidgets('invite button works correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        widget: SearchPageDetailView(
          cccNumber: '123',
          clientResponse: ClientResponse.initial(),
        ),
      );

      await tester.pumpAndSettle();
      expect(find.byType(ClientSearchWidget), findsOneWidget);
      expect(find.byType(ClientDetailsInformationWidget), findsOneWidget);

      await tester.tap(find.byType(MyAfyaHubPrimaryButton));
      await tester.pumpAndSettle();

      expect(find.byType(SnackBar), findsOneWidget);
    });
  });
}
