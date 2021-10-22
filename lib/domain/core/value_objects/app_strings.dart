// Package imports:
// Project imports:
import 'package:healthcloud/domain/core/entities/practice_service.dart';
import 'package:misc_utilities/misc.dart';

const String helpCenterTitle = 'AfyaMoja support center';
const String appName = 'Afya Moja';

const String provideAllRequiredInfoString =
    'Please provide all the required information';
const String indPractitionerKYCHeaderTitle = 'Your practice details';
const String orgTypeName = 'What is your organization type?';
const String organizationTypeOneValueText = 'LIMITED_COMPANY';
const String organizationTypeOneText = 'Limited Company';
const String organizationTypeTwoValueText = 'TRUST';
const String organizationTypeTwoText = 'Trust';
const String organizationTypeThreeValueText = 'UNIVERSITY';
const String organizationTypeThreeText = 'University';
const String orgCertIncorporation = 'Your Certificate of Incorporation Details';
const String incorporationCertificateLabel =
    'Your Certificate of Incorporation (Optional)';
const String incorporationCertificateHintText =
    'Enter your Certificate of Incorporation number';
const String incorporationCertificateUploadText =
    'certificate of incorporation (Optional)';
const String cadreText = 'What is your profession?';
const String doctorValue = 'DOCTOR';
const String doctorText = 'Doctor';
const String nurseValue = 'NURSE';
const String nurseText = 'Nurse';
const String clinicalOfficerValue = 'CLINICAL_OFFICER';
const String clinicalOfficerText = 'Clinical Officer';
const String regNoLabel = 'Add your business registration number';
const String regHintText = 'Enter your Registration number';
const String regRequired = 'Registration number is required';
const String licRequired = 'Practice license is required';
const String licenceUploadText = 'your licence';
const String licUploadText = 'your licence (Optional)';
const String licenseLabel = 'Your practice license';
const String licenseHintText = 'Enter your Practice license';
const String practiceServicesText = 'Please tick all services that you offer';
const String practiceServicesRequired = 'Please select at least one service';
const String next = 'Next';
const String nationalIdText = 'NATIONALID';
const String uploadYourKraString =
    'Kindly upload your KRA PIN certificate photo';
const String idDocumentDetailsText = 'Identification document details';

//Create New Pin Page
const String confirmPinString = 'Confirm PIN';
const String createNewPINTitleString = 'Welcome to My Afya Hub';
const String createNewPINSubTitleString =
    'Please update your pin to make it personal';
const String phoneNumberString = 'Phone Number';
const String newPinString = 'New PIN';
const String pinMustMatchString = 'PIN must match';
const String acceptTermsAndConditionsString = 'I accept Terms and Conditions';
const String acceptTermsString =
    'Kindly accept terms and conditions to continue';
const String comingSoon = 'Coming Soon';

//Forgot PIN Page
const String resetPassword = 'Reset password?';
const String resetPasswordDescription = 'Enter your phone number';
const String sendOTPString = 'Send OTP';
const String emailOrPhone = 'Email/Phone';

//Verify OTP Page
const String verifyPhoneNumberTitle =
    'A one time PIN has been sent to your phone or email';
const String verifyPhoneNumberDescription =
    'A one time PIN has been sent to your phone';
const String enterOTPString = 'Enter OTP to proceed';
const String confirmOTPButtonString = 'Confirm OTP';
const String invalidOTPString = 'Invalid OTP *';

final List<PracticeService> practiceServicesList = <PracticeService>[
  PracticeService(display: 'OutPatient Services', value: 'OUTPATIENT_SERVICES'),
  PracticeService(display: 'InPatient Services', value: 'INPATIENT_SERVICES'),
  PracticeService(display: 'Pharmacy', value: 'PHARMACY'),
  PracticeService(display: 'Maternity', value: 'MATERNITY'),
  PracticeService(display: 'Lab Services', value: 'LAB_SERVICES'),
  PracticeService(display: 'Other Services', value: 'OTHER'),
];

