// Package imports:
import 'package:misc_utilities/misc.dart';

// Project imports:
import 'package:healthcloud/domain/core/entities/practice_service.dart';

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

//Phone Login
const String phoneLoginPageTitle = 'Welcome to My Afya Hub';
const String phoneLoginPageDescription = 'Enter your provided pin to continue';
const String phoneNumberString = 'Phone Number';
const String pinString = 'PIN';
const String forgotPinString = 'Forgot Pin';

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

//User Profile
const String correctionRequestString = 'Request for correction';
const String myProfileString = 'My Profile';
const String name = 'Dr. Wanyonje Joseph';
const String profession = 'Doctor';
const String clinicName = 'Kawangware Medical Center';
const String phoneNumber = '0712345678';
const String emailAddress = 'emailAddress@kkcenter.com';
const String licenseNumber = 'PF 14509';
const String gender = 'Male';
