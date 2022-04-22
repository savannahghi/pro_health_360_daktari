const String getTermsQuery = r'''
query getCurrentTerms($flavour: Flavour!) {
  getCurrentTerms(flavour: $flavour) {
    termsID
    text
  }
}
''';

const String getSecurityQuestionsQuery = r'''
query getSecurityQuestions($flavour: Flavour!) {
  getSecurityQuestions(flavour: $flavour) {
    SecurityQuestionID
    QuestionStem
    Description
    Active
    ResponseType
  }
}
''';
const String listFacilitiesQuery = r'''
query listFacilities($searchTerm: String, $filterInput:[FiltersInput],$paginationInput:PaginationsInput!){
  listFacilities(searchTerm: $searchTerm,filterInput: $filterInput,paginationInput: $paginationInput){
    Facilities{
      ID
      name
      code
      phone
      county
      description
    }
  }
}
''';

const String fetchFacilitiesQuery = '''
query fetchFacilities {
  fetchFacilities {
    ID,
    name,
  }
}
''';

const String getServiceRequestsQuery = r'''
query getServiceRequests($type: String, $status: String, $facilityID: String!, $flavour: Flavour!){
  getServiceRequests(requestType: $type, requestStatus: $status, facilityID: $facilityID, flavour: $flavour){
    ID
    RequestType
    Request
    ClientID
    FacilityID
    ClientName
    ClientContact
    Status
    ResolvedAt
    ResolvedBy
    ResolvedByName
    CreatedAt
    Meta
    StaffID
    StaffName
    StaffContact
  }
}
''';

const String getPendingServiceRequestsCountQuery = r'''
query getPendingServiceRequestsCount($facilityID: String!){
  getPendingServiceRequestsCount(facilityID: $facilityID){
    clientsServiceRequestCount {
      requestsTypeCount {
        requestType
        total
      }
    }
    staffServiceRequestCount {
      requestsTypeCount {
        requestType
        total
      }
    }
  }
}
''';

const String getFAQContentQuery = r'''
query getFAQContent($flavour: Flavour!, $limit: Int!){
  getFAQContent(flavour: $flavour, limit: $limit ){
    ID
    Active
    Title
    Description
    Body
    Flavour
  }
}
''';

const String listMembersQuery = r'''
query listMembers($input: QueryOption){
  listMembers(input: $input){
    id
    userID
    role
    username
  }
}
''';

const String inviteMembersToCommunityQuery = r'''
query inviteMembersToCommunity($communityID: String!,$memberIDs: [String!]! ){
  inviteMembersToCommunity(communityID: $communityID, memberIDs: $memberIDs)
}
''';

const String listCommunityMembersQuery = r'''
query listCommunityMembers($communityID: ID!){
	listCommunityMembers(communityID: $communityID) {
      user{
        id
        username
        role
        extraData
      }
      isModerator
  }
}
''';

const String listUserInvitedCommunitiesQuery = r'''
query listPendingInvites($memberID: String!, $input: QueryOption){
  listPendingInvites(memberID: $memberID, input: $input){
    id
    name
    memberCount
    gender
    description
  }
}
''';

const String searchClientQuery = r'''
query searchClientsByCCCNumber($CCCNumber: String!){
  searchClientsByCCCNumber(CCCNumber: $CCCNumber){
    ID
    CCCNumber
    FacilityID
    Active 
    User{
      ID
      Username
      Active
       Contacts{
        id
        contactValue
        active
        optedIn
      }
      TermsAccepted     
    }
  }
}
''';

const String searchStaffMemberQuery = r'''
query searchStaffByStaffNumber($staffNumber: String!){
  searchStaffByStaffNumber(staffNumber: $staffNumber){
    ID
    StaffNumber
    User{
      ID
      Username
      Active
      Contacts{
        id
        contactType
        contactValue
        active
        optedIn
      }
      TermsAccepted
    }
  }
}
''';

const String getUserRolesQuery = r'''
query getUserRoles($userID: String!){
  getUserRoles(userID: $userID){
    authorityRoleID
    name
  }
}
''';

const String listFlaggedMessagesQuery = r'''
query listFlaggedMessages($communityCID: String,$memberIDs: [String]){
  listFlaggedMessages(communityCID: $communityCID,memberIDs: $memberIDs){
    message{
      id
      text
      created_at
      user{
        id
        userID
        name
        username
      }
    }
  }
}
''';

const String getAvailableFacilityScreeningToolsQuery = r'''
query getAvailableFacilityScreeningTools($facilityID: String!){
  getAvailableFacilityScreeningTools(facilityID: $facilityID){
    toolType
  }
}
''';

const String verifyPinQuery = r'''
query verifyPin($userID: String!, $flavour:Flavour!, $pin: String!){
  verifyPIN(userID: $userID, flavour: $flavour, pin: $pin)
}
''';

const String getAssessmentResponsesByToolTypeQuery = r'''
query getAssessmentResponsesByToolType(
  $facilityID: String!
  $toolType: String!
) {
  getAssessmentResponsesByToolType(
    facilityID: $facilityID
    toolType: $toolType
  ) {
    clientName
    dateAnswered
    clientID
  }
}
''';

const String recentlySharedHealthDiaryQuery = r'''
query getSharedHealthDiaryEntries($clientID: String!, $facilityID: String!){
  getSharedHealthDiaryEntries(clientID:$clientID, facilityID: $facilityID){
    id
    active
    mood
    note
    sharedAt
  }
}
''';

const String getScreeningToolServiceRequestResponsesQuery = r'''
query getScreeningToolServiceRequestResponses($clientID: String!, $toolType: ScreeningToolType!) {
  getScreeningToolServiceRequestResponses(
    clientID: $clientID,
    toolType: $toolType
  ) {
   toolIndex
    tool
    response
    serviceRequestID
  }
}
''';

const String listNotificationsQuery = r'''
query listNotifications(
  $flavour: Flavour!
  $userID: ID!
  $paginationInput: PaginationsInput!
) {
  fetchNotifications(
    flavour: $flavour
    userID: $userID
    paginationInput: $paginationInput
  ) {
    notifications {
      id
      title
      body
      type
      isRead
    }
  }
}
''';