String uploadYourIdentificationDocument(String idType) =>
    'Kindly upload your ${getIdType(idType: idType, userString: true)} photo';

const String selectIdLabel = 'Select Identification document type';

final List<Map<String, String>> identificationTypes = <Map<String, String>>[
  <String, String>{'api': 'NATIONALID', 'user': 'National ID'},
  <String, String>{'api': 'MILITARY', 'user': 'Military ID'},
  <String, String>{'api': 'PASSPORT', 'user': 'Passport'},
];

List<String> identificationOptions =
    identificationTypes.map((Map<String, String> e) => e['user']!).toList();

String idLabel(String val) => 'Enter $val number';

//Content Page
const String contentPageDescription =
    'To publish new content, please log in to ghost below, create your content and publish';
const String contentManagementString = 'Content management';
const String contentPageTitle = 'Create content';
const String rejectChatDialogTitle = 'Reject message';
const String rejectChatDialogDescription =
    'Are you sure you want to reject these message ?';
const String banUserText = 'Ban user';
const String reportSpamText = 'Report spam';
const String cancelText = '';
String deleteAllMessagesText(String userName) =>
    'Reject all $userName messages';

//Community Page
const String communityChatScreenPageTitle = 'Ruaka Questions Group';
const String typeYourMessageHereString = 'Type your message here';
const String approveText = 'Approve';
const String rejectText = 'Reject';

//Phone Login
const String phoneLoginPageTitle = 'Welcome to My Afya Hub';
const String phoneLoginPageDescription = 'Enter your provided pin to continue';
const String pinString = 'PIN';
const String forgotPinString = 'Forgot Pin';

//Security Questions
const String setSecurityQuestionsString = 'Set security questions';
const String securityQuestionsDescriptionString =
    'Choose one security question. Make sure to remember the answer';
const String whereWereYouBornString = 'Where were you born?';
const String whatsTheNameOfYourPetString = 'What is the name of your pet?';
const String whatsYourFavoriteFoodString = 'What is your favorite food?';
const String whereDidYouFirstLiveString = 'Where did you first live?';
const String answerHereString = 'Answer here';

const String idRequired = 'ID Number is required';
const String kraPINText = 'KRA PIN details';
const String kraLabel = 'Add your KRA PIN';
const String kraHintText = 'Enter your KRA PIN';
const String kraRequired = 'KRA PIN is required';
const String kraTitle = 'KRA PIN';
const String addSupportingDocs = 'Add supporting documents';
const String documentTitle = 'Document Title';
const String documentTitleHint = 'Enter your document title';
const String documentDescription = 'Document Description';
const String documentDescriptionHint = 'Enter your document description';
const String documentUpload = 'document upload';
const String allFieldsRequired = 'All fields are required';
const String doneAddingDoc = 'Done';
const String tapToAddDoc = 'Tap To Add A Document';
const String individualPractitionerKYCString = 'Individual Practitioner';
const String saveText = 'Save';
const String kycSaveSuccessMsg = 'KYC information saved successfully';
const String orgPractitionerKYCHeaderTitle = 'About your organization';
const String organizationPractitionerKYCString = 'Organization Practitioner';
const String orgTypeRequired = 'Organization type is required';
const String addDirectorIDs = 'Add your director identifications';
const String backText = 'Back';

const String informationRequired =
    'Please provide all the required information';
const String successMessage = 'Information saved successfully';
const String addEmail = 'Add Email Address';
const String thanksText = 'Okay, Thank You';
const String primaryEmailAddressNotFilled =
    'It seems you have not added your primary email address. Kindly add it so that your are able to fill in your KYC details';
const String kycAlreadySubmitted =
    'It seems you have already submitted your KYC details. Kindly be patient as your KYC is being processed. An email confirmation will be sent to you after processing';
