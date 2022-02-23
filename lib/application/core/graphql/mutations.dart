import 'package:afya_moja_core/afya_moja_core.dart';

const String acceptTermsAndConditionsMutation = r'''
mutation acceptTerms($userID: String!, $termsID: Int!){
  acceptTerms(userID: $userID, termsID: $termsID)
}
 ''';

Map<String, dynamic> getTermsVariables({String? userId, int? termsId}) {
  return <String, dynamic>{
    'userID': userId,
    'termsID': termsId,
    'flavour': Flavour.pro.name,
  };
}

const String setNickNameMutation = r'''
mutation setNickName($userID: String!, $nickname: String!) {
  setNickName(userID: $userID, nickname: $nickname)
}
 ''';

const String completeOnboardingTourMutation = r'''
mutation completeOnboardingTour($userID: String!, $flavour: Flavour!){
  completeOnboardingTour(userID: $userID, flavour: $flavour)
}
 ''';

const String recordSecurityQuestionResponsesMutation = r'''
mutation recordSecurityQuestionResponses($input: [SecurityQuestionResponseInput!]!){
  recordSecurityQuestionResponses(input: $input){
    securityQuestionID,
    isCorrect
  }
}
 ''';

const String setUserPINMutation = r'''
mutation setUserPin($input: PINInput!){
  setUserPIN(input: $input)
}
 ''';

Map<String, dynamic> setUserPINMutationVariables(
  Map<String, dynamic> setUserPINVariables,
) {
  return <String, dynamic>{'input': setUserPINVariables};
}

const String registerClientMutation = r'''
mutation registerClient($input: ClientRegistrationInput){
  registerClient(input:$input){
    ID
    active
    clientType
    enrollmentDate
    fhirPatientID
    emrHealthRecordID
    treatmentBuddy
    counselled
    organisation
    userID
    currentFacilityID
    chv
    caregiver
  }
}
 ''';

const String inviteUser = r'''
mutation inviteUser($userID: String!, $phoneNumber: String!, $flavour: Flavour!){
  inviteUser(userID:$userID, phoneNumber: $phoneNumber, flavour:  $flavour)
}
 ''';

const String createCommunity = r'''
mutation createCommunity($input: CommunityInput!) {
  createCommunity(input: $input){
    name
    description
    ageRange{
      lowerBound
      upperBound
    }
    gender
    clientType
    inviteOnly
  }
}
''';
