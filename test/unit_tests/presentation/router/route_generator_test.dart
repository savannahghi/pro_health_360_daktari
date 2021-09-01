import 'package:bewell_pro_core/presentation/core/help_center/pages/help_center_page.dart';
import 'package:bewell_pro_core/presentation/router/routes.dart';
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/individual/individual_practitioner_step_one.dart';
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/individual/individual_practitioner_step_three.dart';
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/individual/individual_practitioner_step_two.dart';
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/organization/organization_practitioner_step_four.dart';
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/organization/organization_practitioner_step_one.dart';
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/organization/organization_practitioner_step_three.dart';
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/organization/organization_practitioner_step_two.dart';
import 'package:healthcloud/presentation/router/route_generator.dart';
import 'package:healthcloud/presentation/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
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

  test('Test router returns OrganizationPractitionerKYCStepOne', () {
    const RouteSettings settings =
        RouteSettings(name: organizationPractitionerKYCStepOneRoute);

    final MaterialPageRoute<OrganizationPractitionerKYCStepOne> route =
        routeGenerator(settings)!
            as MaterialPageRoute<OrganizationPractitionerKYCStepOne>;

    expect(route, isA<MaterialPageRoute<OrganizationPractitionerKYCStepOne>>());
    expect(route.builder(context), isA<OrganizationPractitionerKYCStepOne>());
  });

  test('Test router returns organizationPractitionerKYCStepTwoRoute', () {
    const RouteSettings settings =
        RouteSettings(name: organizationPractitionerKYCStepTwoRoute);

    final MaterialPageRoute<OrganizationPractitionerKYCStepTwo> route =
        routeGenerator(settings)!
            as MaterialPageRoute<OrganizationPractitionerKYCStepTwo>;

    expect(route, isA<MaterialPageRoute<OrganizationPractitionerKYCStepTwo>>());
    expect(route.builder(context), isA<OrganizationPractitionerKYCStepTwo>());
  });

  test('Test router returns organizationPractitionerKYCStepThreeRoute', () {
    const RouteSettings settings =
        RouteSettings(name: organizationPractitionerKYCStepThreeRoute);

    final MaterialPageRoute<OrganizationPractitionerKYCStepThree> route =
        routeGenerator(settings)!
            as MaterialPageRoute<OrganizationPractitionerKYCStepThree>;

    expect(
        route, isA<MaterialPageRoute<OrganizationPractitionerKYCStepThree>>());
    expect(route.builder(context), isA<OrganizationPractitionerKYCStepThree>());
  });

  test('Test router returns organizationPractitionerKYCStepFourRoute', () {
    const RouteSettings settings =
        RouteSettings(name: organizationPractitionerKYCStepFourRoute);

    final MaterialPageRoute<OrganizationPractitionerKYCStepFour> route =
        routeGenerator(settings)!
            as MaterialPageRoute<OrganizationPractitionerKYCStepFour>;

    expect(
        route, isA<MaterialPageRoute<OrganizationPractitionerKYCStepFour>>());
    expect(route.builder(context), isA<OrganizationPractitionerKYCStepFour>());
  });
}
