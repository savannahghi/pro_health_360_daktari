// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:mycarehubpro/domain/core/entities/notification/notification_details.dart';
import 'package:mycarehubpro/domain/core/entities/search_user/search_user_response.dart';
import 'package:mycarehubpro/domain/core/entities/service_requests/service_request.dart';
// Project imports:
import 'package:mycarehubpro/presentation/client_details/pages/client_health_page.dart';
import 'package:mycarehubpro/presentation/client_details/pages/search_client_page.dart';
import 'package:mycarehubpro/presentation/client_details/pages/search_staff_member_page.dart';
import 'package:mycarehubpro/presentation/communities/invited_groups/pages/accept_group_invites_page.dart';
import 'package:mycarehubpro/presentation/communities/invited_groups/pages/invited_groups_page.dart';
import 'package:mycarehubpro/presentation/communities/pages/community_list_page.dart';
import 'package:mycarehubpro/presentation/community/group_info/pages/group_info_page.dart';
import 'package:mycarehubpro/presentation/contact_admin/pages/contact_admin_page.dart';
import 'package:mycarehubpro/presentation/core/widgets/handle_deep_link.dart';
import 'package:mycarehubpro/presentation/create_group/create_group.dart';
import 'package:mycarehubpro/presentation/create_group/invite_members/invite_members_page.dart';
import 'package:mycarehubpro/presentation/engagement/home/pages/content_page.dart';
import 'package:mycarehubpro/presentation/engagement/home/pages/home_page.dart';
import 'package:mycarehubpro/presentation/flagged_messages/pages/flagged_messages_page.dart';
import 'package:mycarehubpro/presentation/notifications/notifications_page.dart';
import 'package:mycarehubpro/presentation/onboarding/create_pin/pages/create_new_pin_page.dart';
import 'package:mycarehubpro/presentation/onboarding/login/pages/forgot_pin_page.dart';
import 'package:mycarehubpro/presentation/onboarding/login/pages/login_counter_page.dart';
import 'package:mycarehubpro/presentation/onboarding/login/pages/pending_pin_request_page.dart';
import 'package:mycarehubpro/presentation/onboarding/login/pages/phone_login_page.dart';
import 'package:mycarehubpro/presentation/onboarding/login/pages/pin_request_sent_page.dart';
import 'package:mycarehubpro/presentation/onboarding/patient/add_new_client_page.dart';
import 'package:mycarehubpro/presentation/onboarding/pin_expired/pages/pin_expired_page.dart';
import 'package:mycarehubpro/presentation/onboarding/security_questions/security_questions_page.dart';
import 'package:mycarehubpro/presentation/onboarding/set_nickname/set_nickname_page.dart';
import 'package:mycarehubpro/presentation/onboarding/staff/add_new_staff_page.dart';
import 'package:mycarehubpro/presentation/onboarding/terms/terms_and_conditions_page.dart';
import 'package:mycarehubpro/presentation/onboarding/verify_phone/pages/verify_phone_page.dart';
import 'package:mycarehubpro/presentation/profile/faqs/pages/faq_detail_view_page.dart';
import 'package:mycarehubpro/presentation/profile/faqs/pages/profile_faqs_page.dart';
import 'package:mycarehubpro/presentation/profile/pages/edit_information_page.dart';
import 'package:mycarehubpro/presentation/profile/pages/settings_page.dart';
import 'package:mycarehubpro/presentation/profile/pages/user_profile_page.dart';
import 'package:mycarehubpro/presentation/profile/widgets/edit_information_item.dart';
import 'package:mycarehubpro/presentation/router/routes.dart';
import 'package:mycarehubpro/presentation/search/pages/search_page.dart';
import 'package:mycarehubpro/presentation/search/pages/search_page_detail_view.dart';
import 'package:mycarehubpro/presentation/service_requests/pages/pin_reset_requests_page.dart';
import 'package:mycarehubpro/presentation/service_requests/pages/profile_update_requests_page.dart';
import 'package:mycarehubpro/presentation/service_requests/pages/red_flag_actions_page.dart';
import 'package:mycarehubpro/presentation/service_requests/pages/red_flags_page.dart';
import 'package:mycarehubpro/presentation/service_requests/pages/resolved_service_requests_page.dart';
import 'package:mycarehubpro/presentation/service_requests/pages/service_requests_page.dart';
import 'package:mycarehubpro/presentation/service_requests/pages/staff_pin_reset_requests_page.dart';
import 'package:mycarehubpro/presentation/service_requests/pages/verify_security_questions_help_page.dart';
import 'package:mycarehubpro/presentation/surveys/pages/surveys_page.dart';

