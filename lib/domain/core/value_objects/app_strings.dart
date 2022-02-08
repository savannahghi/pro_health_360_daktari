import 'package:healthcloud/application/core/services/utils.dart';

const String appName = 'myCareHub';

//Create New Pin Page
const String confirmPinString = 'Confirm PIN';
const String createNewPINTitleString = 'Create new PIN';
const String resetPINTitleString = 'Reset PIN';
const String createNewPINSubTitleString =
    'Please update your PIN to make it personal';
const String phoneNumberString = 'Phone Number';
const String newPinString = 'New PIN';
const String pinMustMatchString = 'PIN must match';
const String acceptTermsAndConditionsString = 'I accept Terms and Conditions';
const String acceptTermsString =
    'Kindly accept terms and conditions to continue';
const String comingSoon = 'Coming Soon';
const String pinSuccessString = 'PIN created successfully';

//Forgot PIN Page
const String resetPassword = 'Reset password?';
const String resetPasswordDescription = 'Enter your phone number';
const String sendOTPString = 'Send OTP';
const String emailOrPhone = 'Email/Phone';

//Verify phone number page
const String verifyPhoneNumberTitle = 'Verify phone number';
const String verifyPhoneNumberDescription =
    'A six digit verification code has been sent to your phone';
const String enterOTPString = 'Enter verification code to proceed';
const String confirmOTPButtonString = 'Confirm OTP';
const String invalidOTPString = 'Invalid OTP *';
String anOtpHasBeenSentText(String phoneNumber) {
  return 'An OTP has been sent to $phoneNumber';
}

const String verifyCode = 'Verifying Code';

const String resendOTP = 'Resend code';

const String verifyOTPState = 'verifyOTPState';
const String didNotReceiveOTP = 'Did not receive a verification code?';

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
const String phoneLoginPageTitle = 'Welcome to myCareHub';
const String phoneLoginPageDescription = 'Enter your provided PIN to continue';
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

const String informationRequired =
    'Please provide all the required information';
const String successMessage = 'Information saved successfully';
const String addEmail = 'Add Email Address';
const String thanksText = 'Okay, Thank You';
const String okay = 'Okay';
const String continueText = 'Continue';
const String doItLater = 'Do it later';

// User Profile
const String correctionRequestString = 'Request for correction';
const String myProfileString = 'My Profile';
const String name = 'Dr. Afya Njema';
const String profession = 'Doctor';
const String clinicName = 'myCareHub Medical Center';
const String phoneNumber = '0712345678';
const String emailAddress = 'admin@mycarehub.com';
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
const String needsAttentionString = ' needs attention';
const String redFlagString = 'Red Flags';
const String reachOutString = 'Reach out?';
const String callString = 'Call';
const String forString = 'for';
const String reviewString = 'Review';
const String wantProfiledUpdatedString = ' wants to update their profile';
const String reachOutDescriptionPart1String = 'Use their phone number ';
const String reachOutDescriptionPart2String =
    ' or tap the button below to call them directly';

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
const String preferredFacilityLabel = 'Preferred Facility *';
const String firstNameLabel = 'First Name';
const String lastNameLabel = 'Last Name';
const String birthDateLabel = 'Birth Date';
const String genderLabel = 'Gender';
const String idNoLabel = 'ID No.';
const String phoneNoLabel = 'Phone No.';
const String physicalLocationLabel = 'Physical Location';
const String nextOfKinLabel = 'Next of Kin';
const String relationLabel = 'Relation';
const String appAccessText = 'App Access';
const String myCareHubInviteText = 'Invite to myCareHub';
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
//Client Health Page
const String myHealthPageTitle = 'My Health';
const String initials = 'WJ';
const String myHealthViralLoad = 'Viral load';
const String myHealthViralLoadReading = '600';
const String myHealthViralLoadReadingUnit = '/ml';
const String myHealthNextRefill = 'Next refill';
const String myHealthNextRefillDate = '19';
const String myHealthNextRefillMonth = 'Aug';
const String myHealthPageHealthDiary = 'My Health Diary';
const String myHealthPageAppointments = 'Appointments';
const String newEntryString = 'New Entry';
const String transferOut = 'Transfer out';

