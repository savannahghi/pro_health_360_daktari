// Flutter imports:
// Package imports:
import 'package:bewell_pro_core/presentation/core/widgets/default_error_route.dart';
import 'package:bewell_pro_core/presentation/onboarding/common/landing_page.dart';
import 'package:bewell_pro_core/presentation/onboarding/login/pages/phone_login_page.dart'
    as bewell_pro_core;
import 'package:bewell_pro_core/presentation/onboarding/login/pages/set_pin_page.dart';
import 'package:bewell_pro_core/presentation/router/router_generator.dart';
import 'package:bewell_pro_core/presentation/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:healthcloud/presentation/client_details/pages/client_health_page.dart';
import 'package:healthcloud/presentation/community/chat_screen/pages/community_chat_page.dart';
import 'package:healthcloud/presentation/community/pages/add_new_group_page.dart';
import 'package:healthcloud/presentation/community/pages/community_list_page.dart';
import 'package:healthcloud/presentation/community/pages/new_broadcast_message_page.dart';
import 'package:healthcloud/presentation/engagement/home/pages/content_page.dart';
import 'package:healthcloud/presentation/engagement/home/pages/home_page.dart';
import 'package:healthcloud/presentation/engagement/home/pages/search_page.dart';
import 'package:healthcloud/presentation/onboarding/common/afyamoja_landing_page.dart';
import 'package:healthcloud/presentation/onboarding/create_pin/pages/create_new_pin_page.dart';
import 'package:healthcloud/presentation/onboarding/login/pages/forgot_pin_page.dart';
import 'package:healthcloud/presentation/onboarding/login/pages/phone_login_page.dart';
import 'package:healthcloud/presentation/onboarding/patient/add_new_patient_page.dart';
import 'package:healthcloud/presentation/onboarding/security_questions/security_questions_page.dart';
import 'package:healthcloud/presentation/onboarding/verify_otp/pages/verify_otp_page.dart';
import 'package:healthcloud/presentation/profile/pages/user_profile_page.dart';
import 'package:healthcloud/presentation/router/routes.dart';
import 'package:healthcloud/presentation/service_requests/pages/pin_reset_requests_page.dart';
import 'package:healthcloud/presentation/service_requests/pages/profile_update_requests_page.dart';
import 'package:healthcloud/presentation/service_requests/pages/red_flags_page.dart';
import 'package:healthcloud/presentation/service_requests/pages/service_requests_page.dart';
import 'package:healthcloud/presentation/surveys/pages/surveys_page.dart';

class AppRouterGenerator extends RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings? settings) {
    final Route<dynamic>? superRoute = RouteGenerator.generateRoute(settings);

    if (settings?.name == homePageRoute) {
      return MaterialPageRoute<HomePage>(
        builder: (BuildContext context) {
          return const HomePage();
        },
      );
    }

    if (superRoute is MaterialPageRoute<SetPinPage>) {
      return MaterialPageRoute<CreateNewPINPage>(
        builder: (_) => CreateNewPINPage(),
      );
    }

    if (superRoute is MaterialPageRoute<LandingPage>) {
      return MaterialPageRoute<AfyaMojaLandingPage>(
        builder: (_) => AfyaMojaLandingPage(),
      );
    }

    if (superRoute is MaterialPageRoute<bewell_pro_core.PhoneLoginPage>) {
      return MaterialPageRoute<PhoneLoginPage>(
        builder: (_) => PhoneLoginPage(),
      );
    }

    if (superRoute is MaterialPageRoute<DefaultErrorRoute>) {
      switch (settings?.name) {
        case communityPage:
          return MaterialPageRoute<CommunityListViewPage>(
            builder: (_) => const CommunityListViewPage(),
          );

        case contentPage:
          return MaterialPageRoute<ContentPage>(
            builder: (_) => ContentPage(),
          );

        case addNewGroupPage:
          return MaterialPageRoute<AddNewGroupPage>(
            builder: (_) => const AddNewGroupPage(),
          );

        case newBroadcastPage:
          return MaterialPageRoute<NewBroadcastMessagePage>(
            builder: (_) => const NewBroadcastMessagePage(),
          );

        case securityQuestionsPage:
          return MaterialPageRoute<SecurityQuestionsPage>(
            builder: (_) => const SecurityQuestionsPage(),
          );

        case forgotPinPage:
          return MaterialPageRoute<ForgotPinPage>(
            builder: (_) => ForgotPinPage(),
          );

        case addNewPatientPage:
          return MaterialPageRoute<AddNewPatientPage>(
            builder: (_) => const AddNewPatientPage(),
          );

        case serviceRequestsPage:
          return MaterialPageRoute<ServiceRequestsPage>(
            builder: (_) => ServiceRequestsPage(),
          );

        case surveysPage:
          return MaterialPageRoute<SurveysPage>(
            builder: (_) => const SurveysPage(),
          );

        case verifyOTPPage:
          final int args = settings!.arguments! as int;

          return MaterialPageRoute<VerifyOTPPage>(
            builder: (_) => VerifyOTPPage(
              otp: args,
            ),
          );

        case profilePage:
          return MaterialPageRoute<UserProfilePage>(
            builder: (_) => UserProfilePage(),
          );

        case pinResetRequestsPage:
          return MaterialPageRoute<PINResetRequestsPage>(
            builder: (_) => PINResetRequestsPage(),
          );

        case redFlagsPage:
          return MaterialPageRoute<RedFlagsPage>(
            builder: (_) => RedFlagsPage(),
          );

        case profileUpdateRequestsPage:
          return MaterialPageRoute<ProfileUpdateRequestsPage>(
            builder: (_) => ProfileUpdateRequestsPage(),
          );

        case communityChatScreen:
          return MaterialPageRoute<CommunityChatPage>(
            builder: (_) => const CommunityChatPage(),
          );

        case searchPage:
          return MaterialPageRoute<SearchPage>(
            builder: (_) => const SearchPage(),
          );

        case clientHealthPage:
          return MaterialPageRoute<ClientHealthPage>(
            builder: (_) => ClientHealthPage(),
          );
      }
    } else {
      return superRoute;
    }
  }
}