class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    final dynamic args = settings.arguments;
    switch (settings.name) {
      case AppRoutes.deepLink:
        return MaterialPageRoute<HandleDeepLink>(
          builder: (BuildContext context) => const HandleDeepLink(),
        );

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
        return MaterialPageRoute<CommunityListPage>(
          builder: (_) => const CommunityListPage(),
        );

      case AppRoutes.notificationsPage:
        return MaterialPageRoute<NotificationsPage>(
          builder: (_) => const NotificationsPage(
            notifications: <NotificationDetails>[],
          ),
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
          builder: (_) => InviteMembersPage(channelId: args as String),
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
        return MaterialPageRoute<AddNewClientPage>(
          builder: (_) => const AddNewClientPage(),
        );

      case AppRoutes.addNewStaffPage:
        return MaterialPageRoute<AddNewStaffPage>(
          builder: (_) => const AddNewStaffPage(),
        );

      case AppRoutes.serviceRequestsPage:
        return MaterialPageRoute<ServiceRequestsPage>(
          builder: (_) => const ServiceRequestsPage(),
        );

      case AppRoutes.surveysPage:
        return MaterialPageRoute<SurveysPage>(
          builder: (_) => const SurveysPage(),
        );

      case AppRoutes.verifyPhonePage:
        return MaterialPageRoute<VerifyPhonePage>(
          builder: (_) => const VerifyPhonePage(),
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
        return MaterialPageRoute<PinResetRequestsPage>(
          builder: (_) => const PinResetRequestsPage(),
        );

      case AppRoutes.redFlagsPage:
        return MaterialPageRoute<RedFlagsPage>(
          builder: (_) => const RedFlagsPage(),
        );

      case AppRoutes.profileUpdateRequestsPage:
        return MaterialPageRoute<ProfileUpdateRequestsPage>(
          builder: (_) => ProfileUpdateRequestsPage(),
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
          builder: (_) => const ResolvedServiceRequestsPage(),
        );

      case AppRoutes.groupInfoPage:
        return MaterialPageRoute<GroupInfoPage>(
          builder: (_) => GroupInfoPage(payload: args as Map<String, dynamic>),
        );

      case AppRoutes.searchClientPage:
        return MaterialPageRoute<SearchClientPage>(
          builder: (_) => const SearchClientPage(),
        );

      case AppRoutes.searchDetailViewPage:
        return MaterialPageRoute<SearchPageDetailView>(
          builder: (_) => SearchPageDetailView(
            searchUserResponse:
                args['searchUserResponse'] as SearchUserResponse,
            isClient: args['isClient'] as bool,
          ),
        );

      case AppRoutes.pinRequestSentPage:
        return MaterialPageRoute<PinRequestSentPage>(
          builder: (_) => const PinRequestSentPage(),
        );

      case AppRoutes.pendingPINRequestPage:
        return MaterialPageRoute<PendingPINRequestPage>(
          builder: (_) => const PendingPINRequestPage(),
        );

      case AppRoutes.searchStaffMemberPage:
        return MaterialPageRoute<SearchStaffMemberPage>(
          builder: (_) => const SearchStaffMemberPage(),
        );

      case AppRoutes.loginCounterPage:
        return MaterialPageRoute<LoginCounterPage>(
          builder: (_) => LoginCounterPage(
            retryTime: args as int?,
          ),
        );

      case AppRoutes.verifySecurityQuestionsHelpPage:
        return MaterialPageRoute<VerifySecurityQuestionsHelpPage>(
          builder: (_) => VerifySecurityQuestionsHelpPage(),
        );

      case AppRoutes.pinExpiredPage:
        return MaterialPageRoute<PinExpiredPage>(
          builder: (_) => const PinExpiredPage(),
        );

      case AppRoutes.groupInvitesPage:
        return MaterialPageRoute<InvitedGroupsPage>(
          builder: (_) => const InvitedGroupsPage(),
        );

      case AppRoutes.flaggedMessagesPage:
        return MaterialPageRoute<FlaggedMessagesPage>(
          builder: (_) => FlaggedMessagesPage(
            communityName: args['communityName'] as String,
            communityId: args['communityId'] as String,
          ),
        );
      case AppRoutes.staffPinResetRequestsPage:
        return MaterialPageRoute<StaffPinResetRequestsPage>(
          builder: (_) => const StaffPinResetRequestsPage(),
        );
      case AppRoutes.redFlagActionsPage:
        return MaterialPageRoute<RedFlagActionsPage>(
          builder: (_) => RedFlagActionsPage(
            serviceRequest: args as ServiceRequest?,
          ),
        );

      case AppRoutes.acceptGroupInvitesPage:
        final String groupId = args['groupId'] as String;
        final String groupName = args['groupName'] as String;
        final int numberOfMembers = args['numberOfMembers'] as int;

        return MaterialPageRoute<AcceptGroupInvitesPage>(
          builder: (_) => AcceptGroupInvitesPage(
            groupId: groupId,
            groupName: groupName,
            numberOfMembers: numberOfMembers,
          ),
        );
    }
  }
}
