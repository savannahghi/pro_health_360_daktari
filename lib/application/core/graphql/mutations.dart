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
    clientTypes
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

const String registerStaffMutation = r'''
mutation registerStaff($input: StaffRegistrationInput!){
  registerStaff(input:$input){
    ID
    active
    staffNumber
    userID
    defaultFacility
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

const String verifyClientPinResetServiceRequestQuery = r'''
mutation verifyClientPinResetServiceRequest(
  $clientID: String!
  $serviceRequestID: String!
  $cccNumber: String!
  $phoneNumber: String!
  $physicalIdentityVerified: Boolean!
  $state:String!
) {
  verifyClientPinResetServiceRequest(
    clientID: $clientID
    serviceRequestID: $serviceRequestID
    cccNumber: $cccNumber
    phoneNumber: $phoneNumber
    physicalIdentityVerified: $physicalIdentityVerified
    state: $state
  )
}
''';

const String verifyStaffPinResetServiceRequestQuery = r'''
mutation verifyStaffPinResetServiceRequest($phoneNumber: String!, $serviceRequestID: String!, $verificationStatus: String!){
  verifyStaffPinResetServiceRequest(phoneNumber: $phoneNumber, serviceRequestID: $serviceRequestID, verificationStatus: $verificationStatus)
}
''';

const String acceptInvitationMutation = r'''
mutation acceptInvitation($memberID: String!, $communityID: String!){
  acceptInvitation(memberID: $memberID, communityID: $communityID)
}
''';

const String rejectInvitationMutation = r'''
mutation rejectInvitation($memberID: String!, $communityID: String!){
  rejectInvitation(memberID: $memberID, communityID: $communityID)
}
''';

const String inviteUserMutation = r'''
mutation inviteUser($userID: String!, $phoneNumber: String!, $flavour: Flavour!, $reinvite: Boolean!) {
  inviteUser(userID: $userID, phoneNumber: $phoneNumber, flavour: $flavour, reinvite: $reinvite)
}
''';

const String assignOrRevokeRoles = r'''
mutation assignOrRevokeRoles($userID: String!, $roles: [UserRoleType!]!){
  assignOrRevokeRoles(userID: $userID, roles: $roles)
}
''';

const String removeFromGroupMutation = r'''
mutation removeMembersFromCommunity($communityID: String!, $memberIDs: [String!]!){
  removeMembersFromCommunity(communityID: $communityID, memberIDs: $memberIDs)
}
''';

const String banUserMutation = r'''
mutation BanUser($memberID: String!, $bannedBy: String!, $communityID: String!){
  banUser(MemberID: $memberID, bannedBy: $bannedBy, communityID: $communityID)
}
''';

const String promoteToModeratorMutation = r'''
mutation addModerators($memberIDs: [String!]!, $communityID: String!){
  addModerators(memberIDs: $memberIDs, communityID: $communityID)
}
''';

const String demoteModeratorMutation = r'''
mutation demoteModerators($memberIDs: [String!]!, $communityID: String!){
  demoteModerators(memberIDs: $memberIDs, communityID: $communityID)
}
''';

const String unBanUserMutation = r'''
mutation UnBanUser($memberID: String!, $communityID: String!){
  unBanUser(memberID: $memberID, communityID: $communityID)
}
''';

const String deleteCommunityMessageMutation = r'''
mutation deleteCommunityMessage($messageID: String!){
  deleteCommunityMessage(messageID: $messageID)
}
''';
const String resolveServiceRequestMutation = r'''
mutation ResolveServiceRequest($staffID: String!, $requestID: String!, $action: String!, $comment: String){
  resolveServiceRequest(staffID: $staffID, requestID: $requestID, action: $action, comment: $comment)
}
''';

const String setPushTokenMutation = r'''
mutation setPushToken($token: String!){
  setPushToken(token: $token)
}
''';

const String sendClientSurveyLinksMutation = r'''
mutation sendClientSurveyLinks(
  $facilityID: String!, 
  $formID: String!, 
  $projectID: Int!, 
  $filterParams: ClientFilterParamsInput ){
  sendClientSurveyLinks(
    facilityID: $facilityID,
    formID: $formID,
    projectID: $projectID,
    filterParams: $filterParams
    )
}
''';

const String readNotificationsMutation = r'''
mutation readNotifications($ids: [ID!]!){
  readNotifications(ids: $ids)
}
''';

const String addFacilityContactMutation = r'''
mutation addFacilityContact($facilityID: ID!, $contact: String!) {
  addFacilityContact(facilityID: $facilityID, contact: $contact)
}
''';
