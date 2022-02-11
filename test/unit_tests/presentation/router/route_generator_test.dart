// Flutter imports:
import 'package:connectivity_plus_platform_interface/connectivity_plus_platform_interface.dart';
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_test/flutter_test.dart';
// Project imports:
import 'package:healthcloud/presentation/client_details/pages/client_health_page.dart';
import 'package:healthcloud/presentation/community/chat_screen/pages/community_chat_page.dart';
import 'package:healthcloud/presentation/community/pages/add_new_group_page.dart';
import 'package:healthcloud/presentation/community/pages/community_list_page.dart';
import 'package:healthcloud/presentation/community/pages/new_broadcast_message_page.dart';
import 'package:healthcloud/presentation/engagement/home/pages/content_page.dart';
import 'package:healthcloud/presentation/engagement/home/pages/home_page.dart';
import 'package:healthcloud/presentation/engagement/home/pages/search_page.dart';
import 'package:healthcloud/presentation/onboarding/create_pin/pages/create_new_pin_page.dart';
import 'package:healthcloud/presentation/onboarding/login/pages/forgot_pin_page.dart';
import 'package:healthcloud/presentation/onboarding/patient/add_new_patient_page.dart';
import 'package:healthcloud/presentation/onboarding/security_questions/security_questions_page.dart';
import 'package:healthcloud/presentation/onboarding/set_nickname/set_nickname_page.dart';
import 'package:healthcloud/presentation/onboarding/terms/terms_and_conditions_page.dart';
import 'package:healthcloud/presentation/onboarding/verify_phone/pages/verify_phone_page.dart';
import 'package:healthcloud/presentation/profile/pages/user_profile_page.dart';
import 'package:healthcloud/presentation/router/route_generator.dart';
import 'package:healthcloud/presentation/router/routes.dart';
import 'package:healthcloud/presentation/service_requests/pages/pin_reset_requests_page.dart';
import 'package:healthcloud/presentation/service_requests/pages/profile_update_requests_page.dart';
import 'package:healthcloud/presentation/service_requests/pages/red_flags_page.dart';
import 'package:healthcloud/presentation/surveys/pages/surveys_page.dart';

import '../../../mocks/mocks.dart';

