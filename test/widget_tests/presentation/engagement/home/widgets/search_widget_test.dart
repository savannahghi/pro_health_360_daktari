// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myharehubpro/application/redux/states/app_state.dart';
import 'package:myharehubpro/domain/core/value_objects/app_strings.dart';
import 'package:myharehubpro/presentation/engagement/home/widgets/search_widget.dart';
import '../../../../../mocks/test_helpers.dart';

void main() {
  group('SearchWidget', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        widget: Builder(
          builder: (BuildContext context) {
            return const SearchWidget();
          },
        ),
      );

      expect(find.text(searchUser), findsOneWidget);
      expect(find.byType(SvgPicture), findsOneWidget);
    });
  });
}