//Client Details Card
const String inviteToMyCareHubString = 'Invite to myCareHub';
const String viewProfileString = 'View profile';
const String userInitialsStrings = 'WJ';
const String userCCCNumberString = '12345678';
const String ageExampleString = '18';
const String homeExampleString = 'Karen';
String formatCCCNumber(String cccNumber) {
  return 'CCC No: $cccNumber';
}

String formatAge(String age) {
  return 'Age: $age yrs';
}

const String noAccount =
    'No account with that phone number. Use the number you registered with or ';
const String checkConnectionText =
    'Slow internet connection. Please check your connection and try again';
const String userPhoneExistsText = 'User with that phone number exists.';
const String userEmailExistsText = 'User with that email address exists.';
const String usernameExistsText = 'That username is already in use.';
const String noUserFoundText = 'We could not find a user with those details.';
const String wrongCredentialsText = 'Wrong login details provided';
const String noPINFoundText = 'No PIN found for this user.';

const String errorPhoneLogin = 'Error: Unable to login by phone';

const String connectionLostText = 'Internet connection lost';

const String fieldCannotBeEmptyText = 'Field cannot be empty';

// PhoneNumberFormConstants
const String phoneNumberInputLabelText = 'Phone number';

const String wrongLoginCredentials = 'Your phone number or PIN do not match.';

const String wrongCredentials =
    'Sorry, the credentials you entered are incorrect. Please try again or '
    'contact support';
const String resetPin = 'reset your PIN';
const String phoneLoginCreateAccountText = 'create an account';

const String confirmPinPrompt = 'A 4 digit PIN is required';
const String confirmPinMatch = 'PINs do not match';
const String loginPinDigits = 'Only numbers are allowed, 0-9';
const String loginPinLength = 'Enter a four digit PIN';
const String phoneLoginText = 'Sign In';

const String drawerTestRootText = 'You have closed the drawer';

const String somethingWentWrongText =
    'Sorry, an unknown error occurred, please try again or get help from '
    'our help center.';

// Terms and conditions
const String portalTermsText = 'Portal terms and conditions';
const String readAndAcceptText =
    'Please review the terms of service below and accept them';
const String acceptTermsText = 'I agree with the terms and conditions';

const String closeString = 'Close';

// HTTP requests
const String httpPOST = 'POST';
const String httpGET = 'GET';

// Errors
const String genericErrorOccurred = 'Sorry, an error occurred';
const String noInternetConnection = 'No Internet Connection';

// set nickname page
const String setNicknameDescription =
    'Please create a nickname (Visible to community members)';
const String nickNameString = 'Nickname';
const String nameInputValidateString = 'Kindly input a nickname';
const String nicknameSuccessString = 'Nickname created successfully';
const String logoutButtonText = 'Logout';

final String copyrightString = 'Copyright ©️ ${returnCurrentYear()} myCareHub';
const String appVersionString = 'Current Version:';
const String setNicknameString = 'Set Your Nickname';

// this is the version of the currently running app.
// it has to be defined as a const otherwise the compiler will return the default
const String APPVERSION =
    String.fromEnvironment('APPVERSION', defaultValue: 'dev-build');
const String saveAndContinueButtonText = 'Save & Continue';
const String kindlyAnswerAllQuestionsString = 'Kindly answer all questions';

// user friendly messages
const String defaultUserFriendlyMessage =
    'Sorry, an unknown error occurred, please try again or get help from our help center.';
const String invalidCode =
    'You have entered a wrong code. Kindly verify the code sent or resend the code to your phone number';
const String sendOTPError =
    'There was an error while sending your verification code. Let’s get you a fresh verification code';
