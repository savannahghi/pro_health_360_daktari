// Flutter imports:
import 'package:flutter/material.dart';
import 'package:healthcloud/domain/core/entities/service_requests/pending_service_requests.dart';
// Project imports:
import 'package:healthcloud/presentation/client_details/pages/client_health_page.dart';
import 'package:healthcloud/presentation/community/chat_screen/pages/community_chat_page.dart';
import 'package:healthcloud/presentation/community/pages/add_new_group_page.dart';
import 'package:healthcloud/presentation/community/pages/community_list_page.dart';
import 'package:healthcloud/presentation/community/pages/new_broadcast_message_page.dart';
import 'package:healthcloud/presentation/contact_admin/pages/contact_admin_page.dart';
import 'package:healthcloud/presentation/engagement/home/pages/content_page.dart';
import 'package:healthcloud/presentation/engagement/home/pages/home_page.dart';
import 'package:healthcloud/presentation/engagement/home/pages/search_page.dart';
import 'package:healthcloud/presentation/onboarding/create_pin/pages/create_new_pin_page.dart';
import 'package:healthcloud/presentation/onboarding/login/pages/forgot_pin_page.dart';
import 'package:healthcloud/presentation/onboarding/login/pages/phone_login_page.dart';
import 'package:healthcloud/presentation/onboarding/patient/add_new_patient_page.dart';
import 'package:healthcloud/presentation/onboarding/security_questions/security_questions_page.dart';
import 'package:healthcloud/presentation/onboarding/set_nickname/set_nickname_page.dart';
import 'package:healthcloud/presentation/onboarding/terms/terms_and_conditions_page.dart';
import 'package:healthcloud/presentation/onboarding/verify_phone/pages/verify_phone_page.dart';
import 'package:healthcloud/presentation/profile/pages/user_profile_page.dart';
import 'package:healthcloud/presentation/router/routes.dart';
import 'package:healthcloud/presentation/service_requests/pages/pin_reset_requests_page.dart';
import 'package:healthcloud/presentation/service_requests/pages/profile_update_requests_page.dart';
import 'package:healthcloud/presentation/service_requests/pages/red_flags_page.dart';
import 'package:healthcloud/presentation/service_requests/pages/service_requests_page.dart';
import 'package:healthcloud/presentation/surveys/pages/surveys_page.dart';

class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    final dynamic args = settings.arguments;
    switch (settings.name) {
      case AppRoutes.homePage:
        return MaterialPageRoute<HomePage>(
          builder: (BuildContext context) {
            return const HomePage();
          },
        );

      case AppRoutes.termsAndConditions:
        return MaterialPageRoute<TermsAndConditionsPage>(
          builder: (_) => const TermsAndConditionsPage(),
        );

      case AppRoutes.setPinPage:
        return MaterialPageRoute<CreateNewPINPage>(
          builder: (_) => const CreateNewPINPage(),
        );

      case AppRoutes.setNicknamePage:
        return MaterialPageRoute<SetNickNamePage>(
          builder: (_) => const SetNickNamePage(),
        );

      case AppRoutes.loginPage:
        return MaterialPageRoute<PhoneLoginPage>(
          builder: (_) => PhoneLoginPage(),
        );

      case AppRoutes.communityPage:
        return MaterialPageRoute<CommunityListViewPage>(
          builder: (_) => const CommunityListViewPage(),
        );

      case AppRoutes.contentPage:
        return MaterialPageRoute<ContentPage>(
          builder: (_) => ContentPage(),
        );

      case AppRoutes.addNewGroupPage:
        return MaterialPageRoute<AddNewGroupPage>(
          builder: (_) => const AddNewGroupPage(),
        );

      case AppRoutes.newBroadcastPage:
        return MaterialPageRoute<NewBroadcastMessagePage>(
          builder: (_) => const NewBroadcastMessagePage(),
        );

      case AppRoutes.securityQuestionsPage:
        return MaterialPageRoute<SecurityQuestionsPage>(
          builder: (_) => const SecurityQuestionsPage(),
        );

      case AppRoutes.forgotPinPage:
        return MaterialPageRoute<ForgotPinPage>(
          builder: (_) => ForgotPinPage(),
        );

      case AppRoutes.addNewPatientPage:
        return MaterialPageRoute<AddNewPatientPage>(
          builder: (_) => const AddNewPatientPage(),
        );

      case AppRoutes.serviceRequestsPage:
        return MaterialPageRoute<ServiceRequestsPage>(
          builder: (_) => ServiceRequestsPage(
            pendingServiceRequest: args as PendingServiceRequest,
          ),
        );

      case AppRoutes.surveysPage:
        return MaterialPageRoute<SurveysPage>(
          builder: (_) => const SurveysPage(),
        );

      case AppRoutes.verifyPhonePage:
        return MaterialPageRoute<VerifyPhonePage>(
          builder: (_) => VerifyPhonePage(phoneNumber: args as String),
        );

      case AppRoutes.profilePage:
        return MaterialPageRoute<UserProfilePage>(
          builder: (_) => UserProfilePage(),
        );

      case AppRoutes.pinResetRequestsPage:
        return MaterialPageRoute<PINResetRequestsPage>(
          builder: (_) => PINResetRequestsPage(),
        );

      case AppRoutes.redFlagsPage:
        return MaterialPageRoute<RedFlagsPage>(
          builder: (_) => RedFlagsPage(),
        );

      case AppRoutes.profileUpdateRequestsPage:
        return MaterialPageRoute<ProfileUpdateRequestsPage>(
          builder: (_) => ProfileUpdateRequestsPage(),
        );

      case AppRoutes.communityChatScreen:
        return MaterialPageRoute<CommunityChatPage>(
          builder: (_) => const CommunityChatPage(),
        );

      case AppRoutes.searchPage:
        return MaterialPageRoute<SearchPage>(
          builder: (_) => const SearchPage(),
        );

      case AppRoutes.clientHealthPage:
        return MaterialPageRoute<ClientHealthPage>(
          builder: (_) => ClientHealthPage(),
        );

      case AppRoutes.contactAdminPage:
        return MaterialPageRoute<ContactAdminPage>(
          builder: (_) => const ContactAdminPage(),
        );
    }
  }
}
