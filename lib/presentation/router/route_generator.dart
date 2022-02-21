// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:healthcloud/domain/core/entities/service_requests/pending_service_requests.dart';
// Project imports:
import 'package:healthcloud/presentation/client_details/pages/client_health_page.dart';
import 'package:healthcloud/presentation/community/chat_screen/pages/community_chat_page.dart';
import 'package:healthcloud/presentation/community/group_info/pages/group_info_page.dart';
import 'package:healthcloud/presentation/community/pages/community_list_page.dart';
import 'package:healthcloud/presentation/contact_admin/pages/contact_admin_page.dart';
import 'package:healthcloud/presentation/create_group/create_group.dart';
import 'package:healthcloud/presentation/create_group/invite_members/invite_members_page.dart';
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
import 'package:healthcloud/presentation/profile/faqs/pages/faq_detail_view_page.dart';
import 'package:healthcloud/presentation/profile/faqs/pages/profile_faqs_page.dart';
import 'package:healthcloud/presentation/profile/pages/edit_information_page.dart';
import 'package:healthcloud/presentation/profile/pages/settings_page.dart';
import 'package:healthcloud/presentation/profile/pages/user_profile_page.dart';
import 'package:healthcloud/presentation/profile/widgets/edit_information_item.dart';
import 'package:healthcloud/presentation/router/routes.dart';
import 'package:healthcloud/presentation/service_requests/pages/pin_reset_requests_page.dart';
import 'package:healthcloud/presentation/service_requests/pages/profile_update_requests_page.dart';
import 'package:healthcloud/presentation/service_requests/pages/red_flags_page.dart';
import 'package:healthcloud/presentation/service_requests/pages/resolved_service_requests_page.dart';
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
        return MaterialPageRoute<CreateGroupPage>(
          builder: (_) => const CreateGroupPage(),
        );

      case AppRoutes.inviteMembersPage:
        return MaterialPageRoute<InviteMembersPage>(
          builder: (_) => const InviteMembersPage(),
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

      case AppRoutes.settingsPage:
        return MaterialPageRoute<SettingsPage>(
          builder: (_) => SettingsPage(),
        );

      case AppRoutes.editInformationPage:
        final EditInformationItem editInformationItem =
            args['editInformationItem'] as EditInformationItem;

        void Function(EditInformationItem editInformationItem) submitFunction;

        ///Sanity checks
        if (args['onSubmit'] != null) {
          submitFunction = args['onSubmit'] as void Function(
            EditInformationItem editInformationItem,
          );
        } else {
          submitFunction = (EditInformationItem editInformationItem) {};
        }

        return MaterialPageRoute<EditInformationPage>(
          builder: (_) => EditInformationPage(
            editInformationItem: editInformationItem,
            onSubmit: submitFunction,
          ),
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

      case AppRoutes.faqDetailViewPage:
        return MaterialPageRoute<FAQDetailViewPage>(
          builder: (_) => FAQDetailViewPage(payload: args as FAQContent),
        );

      case AppRoutes.profileFaqsPage:
        return MaterialPageRoute<ProfileFaqsPage>(
          builder: (_) => const ProfileFaqsPage(),
        );

      case AppRoutes.resolvedServiceRequestsPage:
        return MaterialPageRoute<ResolvedServiceRequestsPage>(
          builder: (_) => ResolvedServiceRequestsPage(),
        );

      case AppRoutes.groupInfoPage:
        return MaterialPageRoute<GroupInfoPage>(
          builder: (_) => const GroupInfoPage(),
        );
    }
  }
}
