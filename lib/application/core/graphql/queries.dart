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
const String searchFacilityQuery = r'''
query searchFacility($searchParameter: String) {
  searchFacility(searchParameter: $searchParameter) {
    ID
    name
    code
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
    StaffContact
    StaffID
    StaffName
    Status
    CreatedAt
    Meta
  }
}
''';

const String getResolvedServiceRequestsQuery = r'''
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

const String listMembersQuery = r'''
query listMembers($input: QueryOption){
  listMembers(input: $input){
    id
    userID
    role
    userType
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
query listCommunityMembers($communityID: ID!, $communityMembersFilter: QueryOption!, $listCommunitiesFilter: QueryOption!){
	listCommunityMembers(communityID: $communityID, input: $communityMembersFilter) {
      user{
        id
        userID
        username
        role
        extraData
      }
      isModerator
  }
  listCommunities(input: $listCommunitiesFilter) {
    ageRange {
      lowerBound
      upperBound
    }
    gender
    clientType
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
query searchClientUser($searchParameter: String!) {
  searchClientUser(searchParameter: $searchParameter) {
     ID
    CCCNumber
    FacilityID
    Active 
    User{
      ID
      Username
      Name
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
query searchStaffUser($searchParameter: String!) {
  searchStaffUser(searchParameter: $searchParameter) {
    ID
    StaffNumber
    User{
      ID
      Username
      Name
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
       attachments{
        type
        title
        image_url
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
    serviceRequestID
    clientContact
    screeningToolResponses {
      toolIndex
      tool
      response
    }
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
      createdAt
    }
  }
}
''';

const String listSurveysQuery = r'''
query listSurveys($projectID: Int!){
  listSurveys(projectID: $projectID) {
    projectId
    xmlFormId
    name
  }
}
''';

const String getCategoriesQuery = '''
query listContentCategories{
  listContentCategories{
   id
   name
   iconUrl
  }
}
''';

const String getContentQuery = r'''
query getContent($categoryID: Int, $Limit: String!){
  getContent(categoryID: $categoryID, Limit: $Limit) {
    meta{
      totalCount
    }
    items {
      ID
      title
      date
      intro
      authorName
      tagNames
      meta{
        contentType
        slug
        showInMenus
        seoTitle
        searchDescription
        firstPublishedAt
        locale
      }
      itemType
      timeEstimateSeconds
      body
      heroImageRendition{
        url
        width
        height
        alt
      }
      documents {
        ID
        Document {
          ID
          title
          meta {
            documentDetailUrl
            documentDownloadUrl
          }
        }
      }
      featuredMedia{
        ID
        url
        title
        type
        duration
        width
        height
        thumbnail
        duration
      }
      galleryImages{
        ID
        image{
          ID
          title
          meta{
            imageDownloadUrl
          }
        }
      }
    }
  }
}
''';

const String retrieveFacilityQuery = r'''
query retrieveFacility($id: String!, $active: Boolean!){
  retrieveFacility(id: $id, active: $active) {
    ID
    name
    code
    phone
  }
}
''';
