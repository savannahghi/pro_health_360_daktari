import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/common/widgets/kyc_intro_page.dart';
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/common/widgets/kyc_pre_check.dart';
import 'package:healthcloud/presentation/router/routes.dart';

import '../../../../../../mocks/test_helpers.dart';

void main() {
  testWidgets('KYCIntroPage renders correctly', (WidgetTester tester) async {
    await buildTestWidget(
      tester: tester,
      widget: Builder(
        builder: (BuildContext context) {
          return KYCIntroPage(
            title: individualTitle('riding business'),
            description: individualDescription('riding business'),
            continueFunc: () {
              Navigator.of(context, rootNavigator: true)
                  .pushNamed(individualPractitionerKYCStepOneRoute);
            },
          );
        },
      ),
    );

    expect(find.byType(KYCPreCheck), findsOneWidget);
    expect(find.text(addEmail), findsOneWidget);
    expect(find.text(doItLater), findsOneWidget);
  });
}
