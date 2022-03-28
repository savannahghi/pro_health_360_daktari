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
    ID
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
        ID
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
    createdBy{
      ID
    }
  }
}
''';

const String searchClientQuery = r'''
query searchClientsByCCCNumber($CCCNumber: String!){
  searchClientsByCCCNumber(CCCNumber: $CCCNumber){
    ID
    CCCNumber 
    User{
      ID
      Username
      Active
      Contacts{
        ContactValue
        Active
        OptedIn
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
        ID
        ContactType
        ContactValue
        Active
        OptedIn
      }
      TermsAccepted
    }
  }
}
''';

const String getUserRolesQuery = r'''
query getUserRoles($userID: String!){
  getUserRoles(userID: $userID){
    roleID
    name
  }
}
''';
