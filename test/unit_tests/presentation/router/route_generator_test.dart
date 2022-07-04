// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:connectivity_plus_platform_interface/connectivity_plus_platform_interface.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:prohealth360_daktari/application/core/services/utils.dart';
import 'package:prohealth360_daktari/domain/core/entities/search_user/search_user_response.dart';
import 'package:prohealth360_daktari/domain/core/entities/service_requests/service_request.dart';
import 'package:prohealth360_daktari/domain/core/entities/surveys/survey.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_enums.dart';
// Project imports:
import 'package:prohealth360_daktari/presentation/client_details/pages/search_client_page.dart';
import 'package:prohealth360_daktari/presentation/communities/group_info/pages/edit_group_info_page.dart';
import 'package:prohealth360_daktari/presentation/communities/invited_groups/pages/accept_group_invites_page.dart';
import 'package:prohealth360_daktari/presentation/communities/pages/community_list_page.dart';
import 'package:prohealth360_daktari/presentation/contact_admin/pages/contact_admin_page.dart';
import 'package:prohealth360_daktari/presentation/core/widgets/handle_deep_link.dart';
import 'package:prohealth360_daktari/presentation/create_group/create_group.dart';
import 'package:prohealth360_daktari/presentation/create_group/invite_members/invite_members_page.dart';
import 'package:prohealth360_daktari/presentation/engagement/home/pages/content_page.dart';
import 'package:prohealth360_daktari/presentation/engagement/home/pages/home_page.dart';
import 'package:prohealth360_daktari/presentation/notifications/notifications_page.dart';
import 'package:prohealth360_daktari/presentation/onboarding/create_pin/pages/create_new_pin_page.dart';
import 'package:prohealth360_daktari/presentation/onboarding/login/pages/forgot_pin_page.dart';
import 'package:prohealth360_daktari/presentation/onboarding/login/pages/login_counter_page.dart';
import 'package:prohealth360_daktari/presentation/onboarding/login/pages/pending_pin_request_page.dart';
import 'package:prohealth360_daktari/presentation/onboarding/login/pages/pin_request_sent_page.dart';
import 'package:prohealth360_daktari/presentation/onboarding/patient/register_client_page.dart';
import 'package:prohealth360_daktari/presentation/onboarding/pin_expired/pages/pin_expired_page.dart';
import 'package:prohealth360_daktari/presentation/onboarding/security_questions/security_questions_page.dart';
import 'package:prohealth360_daktari/presentation/onboarding/set_nickname/set_nickname_page.dart';
import 'package:prohealth360_daktari/presentation/onboarding/staff/add_new_staff_page.dart';
import 'package:prohealth360_daktari/presentation/onboarding/terms/terms_and_conditions_page.dart';
import 'package:prohealth360_daktari/presentation/onboarding/verify_phone/pages/verify_phone_page.dart';
import 'package:prohealth360_daktari/presentation/profile/faqs/pages/document_content_widget.dart';
import 'package:prohealth360_daktari/presentation/profile/pages/edit_information_page.dart';
import 'package:prohealth360_daktari/presentation/profile/pages/facility_contacts_page.dart';
import 'package:prohealth360_daktari/presentation/profile/pages/settings_page.dart';
import 'package:prohealth360_daktari/presentation/profile/pages/user_profile_page.dart';
import 'package:prohealth360_daktari/presentation/resume_with_pin/resume_pin_connector.dart';
import 'package:prohealth360_daktari/presentation/router/route_generator.dart';
import 'package:prohealth360_daktari/presentation/router/routes.dart';
import 'package:prohealth360_daktari/presentation/search/pages/search_page.dart';
import 'package:prohealth360_daktari/presentation/search/pages/search_page_detail_view.dart';
import 'package:prohealth360_daktari/presentation/service_requests/pages/assessment_card_answers_page.dart';
import 'package:prohealth360_daktari/presentation/service_requests/pages/assessment_tools_responses_page.dart';
import 'package:prohealth360_daktari/presentation/service_requests/pages/pin_reset_requests_page.dart';
import 'package:prohealth360_daktari/presentation/service_requests/pages/red_flag_actions_page.dart';
import 'package:prohealth360_daktari/presentation/service_requests/pages/red_flags_page.dart';
import 'package:prohealth360_daktari/presentation/service_requests/pages/resolved_service_requests_list_page.dart';
import 'package:prohealth360_daktari/presentation/service_requests/pages/resolved_service_requests_page.dart';
import 'package:prohealth360_daktari/presentation/service_requests/pages/screening_tools_list_page.dart';
import 'package:prohealth360_daktari/presentation/service_requests/pages/staff_pin_reset_requests_page.dart';
import 'package:prohealth360_daktari/presentation/service_requests/pages/verify_security_questions_help_page.dart';
import 'package:prohealth360_daktari/presentation/surveys/pages/successful_survey_submission.dart';
import 'package:prohealth360_daktari/presentation/surveys/pages/surveys_page.dart';
import 'package:prohealth360_daktari/presentation/surveys/pages/surveys_send_configuration_page.dart';
import 'package:prohealth360_daktari/presentation/surveys/pages/surveys_sender_list_page.dart';

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

  test('Test router returns deep link page', () {
    const RouteSettings settings = RouteSettings(name: AppRoutes.deepLink);

    final MaterialPageRoute<HandleDeepLink> route =
        routeGenerator(settings)! as MaterialPageRoute<HandleDeepLink>;

    expect(route, isA<MaterialPageRoute<HandleDeepLink>>());
    expect(route.builder(context), isA<HandleDeepLink>());
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

    final MaterialPageRoute<CommunityListPage>? route =
        routeGenerator(settings) as MaterialPageRoute<CommunityListPage>?;
    expect(route, isA<MaterialPageRoute<CommunityListPage>>());
    expect(route?.builder(context), isA<CommunityListPage>());
  });

  test('Test router returns NotificationsPage', () async {
    setupFirebaseAnalyticsMocks();
    await Firebase.initializeApp();

    const RouteSettings settings = RouteSettings(
      name: AppRoutes.notificationsPage,
    );

    final MaterialPageRoute<NotificationsPage>? route =
        routeGenerator(settings) as MaterialPageRoute<NotificationsPage>?;
    expect(route, isA<MaterialPageRoute<NotificationsPage>>());
    expect(route?.builder(context), isA<NotificationsPage>());
  });

  test('Test router returns SecurityQuestionsPage', () {
    const RouteSettings settings =
        RouteSettings(name: AppRoutes.securityQuestionsPage);

    final MaterialPageRoute<SecurityQuestionsPage>? route =
        routeGenerator(settings) as MaterialPageRoute<SecurityQuestionsPage>?;
    expect(route, isA<MaterialPageRoute<SecurityQuestionsPage>>());
    expect(route?.builder(context), isA<SecurityQuestionsPage>());
  });

  test('Test router returns UserProfilePage', () async {
    setupFirebaseAnalyticsMocks();
    await Firebase.initializeApp();

    const RouteSettings settings = RouteSettings(name: AppRoutes.profilePage);

    final MaterialPageRoute<UserProfilePage>? route =
        routeGenerator(settings) as MaterialPageRoute<UserProfilePage>?;
    expect(route, isA<MaterialPageRoute<UserProfilePage>>());
    expect(route?.builder(context), isA<UserProfilePage>());
  });

  test('Test router returns PINResetRequestsPage', () {
    const RouteSettings settings =
        RouteSettings(name: AppRoutes.pinResetRequestsPage);

    final MaterialPageRoute<PinResetRequestsPage>? route =
        routeGenerator(settings) as MaterialPageRoute<PinResetRequestsPage>?;
    expect(route, isA<MaterialPageRoute<PinResetRequestsPage>>());
    expect(route?.builder(context), isA<PinResetRequestsPage>());
  });

  test('Test router returns AddNewStaffPage', () {
    const RouteSettings settings =
        RouteSettings(name: AppRoutes.addNewStaffPage);

    final MaterialPageRoute<AddNewStaffPage>? route =
        routeGenerator(settings) as MaterialPageRoute<AddNewStaffPage>?;
    expect(route, isA<MaterialPageRoute<AddNewStaffPage>>());
    expect(route?.builder(context), isA<AddNewStaffPage>());
  });

  test('Test router returns ForgotPinPage', () {
    const RouteSettings settings = RouteSettings(name: AppRoutes.forgotPinPage);

    final MaterialPageRoute<ForgotPinPage>? route =
        routeGenerator(settings) as MaterialPageRoute<ForgotPinPage>?;
    expect(route, isA<MaterialPageRoute<ForgotPinPage>>());
    expect(route?.builder(context), isA<ForgotPinPage>());
  });

  test('Test router returns RegisterClientPage', () {
    const RouteSettings settings =
        RouteSettings(name: AppRoutes.registerClientPage);

    final MaterialPageRoute<RegisterClientPage>? route =
        routeGenerator(settings) as MaterialPageRoute<RegisterClientPage>?;
    expect(route, isA<MaterialPageRoute<RegisterClientPage>>());
    expect(route?.builder(context), isA<RegisterClientPage>());
  });

  test('Test router returns InviteMembersPage', () {
    const RouteSettings settings = RouteSettings(
      name: AppRoutes.inviteMembersPage,
      arguments: 'some-channel-id',
    );

    final MaterialPageRoute<InviteMembersPage>? route =
        routeGenerator(settings) as MaterialPageRoute<InviteMembersPage>?;
    expect(route, isA<MaterialPageRoute<InviteMembersPage>>());
    expect(route?.builder(context), isA<InviteMembersPage>());
  });

  test('Test router returns CreateGroupPage', () {
    const RouteSettings settings =
        RouteSettings(name: AppRoutes.addNewGroupPage);

    final MaterialPageRoute<CreateGroupPage>? route =
        routeGenerator(settings) as MaterialPageRoute<CreateGroupPage>?;
    expect(route, isA<MaterialPageRoute<CreateGroupPage>>());
    expect(route?.builder(context), isA<CreateGroupPage>());
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

  test('Test router returns SearchPage', () {
    const RouteSettings settings = RouteSettings(name: AppRoutes.searchPage);

    final MaterialPageRoute<SearchPage>? route =
        routeGenerator(settings) as MaterialPageRoute<SearchPage>?;
    expect(route, isA<MaterialPageRoute<SearchPage>>());
    expect(route?.builder(context), isA<SearchPage>());
  });

  test('Test router returns SurveysSenderListPage', () {
    final RouteSettings settings = RouteSettings(
      name: AppRoutes.surveysSenderListPage,
      arguments: Survey.initial(),
    );

    final MaterialPageRoute<SurveysSenderListPage>? route =
        routeGenerator(settings) as MaterialPageRoute<SurveysSenderListPage>?;
    expect(route, isA<MaterialPageRoute<SurveysSenderListPage>>());
    expect(route?.builder(context), isA<SurveysSenderListPage>());
  });

  test('Test router returns SurveysSendConfigurationsPage', () {
    final RouteSettings settings = RouteSettings(
      name: AppRoutes.surveysSendConfigurationsPage,
      arguments: Survey.initial(),
    );

    final MaterialPageRoute<SurveysSendConfigurationsPage>? route =
        routeGenerator(settings)
            as MaterialPageRoute<SurveysSendConfigurationsPage>?;
    expect(route, isA<MaterialPageRoute<SurveysSendConfigurationsPage>>());
    expect(route?.builder(context), isA<SurveysSendConfigurationsPage>());
  });

  test('Test router returns SuccessfulSurveySubmission', () {
    const RouteSettings settings =
        RouteSettings(name: AppRoutes.successfulSurveySubmission);

    final MaterialPageRoute<SuccessfulSurveySubmission>? route =
        routeGenerator(settings)
            as MaterialPageRoute<SuccessfulSurveySubmission>?;
    expect(route, isA<MaterialPageRoute<SuccessfulSurveySubmission>>());
    expect(route?.builder(context), isA<SuccessfulSurveySubmission>());
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

  test('Test router returns ContactAdminPage', () {
    const RouteSettings settings =
        RouteSettings(name: AppRoutes.contactAdminPage);

    final MaterialPageRoute<ContactAdminPage>? route =
        routeGenerator(settings) as MaterialPageRoute<ContactAdminPage>?;

    expect(route, isA<MaterialPageRoute<ContactAdminPage>>());
    expect(route?.builder(context), isA<ContactAdminPage>());
  });

  test('Test router returns SettingsPage', () {
    const RouteSettings settings = RouteSettings(name: AppRoutes.settingsPage);
    final MaterialPageRoute<SettingsPage> route =
        routeGenerator(settings)! as MaterialPageRoute<SettingsPage>;
    expect(route, isA<MaterialPageRoute<SettingsPage>>());
    expect(route.builder(context), isA<SettingsPage>());
  });

  test('Test router returns EditInformationPage', () {
    final RouteSettings settings = RouteSettings(
      name: AppRoutes.editInformationPage,
      arguments: <String, dynamic>{
        'editInformationItem': nickNameEditInfo('Test')
      },
    );
    final MaterialPageRoute<EditInformationPage> route =
        routeGenerator(settings)! as MaterialPageRoute<EditInformationPage>;
    expect(route, isA<MaterialPageRoute<EditInformationPage>>());
    expect(route.builder(context), isA<EditInformationPage>());
  });
  test('Test router returns ResolvedServiceRequestsPage', () {
    const RouteSettings settings =
        RouteSettings(name: AppRoutes.resolvedServiceRequestsPage);

    final MaterialPageRoute<ResolvedServiceRequestsPage>? route =
        routeGenerator(settings)
            as MaterialPageRoute<ResolvedServiceRequestsPage>?;

    expect(route, isA<MaterialPageRoute<ResolvedServiceRequestsPage>>());
    expect(route?.builder(context), isA<ResolvedServiceRequestsPage>());
  });

  test('Test router returns ResolvedServiceRequestsListPage', () {
    const RouteSettings settings = RouteSettings(
      name: AppRoutes.resolvedServiceRequestsListPage,
      arguments: Flavour.consumer,
    );

    final MaterialPageRoute<ResolvedServiceRequestsListPage>? route =
        routeGenerator(settings)
            as MaterialPageRoute<ResolvedServiceRequestsListPage>?;

    expect(route, isA<MaterialPageRoute<ResolvedServiceRequestsListPage>>());
    expect(route?.builder(context), isA<ResolvedServiceRequestsListPage>());
  });

  test('Test router returns SearchClientPage', () {
    const RouteSettings settings =
        RouteSettings(name: AppRoutes.searchClientPage);

    final MaterialPageRoute<SearchClientPage>? route =
        routeGenerator(settings) as MaterialPageRoute<SearchClientPage>?;

    expect(route, isA<MaterialPageRoute<SearchClientPage>>());
    expect(route?.builder(context), isA<SearchClientPage>());
  });
  test('Test router returns search detail view page', () {
    final RouteSettings settings = RouteSettings(
      name: AppRoutes.searchDetailViewPage,
      arguments: <String, dynamic>{
        'searchUserResponse': SearchUserResponse.initial(),
        'isClient': true
      },
    );

    final MaterialPageRoute<SearchPageDetailView>? route =
        routeGenerator(settings) as MaterialPageRoute<SearchPageDetailView>?;

    expect(route, isA<MaterialPageRoute<SearchPageDetailView>>());
    expect(route?.builder(context), isA<SearchPageDetailView>());
  });
  test('Test router returns PendingPINRequestPage', () {
    const RouteSettings settings =
        RouteSettings(name: AppRoutes.pendingPINRequestPage);

    final MaterialPageRoute<PendingPINRequestPage>? route =
        routeGenerator(settings) as MaterialPageRoute<PendingPINRequestPage>?;

    expect(route, isA<MaterialPageRoute<PendingPINRequestPage>>());
    expect(route?.builder(context), isA<PendingPINRequestPage>());
  });
  test('Test router returns pin request sent page', () {
    const RouteSettings settings =
        RouteSettings(name: AppRoutes.pinRequestSentPage, arguments: '');

    final MaterialPageRoute<PinRequestSentPage>? route =
        routeGenerator(settings) as MaterialPageRoute<PinRequestSentPage>?;

    expect(route, isA<MaterialPageRoute<PinRequestSentPage>>());
    expect(route?.builder(context), isA<PinRequestSentPage>());
  });
  test('Test router returns LoginCounterPage', () {
    const RouteSettings settings =
        RouteSettings(name: AppRoutes.loginCounterPage, arguments: 0);

    final MaterialPageRoute<LoginCounterPage>? route =
        routeGenerator(settings) as MaterialPageRoute<LoginCounterPage>?;

    expect(route, isA<MaterialPageRoute<LoginCounterPage>>());
    expect(route?.builder(context), isA<LoginCounterPage>());
  });

  test('Test router returns PinExpiredPage', () {
    const RouteSettings settings =
        RouteSettings(name: AppRoutes.pinExpiredPage);

    final MaterialPageRoute<PinExpiredPage>? route =
        routeGenerator(settings) as MaterialPageRoute<PinExpiredPage>?;

    expect(route, isA<MaterialPageRoute<PinExpiredPage>>());
    expect(route?.builder(context), isA<PinExpiredPage>());
  });
  test('Test router returns VerifySecurityQuestionsHelpPage', () {
    const RouteSettings settings =
        RouteSettings(name: AppRoutes.verifySecurityQuestionsHelpPage);

    final MaterialPageRoute<VerifySecurityQuestionsHelpPage>? route =
        routeGenerator(settings)
            as MaterialPageRoute<VerifySecurityQuestionsHelpPage>?;

    expect(route, isA<MaterialPageRoute<VerifySecurityQuestionsHelpPage>>());
    expect(route?.builder(context), isA<VerifySecurityQuestionsHelpPage>());
  });

  test('Test router returns accept decline invites page', () {
    const RouteSettings settings = RouteSettings(
      name: AppRoutes.acceptGroupInvitesPage,
      arguments: <String, dynamic>{
        'groupId': '',
        'groupName': '',
        'numberOfMembers': 0,
      },
    );

    final MaterialPageRoute<AcceptGroupInvitesPage>? route =
        routeGenerator(settings) as MaterialPageRoute<AcceptGroupInvitesPage>?;

    expect(route, isA<MaterialPageRoute<AcceptGroupInvitesPage>>());
    expect(route?.builder(context), isA<AcceptGroupInvitesPage>());
  });

  test('Test router returns StaffPinResetRequestsPage', () {
    const RouteSettings settings = RouteSettings(
      name: AppRoutes.staffPinResetRequestsPage,
    );

    final MaterialPageRoute<StaffPinResetRequestsPage>? route =
        routeGenerator(settings)
            as MaterialPageRoute<StaffPinResetRequestsPage>?;

    expect(route, isA<MaterialPageRoute<StaffPinResetRequestsPage>>());
    expect(route?.builder(context), isA<StaffPinResetRequestsPage>());
  });
  test('Test router returns RedFlagActionsPage', () {
    final RouteSettings settings = RouteSettings(
      name: AppRoutes.redFlagActionsPage,
      arguments: ServiceRequest(),
    );

    final MaterialPageRoute<RedFlagActionsPage>? route =
        routeGenerator(settings) as MaterialPageRoute<RedFlagActionsPage>?;

    expect(route, isA<MaterialPageRoute<RedFlagActionsPage>>());
    expect(route?.builder(context), isA<RedFlagActionsPage>());
  });
  test('Test router returns ScreeningToolsListPage', () {
    const RouteSettings settings = RouteSettings(
      name: AppRoutes.screeningToolsListPage,
    );

    final MaterialPageRoute<ScreeningToolsListPage>? route =
        routeGenerator(settings) as MaterialPageRoute<ScreeningToolsListPage>?;

    expect(route, isA<MaterialPageRoute<ScreeningToolsListPage>>());
    expect(route?.builder(context), isA<ScreeningToolsListPage>());
  });

  test('Test router returns AssessmentCardAnswersPage', () {
    const RouteSettings settings = RouteSettings(
      name: AppRoutes.assessmentCardAnswersPage,
      arguments: <String, dynamic>{},
    );

    final MaterialPageRoute<AssessmentCardAnswersPage>? route =
        routeGenerator(settings)
            as MaterialPageRoute<AssessmentCardAnswersPage>?;

    expect(route, isA<MaterialPageRoute<AssessmentCardAnswersPage>>());
    expect(route?.builder(context), isA<AssessmentCardAnswersPage>());
  });
  test('Test router returns AssessmentToolsCategoryPage', () {
    const RouteSettings settings = RouteSettings(
      name: AppRoutes.assessmentToolResponsesPage,
      arguments: ScreeningToolsType.VIOLENCE_ASSESSMENT,
    );

    final MaterialPageRoute<AssessmentToolResponsesPage>? route =
        routeGenerator(settings)
            as MaterialPageRoute<AssessmentToolResponsesPage>?;

    expect(route, isA<MaterialPageRoute<AssessmentToolResponsesPage>>());
    expect(route?.builder(context), isA<AssessmentToolResponsesPage>());
  });

  test('Test router returns successful edit group info page', () {
    const RouteSettings routeSettings =
        RouteSettings(name: AppRoutes.editGroupInfoPage);
    final MaterialPageRoute<dynamic>? route =
        routeGenerator(routeSettings) as MaterialPageRoute<dynamic>?;

    expect(route, isA<MaterialPageRoute<EditGroupInfoPage>>());
    expect(route?.builder(context), isA<EditGroupInfoPage>());
  });

  test('Test router returns successful resume pin connector', () {
    const RouteSettings settings = RouteSettings(name: AppRoutes.resumeWithPin);

    final MaterialPageRoute<ResumePinConnector>? route =
        routeGenerator(settings) as MaterialPageRoute<ResumePinConnector>?;

    expect(route, isA<MaterialPageRoute<ResumePinConnector>>());
    expect(route?.builder(context), isA<ResumePinConnector>());
  });

  test('Test router returns successful Facility Contacts Page', () {
    const RouteSettings settings =
        RouteSettings(name: AppRoutes.facilityContactsPage);

    final MaterialPageRoute<FacilityContactsPage>? route =
        routeGenerator(settings) as MaterialPageRoute<FacilityContactsPage>?;

    expect(route, isA<MaterialPageRoute<FacilityContactsPage>>());
    expect(route?.builder(context), isA<FacilityContactsPage>());
  });

  test('Test router returns  Document page', () {
    const RouteSettings settings = RouteSettings(
      name: AppRoutes.viewDocumentPage,
      arguments: <String, dynamic>{
        'pdfUrl': 'http://www.africau.edu/images/default/sample.pdf',
        'pdfTitle': 'Sample PDF',
      },
    );

    final MaterialPageRoute<DocumentContentPage>? route =
        routeGenerator(settings) as MaterialPageRoute<DocumentContentPage>?;

    expect(route, isA<MaterialPageRoute<DocumentContentPage>>());
    expect(route?.builder(context), isA<DocumentContentPage>());
  });
}
