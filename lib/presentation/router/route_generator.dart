// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:mycarehubpro/application/core/services/analytics_service.dart';
import 'package:mycarehubpro/domain/core/entities/search_user/search_user_response.dart';
import 'package:mycarehubpro/domain/core/entities/service_requests/service_request.dart';
import 'package:mycarehubpro/domain/core/entities/surveys/survey.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_enums.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_events.dart';
// Project imports:
import 'package:mycarehubpro/presentation/client_details/pages/search_client_page.dart';
import 'package:mycarehubpro/presentation/client_details/pages/search_staff_member_page.dart';
import 'package:mycarehubpro/presentation/communities/group_info/pages/edit_group_info_page.dart';
import 'package:mycarehubpro/presentation/communities/invited_groups/pages/accept_group_invites_page.dart';
import 'package:mycarehubpro/presentation/communities/invited_groups/pages/invited_groups_page.dart';
import 'package:mycarehubpro/presentation/communities/pages/community_list_page.dart';
import 'package:mycarehubpro/presentation/contact_admin/pages/contact_admin_page.dart';
import 'package:mycarehubpro/presentation/core/widgets/handle_deep_link.dart';
import 'package:mycarehubpro/presentation/create_group/create_group.dart';
import 'package:mycarehubpro/presentation/create_group/invite_members/invite_members_page.dart';
import 'package:mycarehubpro/presentation/engagement/home/pages/content_page.dart';
import 'package:mycarehubpro/presentation/engagement/home/pages/home_page.dart';
import 'package:mycarehubpro/presentation/notifications/notifications_page.dart';
import 'package:mycarehubpro/presentation/onboarding/create_pin/pages/create_new_pin_page.dart';
import 'package:mycarehubpro/presentation/onboarding/login/pages/forgot_pin_page.dart';
import 'package:mycarehubpro/presentation/onboarding/login/pages/login_counter_page.dart';
import 'package:mycarehubpro/presentation/onboarding/login/pages/pending_pin_request_page.dart';
import 'package:mycarehubpro/presentation/onboarding/login/pages/phone_login_page.dart';
import 'package:mycarehubpro/presentation/onboarding/login/pages/pin_request_sent_page.dart';
import 'package:mycarehubpro/presentation/onboarding/patient/register_client_page.dart';
import 'package:mycarehubpro/presentation/onboarding/pin_expired/pages/pin_expired_page.dart';
import 'package:mycarehubpro/presentation/onboarding/security_questions/security_questions_page.dart';
import 'package:mycarehubpro/presentation/onboarding/set_nickname/set_nickname_page.dart';
import 'package:mycarehubpro/presentation/onboarding/staff/add_new_staff_page.dart';
import 'package:mycarehubpro/presentation/onboarding/terms/terms_and_conditions_page.dart';
import 'package:mycarehubpro/presentation/onboarding/verify_phone/pages/verify_phone_page.dart';
import 'package:mycarehubpro/presentation/profile/faqs/pages/content_details_page.dart';
import 'package:mycarehubpro/presentation/profile/faqs/pages/document_content_widget.dart';
import 'package:mycarehubpro/presentation/profile/faqs/pages/gallery_images_page.dart';
import 'package:mycarehubpro/presentation/profile/faqs/pages/profile_faqs_page.dart';
import 'package:mycarehubpro/presentation/profile/pages/edit_information_page.dart';
import 'package:mycarehubpro/presentation/profile/pages/settings_page.dart';
import 'package:mycarehubpro/presentation/profile/pages/user_profile_page.dart';
import 'package:mycarehubpro/presentation/profile/widgets/edit_information_item.dart';
import 'package:mycarehubpro/presentation/resume_with_pin/resume_pin_connector.dart';
import 'package:mycarehubpro/presentation/router/routes.dart';
import 'package:mycarehubpro/presentation/search/pages/search_page.dart';
import 'package:mycarehubpro/presentation/search/pages/search_page_detail_view.dart';
import 'package:mycarehubpro/presentation/service_requests/pages/assessment_card_answers_page.dart';
import 'package:mycarehubpro/presentation/service_requests/pages/assessment_tools_responses_page.dart';
import 'package:mycarehubpro/presentation/service_requests/pages/pin_reset_requests_page.dart';
import 'package:mycarehubpro/presentation/service_requests/pages/red_flag_actions_page.dart';
import 'package:mycarehubpro/presentation/service_requests/pages/red_flags_page.dart';
import 'package:mycarehubpro/presentation/service_requests/pages/resolved_service_requests_list_page.dart';
import 'package:mycarehubpro/presentation/service_requests/pages/resolved_service_requests_page.dart';
import 'package:mycarehubpro/presentation/service_requests/pages/screening_tools_list_page.dart';
import 'package:mycarehubpro/presentation/service_requests/pages/service_requests_page.dart';
import 'package:mycarehubpro/presentation/service_requests/pages/staff_pin_reset_requests_page.dart';
import 'package:mycarehubpro/presentation/service_requests/pages/verify_security_questions_help_page.dart';
import 'package:mycarehubpro/presentation/surveys/pages/successful_survey_submission.dart';
import 'package:mycarehubpro/presentation/surveys/pages/surveys_page.dart';
import 'package:mycarehubpro/presentation/surveys/pages/surveys_send_configuration_page.dart';
import 'package:mycarehubpro/presentation/surveys/pages/surveys_sender_list_page.dart';