const String okay = 'Okay';
const String continueButtonText = 'Continue';
const String doItLater = 'Do it later';

String individualTitle(String title) {
  return 'About your $title';
}

String individualDescription(String description) {
  return 'Help us know more about your $description by providing us with '
      'required details';
}

// User Profile
const String correctionRequestString = 'Request for correction';
const String myProfileString = 'My Profile';
const String name = 'Dr. Wanyonje Joseph';
const String profession = 'Doctor';
const String clinicName = 'Kawangware Medical Center';
const String phoneNumber = '0712345678';
const String emailAddress = 'emailAddress@kkcenter.com';
const String licenseNumber = 'PF 14509';
const String gender = 'Male';

// Home Page
const String searchUser = 'Search user';
const String firstName = 'John';
const String time = '09:56 pm';
const String username = 'John Doe';
const String comingSoonText = 'Coming Soon';
const String addNewUserText = 'Add New User';
const String serviceRequestsText = 'Service Requests';
const String profileUpdateText = 'Profile Update';
const String contactRequestText = 'Contact Request';
const String contentString = 'Content';
const String surveysString = 'Surveys';
const String noResultsFoundText = 'Oops!... no results found';
const String addNewPatientText = 'Add new patient';

//Service Requests
const String serviceRequestString = 'Service requests';
const String approveString = 'Approve';
const String searchString = 'Search';
const String reachOutString = 'Reach out';
const String needsAttentionString = ' needs attention';
const String redFlagString = 'Red Flags';
const String cancelString = 'Cancel';
const String scheduleString = 'Schedule a';
const String forString = 'for';
const String meetingTimeString = 'Friday 24th September 2021 at 3:30pm';
const String reviewString = 'Review';
const String wantProfiledUpdatedString = ' wants to update their profile';

// Surveys
const String createSurveyString = 'Create Survey';
const String toCreateNewSurveyDescriptionString =
    'To create a new survey, log in to survey monkey, create your survey and share your survey to a targeted audience';
const String alreadyHaveYourSurveyLinkString = 'Already have your survey link?';
const String shareSurveyString = 'Share Survey';
const String surveyLinkString = 'Survey Link';
const String shareToString = 'Share to';
const String bandString = 'Band';
const String chooseOneString = 'Choose One';
const String ageString = 'Age';
const String locationString = 'Location';
const String clinicString = 'Clinic';
const String confirmString = 'Confirm';

// Notifications
const String notificationsText = 'Notifications';
const String customDate = 'July 12 2021';

// Add patient page
const String CCCNumberLabel = 'CCC Number *';
const String preferredClinicLabel = 'Preferred clinic *';
const String firstNameLabel = 'First Name';
const String lastNameLabel = 'Last Name';
const String birthDateLabel = 'Birthdate';
const String genderLabel = 'Gender';
const String idNoLabel = 'ID No.';
const String phoneNoLabel = 'Phone No.';
const String physicalLocationLabel = 'Physical Location';
const String nextOfKinLabel = 'Next of Kin';
const String relationLabel = 'Relation';
const String appAccessText = 'App Access';
const String myAfyaHubInviteText = 'Invite to MyAfya Hub';
const String groupsLabel = 'Groups/Community';
const String registerBtnText = 'Register';
const String addNewPatientTitleText = 'Add new patient';

// add new group page
const String enterGroupNameText = 'Enter Group name';
const String aboutGroupText = 'About Group';
const String bandLabelText = 'Band';
const String ageLabelText = 'Age';
const String locationLabelText = 'Location';
const String clinicLabelText = 'Clinic';
const String activeModerationLabelText = 'Active Moderation';
const String chooseOneHintText = 'choose one';
const String approvalNoteText =
    'All messages have to be approved to be seen by the group members';

// new broadcast page
const String newBroadcastText = 'New Broadcast';
const String broadcastToText = 'Broadcast to';
const String broadcastNameText = 'Broadcast Name';