void main() {
  const Route<dynamic>? Function(RouteSettings settings) routeGenerator =
      RouteGenerator.generateRoute;

  final BuildContext context = MockBuildContext();

  test('Test router returns HomePage', () {
    const RouteSettings settings = RouteSettings(name: AppRoutes.homePage);

    final MaterialPageRoute<HomePage> route =
        routeGenerator(settings)! as MaterialPageRoute<HomePage>;

    expect(route, isA<MaterialPageRoute<HomePage>>());
    expect(route.builder(context), isA<HomePage>());
  });

  test('Test router returns CreateNewPinPage', () {
    final MockConnectivityPlatform fakePlatform = MockConnectivityPlatform();
    ConnectivityPlatform.instance = fakePlatform;

    const RouteSettings settings = RouteSettings(name: AppRoutes.setPinPage);

    final MaterialPageRoute<CreateNewPINPage> route =
        routeGenerator(settings)! as MaterialPageRoute<CreateNewPINPage>;

    expect(route, isA<MaterialPageRoute<CreateNewPINPage>>());
    expect(route.builder(context), isA<CreateNewPINPage>());
  });

  test('Test router returns set nickname page', () {
    const RouteSettings settings =
        RouteSettings(name: AppRoutes.setNicknamePage);

    final MaterialPageRoute<SetNickNamePage> route =
        routeGenerator(settings)! as MaterialPageRoute<SetNickNamePage>;

    expect(route, isA<MaterialPageRoute<SetNickNamePage>>());
    expect(route.builder(context), isA<SetNickNamePage>());
  });

  test('Test router returns ContentPage', () {
    const RouteSettings settings = RouteSettings(name: AppRoutes.contentPage);

    final MaterialPageRoute<ContentPage> route =
        routeGenerator(settings)! as MaterialPageRoute<ContentPage>;

    expect(route, isA<MaterialPageRoute<ContentPage>>());
    expect(route.builder(context), isA<ContentPage>());
  });

  test('Test router returns CommunityListView', () {
    const RouteSettings settings = RouteSettings(name: AppRoutes.communityPage);

    final MaterialPageRoute<CommunityListViewPage>? route =
        routeGenerator(settings) as MaterialPageRoute<CommunityListViewPage>?;
    expect(route, isA<MaterialPageRoute<CommunityListViewPage>>());
    expect(route?.builder(context), isA<CommunityListViewPage>());
  });

  test('Test router returns SecurityQuestionsPage', () {
    const RouteSettings settings =
        RouteSettings(name: AppRoutes.securityQuestionsPage);

    final MaterialPageRoute<SecurityQuestionsPage>? route =
        routeGenerator(settings) as MaterialPageRoute<SecurityQuestionsPage>?;
    expect(route, isA<MaterialPageRoute<SecurityQuestionsPage>>());
    expect(route?.builder(context), isA<SecurityQuestionsPage>());
  });

  test('Test router returns UserProfilePage', () {
    const RouteSettings settings = RouteSettings(name: AppRoutes.profilePage);

    final MaterialPageRoute<UserProfilePage>? route =
        routeGenerator(settings) as MaterialPageRoute<UserProfilePage>?;
    expect(route, isA<MaterialPageRoute<UserProfilePage>>());
    expect(route?.builder(context), isA<UserProfilePage>());
  });

  test('Test router returns PINResetRequestsPage', () {
    const RouteSettings settings =
        RouteSettings(name: AppRoutes.pinResetRequestsPage);

    final MaterialPageRoute<PINResetRequestsPage>? route =
        routeGenerator(settings) as MaterialPageRoute<PINResetRequestsPage>?;
    expect(route, isA<MaterialPageRoute<PINResetRequestsPage>>());
    expect(route?.builder(context), isA<PINResetRequestsPage>());
  });

  test('Test router returns ForgotPinPage', () {
    const RouteSettings settings = RouteSettings(name: AppRoutes.forgotPinPage);

    final MaterialPageRoute<ForgotPinPage>? route =
        routeGenerator(settings) as MaterialPageRoute<ForgotPinPage>?;
    expect(route, isA<MaterialPageRoute<ForgotPinPage>>());
    expect(route?.builder(context), isA<ForgotPinPage>());
  });

  test('Test router returns AddNewPatientPage', () {
    const RouteSettings settings =
        RouteSettings(name: AppRoutes.addNewPatientPage);

    final MaterialPageRoute<AddNewPatientPage>? route =
        routeGenerator(settings) as MaterialPageRoute<AddNewPatientPage>?;
    expect(route, isA<MaterialPageRoute<AddNewPatientPage>>());
    expect(route?.builder(context), isA<AddNewPatientPage>());
  });

  test('Test router returns AddNewGroupPage', () {
    const RouteSettings settings =
        RouteSettings(name: AppRoutes.addNewGroupPage);

    final MaterialPageRoute<AddNewGroupPage>? route =
        routeGenerator(settings) as MaterialPageRoute<AddNewGroupPage>?;
    expect(route, isA<MaterialPageRoute<AddNewGroupPage>>());
    expect(route?.builder(context), isA<AddNewGroupPage>());
  });

  test('Test router returns NewBroadcastMessagePage', () {
    const RouteSettings settings =
        RouteSettings(name: AppRoutes.newBroadcastPage);

    final MaterialPageRoute<NewBroadcastMessagePage>? route =
        routeGenerator(settings) as MaterialPageRoute<NewBroadcastMessagePage>?;
    expect(route, isA<MaterialPageRoute<NewBroadcastMessagePage>>());
    expect(route?.builder(context), isA<NewBroadcastMessagePage>());
  });

  test('Test router returns RedFlagsPage', () {
    const RouteSettings settings = RouteSettings(name: AppRoutes.redFlagsPage);

    final MaterialPageRoute<RedFlagsPage>? route =
        routeGenerator(settings) as MaterialPageRoute<RedFlagsPage>?;
    expect(route, isA<MaterialPageRoute<RedFlagsPage>>());
    expect(route?.builder(context), isA<RedFlagsPage>());
  });

  test('Test router returns  verify Phone page', () {
    const RouteSettings settings = RouteSettings(
      name: AppRoutes.verifyPhonePage,
      arguments: '0700111222',
    );

    final MaterialPageRoute<VerifyPhonePage>? route =
        routeGenerator(settings) as MaterialPageRoute<VerifyPhonePage>?;

    expect(route, isA<MaterialPageRoute<VerifyPhonePage>>());
    expect(route?.builder(context), isA<VerifyPhonePage>());
  });

  test('Test router returns ProfileUpdateRequestsPage', () {
    const RouteSettings settings =
        RouteSettings(name: AppRoutes.profileUpdateRequestsPage);

    final MaterialPageRoute<ProfileUpdateRequestsPage>? route =
        routeGenerator(settings)
            as MaterialPageRoute<ProfileUpdateRequestsPage>?;
    expect(route, isA<MaterialPageRoute<ProfileUpdateRequestsPage>>());
    expect(route?.builder(context), isA<ProfileUpdateRequestsPage>());
  });

  test('Test router returns CommunityChatScreen', () {
    const RouteSettings settings =
        RouteSettings(name: AppRoutes.communityChatScreen);

    final MaterialPageRoute<CommunityChatPage>? route =
        routeGenerator(settings) as MaterialPageRoute<CommunityChatPage>?;
    expect(route, isA<MaterialPageRoute<CommunityChatPage>>());
    expect(route?.builder(context), isA<CommunityChatPage>());
  });

  test('Test router returns SearchPage', () {
    const RouteSettings settings = RouteSettings(name: AppRoutes.searchPage);

    final MaterialPageRoute<SearchPage>? route =
        routeGenerator(settings) as MaterialPageRoute<SearchPage>?;
    expect(route, isA<MaterialPageRoute<SearchPage>>());
    expect(route?.builder(context), isA<SearchPage>());
  });

  test('Test router returns ClientHealthPage', () {
    const RouteSettings settings =
        RouteSettings(name: AppRoutes.clientHealthPage);

    final MaterialPageRoute<ClientHealthPage>? route =
        routeGenerator(settings) as MaterialPageRoute<ClientHealthPage>?;
    expect(route, isA<MaterialPageRoute<ClientHealthPage>>());
    expect(route?.builder(context), isA<ClientHealthPage>());
  });

  test('Test router returns TermsAndConditionsPage', () {
    const RouteSettings settings =
        RouteSettings(name: AppRoutes.termsAndConditions);

    final MaterialPageRoute<TermsAndConditionsPage>? route =
        routeGenerator(settings) as MaterialPageRoute<TermsAndConditionsPage>?;

    expect(route, isA<MaterialPageRoute<TermsAndConditionsPage>>());
    expect(route?.builder(context), isA<TermsAndConditionsPage>());
  });

  test('Test router returns SetNickNamePage', () {
    const RouteSettings settings =
        RouteSettings(name: AppRoutes.setNicknamePage);

    final MaterialPageRoute<SetNickNamePage>? route =
        routeGenerator(settings) as MaterialPageRoute<SetNickNamePage>?;

    expect(route, isA<MaterialPageRoute<SetNickNamePage>>());
    expect(route?.builder(context), isA<SetNickNamePage>());
  });
  test('Test router returns SurveysPage', () {
    const RouteSettings settings = RouteSettings(name: AppRoutes.surveysPage);

    final MaterialPageRoute<SurveysPage>? route =
        routeGenerator(settings) as MaterialPageRoute<SurveysPage>?;

    expect(route, isA<MaterialPageRoute<SurveysPage>>());
    expect(route?.builder(context), isA<SurveysPage>());
  });
}