class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    final dynamic args = settings.arguments;
    switch (settings.name) {
      case AppRoutes.deepLink:
        return MaterialPageRoute<HandleDeepLink>(
          builder: (BuildContext context) => const HandleDeepLink(),
          settings: const RouteSettings(name: 'Handle deep link page'),
        );

      case AppRoutes.homePage:
        return MaterialPageRoute<HomePage>(
          builder: (BuildContext context) {
            return const HomePage();
          },
          settings: const RouteSettings(name: 'Home page'),
        );

      case AppRoutes.termsAndConditions:
        return MaterialPageRoute<TermsAndConditionsPage>(
          builder: (_) => const TermsAndConditionsPage(),
          settings: const RouteSettings(name: 'Terms and conditions page'),
        );

      case AppRoutes.setPinPage:
        return MaterialPageRoute<CreateNewPINPage>(
          builder: (_) => const CreateNewPINPage(),
          settings: const RouteSettings(name: 'Create new pin page'),
        );

      case AppRoutes.setNicknamePage:
        return MaterialPageRoute<SetNickNamePage>(
          builder: (_) => const SetNickNamePage(),
          settings: const RouteSettings(name: 'Set nickname page'),
        );

      case AppRoutes.loginPage:
        return MaterialPageRoute<PhoneLoginPage>(
          builder: (_) => PhoneLoginPage(),
          settings: const RouteSettings(name: 'Login page'),
        );

      case AppRoutes.communityPage:
        return MaterialPageRoute<CommunityListPage>(
          builder: (_) => const CommunityListPage(),
          settings: const RouteSettings(name: 'Communities list page'),
        );

      case AppRoutes.notificationsPage:
        return MaterialPageRoute<NotificationsPage>(
          builder: (_) {
            /// Log as a navigation event
            AnalyticsService()
                .logEvent(
                  name: viewNotificationsEvent,
                  eventType: AnalyticsEventType.NAVIGATION,
                )
                .then((_) => null);
            return NotificationsPage();
          },
          settings: const RouteSettings(name: 'Notifications page'),
        );

      case AppRoutes.contentPage:
        return MaterialPageRoute<ContentPage>(
          builder: (_) => ContentPage(),
        );
        
      case AppRoutes.addNewGroupPage:
        return MaterialPageRoute<CreateGroupPage>(
          builder: (_) => const CreateGroupPage(),
          settings: const RouteSettings(name: 'Create group page'),
        );

      case AppRoutes.inviteMembersPage:
        return MaterialPageRoute<InviteMembersPage>(
          builder: (_) => InviteMembersPage(channelId: args as String),
          settings: const RouteSettings(name: 'Invite members page'),
        );

      case AppRoutes.securityQuestionsPage:
        return MaterialPageRoute<SecurityQuestionsPage>(
          builder: (_) => const SecurityQuestionsPage(),
          settings: const RouteSettings(name: 'Security questions page'),
        );

      case AppRoutes.forgotPinPage:
        return MaterialPageRoute<ForgotPinPage>(
          builder: (_) => ForgotPinPage(),
          settings: const RouteSettings(name: 'Forgot pin page'),
        );

      case AppRoutes.registerClientPage:
        return MaterialPageRoute<RegisterClientPage>(
          builder: (_) => const RegisterClientPage(),
          settings: const RouteSettings(name: 'Register client page'),
        );

      case AppRoutes.addNewStaffPage:
        return MaterialPageRoute<AddNewStaffPage>(
          builder: (_) => const AddNewStaffPage(),
          settings: const RouteSettings(name: 'Add new staff page'),
        );

      case AppRoutes.serviceRequestsPage:
        return MaterialPageRoute<ServiceRequestsPage>(
          builder: (_) => const ServiceRequestsPage(),
          settings: const RouteSettings(name: 'Service requests page'),
        );

      case AppRoutes.surveysPage:
        return MaterialPageRoute<SurveysPage>(
          builder: (_) => const SurveysPage(),
          settings: const RouteSettings(name: 'Surveys page'),
        );

      case AppRoutes.surveysSenderListPage:
        return MaterialPageRoute<SurveysSenderListPage>(
          builder: (_) => SurveysSenderListPage(
            survey: args as Survey,
          ),
          settings: const RouteSettings(name: 'Surveys sender list page'),
        );

      case AppRoutes.surveysSendConfigurationsPage:
        return MaterialPageRoute<SurveysSendConfigurationsPage>(
          builder: (_) => SurveysSendConfigurationsPage(survey: args as Survey),
          settings:
              const RouteSettings(name: 'Surveys send configurations page'),
        );

      case AppRoutes.successfulSurveySubmission:
        return MaterialPageRoute<SuccessfulSurveySubmission>(
          builder: (_) => const SuccessfulSurveySubmission(),
          settings: const RouteSettings(name: 'Successful survey submission'),
        );

      case AppRoutes.verifyPhonePage:
        return MaterialPageRoute<VerifyPhonePage>(
          builder: (_) => const VerifyPhonePage(),
          settings: const RouteSettings(name: 'Verify phone page'),
        );

      case AppRoutes.profilePage:
        return MaterialPageRoute<UserProfilePage>(
          builder: (_) {
            /// Log as a navigation event
            AnalyticsService()
                .logEvent(
                  name: viewProfile,
                  eventType: AnalyticsEventType.NAVIGATION,
                )
                .then((_) => null);
            return UserProfilePage();
          },
          settings: const RouteSettings(name: 'User profile page'),
        );

      case AppRoutes.settingsPage:
        return MaterialPageRoute<SettingsPage>(
          builder: (_) => SettingsPage(),
          settings: const RouteSettings(name: 'Settings page'),
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
          settings: const RouteSettings(name: 'Edit information page'),
        );

      case AppRoutes.pinResetRequestsPage:
        return MaterialPageRoute<PinResetRequestsPage>(
          builder: (_) => const PinResetRequestsPage(),
          settings: const RouteSettings(name: 'Pin reset requests page'),
        );

      case AppRoutes.redFlagsPage:
        return MaterialPageRoute<RedFlagsPage>(
          builder: (_) => const RedFlagsPage(),
          settings: const RouteSettings(name: 'Red flags page'),
        );

      case AppRoutes.searchPage:
        return MaterialPageRoute<SearchPage>(
          builder: (_) => const SearchPage(),
          settings: const RouteSettings(name: 'Search page'),
        );

      case AppRoutes.contactAdminPage:
        return MaterialPageRoute<ContactAdminPage>(
          builder: (_) => const ContactAdminPage(),
          settings: const RouteSettings(name: 'Contact admin page'),
        );

      case AppRoutes.contentDetailsPage:
        return MaterialPageRoute<ContentDetailPage>(
          builder: (_) => ContentDetailPage(payload: args as ContentDetails),
          settings: const RouteSettings(name: 'Content details page'),
        );

      case AppRoutes.profileFaqsPage:
        return MaterialPageRoute<ProfileFaqsPage>(
          builder: (_) => const ProfileFaqsPage(),
          settings: const RouteSettings(name: 'Profile faqs page'),
        );

      case AppRoutes.resolvedServiceRequestsPage:
        return MaterialPageRoute<ResolvedServiceRequestsPage>(
          builder: (_) => const ResolvedServiceRequestsPage(),
          settings: const RouteSettings(name: 'Resolved service requests page'),
        );

      case AppRoutes.searchClientPage:
        return MaterialPageRoute<SearchClientPage>(
          builder: (_) => const SearchClientPage(),
          settings: const RouteSettings(name: 'Search client page'),
        );

      case AppRoutes.searchDetailViewPage:
        return MaterialPageRoute<SearchPageDetailView>(
          builder: (_) => SearchPageDetailView(
            searchUserResponse:
                args['searchUserResponse'] as SearchUserResponse,
            isClient: args['isClient'] as bool,
          ),
          settings: const RouteSettings(name: 'Search page detail view'),
        );

      case AppRoutes.pinRequestSentPage:
        return MaterialPageRoute<PinRequestSentPage>(
          builder: (_) => const PinRequestSentPage(),
          settings: const RouteSettings(name: 'Pin request sent page'),
        );

      case AppRoutes.pendingPINRequestPage:
        return MaterialPageRoute<PendingPINRequestPage>(
          builder: (_) => const PendingPINRequestPage(),
          settings: const RouteSettings(name: 'Pending PIN request page'),
        );

      case AppRoutes.searchStaffMemberPage:
        return MaterialPageRoute<SearchStaffMemberPage>(
          builder: (_) => const SearchStaffMemberPage(),
          settings: const RouteSettings(name: 'Search staff member page'),
        );

      case AppRoutes.loginCounterPage:
        return MaterialPageRoute<LoginCounterPage>(
          builder: (_) => LoginCounterPage(
            retryTime: args as int?,
          ),
          settings: const RouteSettings(name: 'login counter page'),
        );

      case AppRoutes.verifySecurityQuestionsHelpPage:
        return MaterialPageRoute<VerifySecurityQuestionsHelpPage>(
          builder: (_) => VerifySecurityQuestionsHelpPage(),
          settings: const RouteSettings(name: 'Verify security questions page'),
        );

      case AppRoutes.pinExpiredPage:
        return MaterialPageRoute<PinExpiredPage>(
          builder: (_) => const PinExpiredPage(),
          settings: const RouteSettings(name: 'Pin expired page'),
        );

      case AppRoutes.groupInvitesPage:
        return MaterialPageRoute<InvitedGroupsPage>(
          builder: (_) => const InvitedGroupsPage(),
          settings: const RouteSettings(name: 'Invited groups page'),
        );

      case AppRoutes.staffPinResetRequestsPage:
        return MaterialPageRoute<StaffPinResetRequestsPage>(
          builder: (_) => const StaffPinResetRequestsPage(),
          settings: const RouteSettings(name: 'Staff pin reset requests page'),
        );
      case AppRoutes.redFlagActionsPage:
        return MaterialPageRoute<RedFlagActionsPage>(
          builder: (_) => RedFlagActionsPage(
            serviceRequest: args as ServiceRequest?,
          ),
          settings: const RouteSettings(name: 'Red flag actions page'),
        );

      case AppRoutes.screeningToolsListPage:
        return MaterialPageRoute<ScreeningToolsListPage>(
          builder: (_) => const ScreeningToolsListPage(),
          settings: const RouteSettings(name: 'Screening tools list page'),
        );
      case AppRoutes.assessmentToolResponsesPage:
        return MaterialPageRoute<AssessmentToolResponsesPage>(
          builder: (_) => AssessmentToolResponsesPage(
            screeningToolsType: args as ScreeningToolsType,
          ),
          settings: const RouteSettings(name: 'AssessmentTool responses page'),
        );

      case AppRoutes.assessmentCardAnswersPage:
        return MaterialPageRoute<AssessmentCardAnswersPage>(
          builder: (_) => AssessmentCardAnswersPage(
            payload: args as Map<String, dynamic>,
          ),
          settings: const RouteSettings(name: 'Assessment card answers page'),
        );

      case AppRoutes.resolvedServiceRequestsListPage:
        return MaterialPageRoute<ResolvedServiceRequestsListPage>(
          builder: (_) => ResolvedServiceRequestsListPage(
            flavour: args as Flavour,
          ),
          settings:
              const RouteSettings(name: 'Resolved service requests list page'),
        );

      case AppRoutes.viewDocumentPage:
        final String pdfTitle = args['pdfTitle'] as String;
        final String pdfUrl = args['pdfUrl'] as String;

        return MaterialPageRoute<DocumentContentPage>(
          builder: (_) => DocumentContentPage(
            pdfTitle: pdfTitle,
            pdfUrl: pdfUrl,
          ),
          settings: const RouteSettings(name: 'Document content page'),
        );
      case AppRoutes.galleryImagesPage:
        return MaterialPageRoute<ContentDetailPage>(
          builder: (_) => GalleryImagesPage(
            images: args as List<GalleryImage>,
          ),
          settings: const RouteSettings(name: 'Gallery images page'),
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
          settings: const RouteSettings(name: 'Accepted group invites page'),
        );

      case AppRoutes.resumeWithPin:
        return MaterialPageRoute<ResumePinConnector>(
          builder: (_) => const ResumePinConnector(),
          settings: const RouteSettings(name: 'Resume with pin page'),
        );

      case AppRoutes.editGroupInfoPage:
        return MaterialPageRoute<EditGroupInfoPage>(
          builder: (_) => const EditGroupInfoPage(),
          settings: const RouteSettings(name: 'Edit group info page'),
        );
    }
  }
}
