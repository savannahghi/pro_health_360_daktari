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
