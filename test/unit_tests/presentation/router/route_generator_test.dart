// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:bewell_pro_core/presentation/core/help_center/pages/help_center_page.dart';
import 'package:bewell_pro_core/presentation/router/routes.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:healthcloud/presentation/community/community_list_page.dart';
import 'package:healthcloud/presentation/engagement/home/pages/content_page.dart';
import 'package:healthcloud/presentation/onboarding/login/pages/forgot_pin_page.dart';
import 'package:healthcloud/presentation/onboarding/patient/add_new_patient_page.dart';

// Project imports:
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/individual/individual_practitioner_step_one.dart';
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/individual/individual_practitioner_step_three.dart';
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/individual/individual_practitioner_step_two.dart';
import 'package:healthcloud/presentation/onboarding/create_pin/pages/create_new_pin_page.dart';
import 'package:healthcloud/presentation/onboarding/security_questions/security_questions_page.dart';
import 'package:healthcloud/presentation/onboarding/verify_otp/pages/verify_otp_page.dart';
import 'package:healthcloud/presentation/profile/pages/user_profile_page.dart';
import 'package:healthcloud/presentation/router/route_generator.dart';
import 'package:healthcloud/presentation/router/routes.dart';
import 'package:healthcloud/presentation/service_requests/pages/pin_reset_requests_page.dart';
import 'package:healthcloud/presentation/service_requests/pages/profile_update_requests_page.dart';
import 'package:healthcloud/presentation/service_requests/pages/red_flags_page.dart';
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

  test('Test router returns ContentPage', () {
    const RouteSettings settings = RouteSettings(name: contentPage);

    final MaterialPageRoute<ContentPage> route =
        routeGenerator(settings)! as MaterialPageRoute<ContentPage>;

    expect(route, isA<MaterialPageRoute<ContentPage>>());
    expect(route.builder(context), isA<ContentPage>());
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

  test('Test router returns SecurityQuestionsPage', () {
    const RouteSettings settings = RouteSettings(name: securityQuestionsPage);

    final MaterialPageRoute<SecurityQuestionsPage>? route =
        routeGenerator(settings) as MaterialPageRoute<SecurityQuestionsPage>?;
    expect(route, isA<MaterialPageRoute<SecurityQuestionsPage>>());
    expect(route?.builder(context), isA<SecurityQuestionsPage>());
  });

  test('Test router returns UserProfilePage', () {
    const RouteSettings settings = RouteSettings(name: profilePage);

    final MaterialPageRoute<UserProfilePage>? route =
        routeGenerator(settings) as MaterialPageRoute<UserProfilePage>?;
    expect(route, isA<MaterialPageRoute<UserProfilePage>>());
    expect(route?.builder(context), isA<UserProfilePage>());
  });

  test('Test router returns PINResetRequestsPage', () {
    const RouteSettings settings = RouteSettings(name: pinResetRequestsPage);

    final MaterialPageRoute<PINResetRequestsPage>? route =
        routeGenerator(settings) as MaterialPageRoute<PINResetRequestsPage>?;
    expect(route, isA<MaterialPageRoute<PINResetRequestsPage>>());
    expect(route?.builder(context), isA<PINResetRequestsPage>());
  });

  test('Test router returns ForgotPinPage', () {
    const RouteSettings settings = RouteSettings(name: forgotPinPage);

    final MaterialPageRoute<ForgotPinPage>? route =
        routeGenerator(settings) as MaterialPageRoute<ForgotPinPage>?;
    expect(route, isA<MaterialPageRoute<ForgotPinPage>>());
    expect(route?.builder(context), isA<ForgotPinPage>());
  });

  test('Test router returns AddNewPatientPage', () {
    const RouteSettings settings = RouteSettings(name: addNewPatientPage);

    final MaterialPageRoute<AddNewPatientPage>? route =
        routeGenerator(settings) as MaterialPageRoute<AddNewPatientPage>?;
    expect(route, isA<MaterialPageRoute<AddNewPatientPage>>());
    expect(route?.builder(context), isA<AddNewPatientPage>());
  });
  test('Test router returns RedFlagsPage', () {
    const RouteSettings settings = RouteSettings(name: redFlagsPage);

    final MaterialPageRoute<RedFlagsPage>? route =
        routeGenerator(settings) as MaterialPageRoute<RedFlagsPage>?;
    expect(route, isA<MaterialPageRoute<RedFlagsPage>>());
    expect(route?.builder(context), isA<RedFlagsPage>());
  });

  test('Test router returns  verify otp page', () {
    const RouteSettings settings = RouteSettings(
      name: verifyOTPPage,
      arguments: 1234,
    );

    final MaterialPageRoute<VerifyOTPPage>? route =
        routeGenerator(settings) as MaterialPageRoute<VerifyOTPPage>?;

    expect(route, isA<MaterialPageRoute<VerifyOTPPage>>());
    expect(route?.builder(context), isA<VerifyOTPPage>());
  });

  test('Test router returns ProfileUpdateRequestsPage', () {
    const RouteSettings settings =
        RouteSettings(name: profileUpdateRequestsPage);

    final MaterialPageRoute<ProfileUpdateRequestsPage>? route =
        routeGenerator(settings)
            as MaterialPageRoute<ProfileUpdateRequestsPage>?;
    expect(route, isA<MaterialPageRoute<ProfileUpdateRequestsPage>>());
    expect(route?.builder(context), isA<ProfileUpdateRequestsPage>());
  });
}
