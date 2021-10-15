// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:bewell_pro_core/presentation/core/help_center/pages/help_center_page.dart';
import 'package:bewell_pro_core/presentation/router/routes.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:healthcloud/presentation/community/community_list_page.dart';

// Project imports:
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/individual/individual_practitioner_step_one.dart';
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/individual/individual_practitioner_step_three.dart';
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/individual/individual_practitioner_step_two.dart';
import 'package:healthcloud/presentation/onboarding/create_pin/pages/create_new_pin_page.dart';
import 'package:healthcloud/presentation/router/route_generator.dart';
import 'package:healthcloud/presentation/router/routes.dart';
import '../../../mocks/mocks.dart';

void main() {
  const Route<dynamic>? Function(RouteSettings settings) routeGenerator =
      AppRouterGenerator.generateRoute;

  final BuildContext context = MockBuildContext();

  test('Test router returns HelpCenterPage', () {
    const RouteSettings settings = RouteSettings(name: helpCenterPageRoute);

    final MaterialPageRoute<HelpCenterPage> route =
        routeGenerator(settings)! as MaterialPageRoute<HelpCenterPage>;

    expect(route, isA<MaterialPageRoute<HelpCenterPage>>());
    expect(route.builder(context), isA<HelpCenterPage>());
  });

  test('Test router returns CreateNewPinPage', () {
    const RouteSettings settings = RouteSettings(name: setPinRoute);

    final MaterialPageRoute<CreateNewPINPage> route =
        routeGenerator(settings)! as MaterialPageRoute<CreateNewPINPage>;

    expect(route, isA<MaterialPageRoute<CreateNewPINPage>>());
    expect(route.builder(context), isA<CreateNewPINPage>());
  });

  test('Test router returns IndividualPractitionerKYCStepOne', () {
    const RouteSettings settings =
        RouteSettings(name: individualPractitionerKYCStepOneRoute);

    final MaterialPageRoute<IndividualPractitionerKYCStepOne> route =
        routeGenerator(settings)!
            as MaterialPageRoute<IndividualPractitionerKYCStepOne>;

    expect(route, isA<MaterialPageRoute<IndividualPractitionerKYCStepOne>>());
    expect(route.builder(context), isA<IndividualPractitionerKYCStepOne>());
  });

  test('Test router returns individualPractitionerKYCStepTwoRoute', () {
    const RouteSettings settings =
        RouteSettings(name: individualPractitionerKYCStepTwoRoute);

    final MaterialPageRoute<IndividualPractitionerKYCStepTwo> route =
        routeGenerator(settings)!
            as MaterialPageRoute<IndividualPractitionerKYCStepTwo>;

    expect(route, isA<MaterialPageRoute<IndividualPractitionerKYCStepTwo>>());
    expect(route.builder(context), isA<IndividualPractitionerKYCStepTwo>());
  });

  test('Test router returns individualPractitionerKYCStepThreeRoute', () {
    const RouteSettings settings =
        RouteSettings(name: individualPractitionerKYCStepThreeRoute);

    final MaterialPageRoute<IndividualPractitionerKYCStepThree> route =
        routeGenerator(settings)!
            as MaterialPageRoute<IndividualPractitionerKYCStepThree>;

    expect(route, isA<MaterialPageRoute<IndividualPractitionerKYCStepThree>>());
    expect(route.builder(context), isA<IndividualPractitionerKYCStepThree>());
  });

  test('Test router returns CommunityListView', () {
    const RouteSettings settings = RouteSettings(name: communityPage);

    final MaterialPageRoute<CommunityListViewPage>? route =
        routeGenerator(settings) as MaterialPageRoute<CommunityListViewPage>?;
    expect(route, isA<MaterialPageRoute<CommunityListViewPage>>());
    expect(route?.builder(context), isA<CommunityListViewPage>());
  });
}
