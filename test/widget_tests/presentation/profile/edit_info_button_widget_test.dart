import 'package:async_redux/async_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mycarehubpro/application/core/services/utils.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';
import 'package:mycarehubpro/presentation/profile/pages/edit_information_page.dart';
import 'package:mycarehubpro/presentation/profile/widgets/edit_info_button_widget.dart';
import 'package:mycarehubpro/presentation/profile/widgets/edit_information_item.dart';

import '../../../mocks/mocks.dart';
import '../../../mocks/test_helpers.dart';

void main() {
  group('EditInfoButtonWidget', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets('renders EditInformation page when clicked',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: EditInformationButtonWidget(
          editInformationItem: careGiverEditInfo,
        ),
      );

      await tester.tap(find.byType(EditInformationButtonWidget));
      await tester.pumpAndSettle();

      expect(find.byType(EditInformationPage), findsOneWidget);
    });

    testWidgets('adds spacing to the last item if type is dropdown',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: EditInformationButtonWidget(
          editInformationItem: careGiverEditInfo,
        ),
      );

      await tester.tap(find.byType(EditInformationButtonWidget));
      await tester.pumpAndSettle();

      await tester.ensureVisible(find.byType(SizedBox).last);

      expect(
        (tester.firstWidget(find.byType(SizedBox).last) as SizedBox).height,
        20.0,
      );
    });

    testWidgets('dropdown button renders a list', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: EditInformationButtonWidget(
          editInformationItem: careGiverEditInfo,
        ),
      );

      await tester.tap(find.byType(EditInformationButtonWidget));
      await tester.pumpAndSettle();

      await tester.ensureVisible(find.byType(DropdownButtonHideUnderline));
      await tester.tap(find.byType(DropdownButtonHideUnderline));
      await tester.pumpAndSettle();

      await tester.tap(find.text(father).last);
      await tester.pumpAndSettle();

      expect(
        find.text(father),
        findsOneWidget,
      );
    });

    testWidgets('adds spacing to the last item if type is text',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: EditInformationButtonWidget(
          submitFunction: (EditInformationItem editInformationItem) {},
          editInformationItem: nickNameEditInfo('Test'),
        ),
      );

      await tester.tap(find.byType(EditInformationButtonWidget));
      await tester.pumpAndSettle();

      await tester.ensureVisible(find.byType(SizedBox).last);

      expect(
        (tester.firstWidget(find.byType(SizedBox).last) as SizedBox).height,
        20.0,
      );
    });
  });
}
