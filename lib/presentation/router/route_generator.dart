import 'package:healthcloud/application/redux/actions/core/afyamoja_logout_action.dart';
import 'package:bewell_pro_core/presentation/core/help_center/pages/help_center_page.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/individual/individual_practitioner_step_one.dart';
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/individual/individual_practitioner_step_three.dart';
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/individual/individual_practitioner_step_two.dart';
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/organization/organization_practitioner_step_four.dart';
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/organization/organization_practitioner_step_one.dart';
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/organization/organization_practitioner_step_three.dart';
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/organization/organization_practitioner_step_two.dart';
import 'package:healthcloud/presentation/router/routes.dart';
import 'package:bewell_pro_core/application/core/services/feed_content_callbacks.dart';
import 'package:bewell_pro_core/presentation/core/home/pages/home_page.dart';
import 'package:bewell_pro_core/presentation/core/widgets/default_error_route.dart';
import 'package:bewell_pro_core/presentation/router/router_generator.dart';
import 'package:flutter/material.dart';

class AppRouterGenerator extends RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings? settings) {
    final Route<dynamic>? superRoute = RouteGenerator.generateRoute(settings);

    if (superRoute is MaterialPageRoute<HomePage>) {
      return MaterialPageRoute<HomePage>(
        builder: (BuildContext context) {
          return HomePage(
            feedContentCallbacks: getFeedActionCallbacks(context: context),
            logoutAction: AfyaMojaLogoutAction(),
          );
        },
      );
    }

    if (superRoute is MaterialPageRoute<HelpCenterPage>) {
      return MaterialPageRoute<HelpCenterPage>(
        builder: (_) => HelpCenterPage(
          title: helpCenterTitle,
          logoutAction: AfyaMojaLogoutAction(),
        ),
      );
    }

    if (superRoute is MaterialPageRoute<DefaultErrorRoute>) {
      switch (settings?.name) {
        case individualPractitionerKYCStepOneRoute:
          return MaterialPageRoute<IndividualPractitionerKYCStepOne>(
            builder: (_) => IndividualPractitionerKYCStepOne(),
          );

        case individualPractitionerKYCStepTwoRoute:
          return MaterialPageRoute<IndividualPractitionerKYCStepTwo>(
            builder: (_) => IndividualPractitionerKYCStepTwo(),
          );

        case individualPractitionerKYCStepThreeRoute:
          return MaterialPageRoute<IndividualPractitionerKYCStepThree>(
            builder: (_) => const IndividualPractitionerKYCStepThree(),
          );

        case organizationPractitionerKYCStepOneRoute:
          return MaterialPageRoute<OrganizationPractitionerKYCStepOne>(
              builder: (_) => const OrganizationPractitionerKYCStepOne());

        case organizationPractitionerKYCStepTwoRoute:
          return MaterialPageRoute<OrganizationPractitionerKYCStepTwo>(
              builder: (_) => OrganizationPractitionerKYCStepTwo());

        case organizationPractitionerKYCStepThreeRoute:
          return MaterialPageRoute<OrganizationPractitionerKYCStepThree>(
              builder: (_) => const OrganizationPractitionerKYCStepThree());

        case organizationPractitionerKYCStepFourRoute:
          return MaterialPageRoute<OrganizationPractitionerKYCStepFour>(
              builder: (_) => const OrganizationPractitionerKYCStepFour());
      }
    }
  }
}
