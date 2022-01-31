import 'package:afya_moja_core/enums.dart';

const String addIndividualPractitionerKYCMutation = r'''
 mutation addIndividualPractitionerKYC($input: IndividualPractitionerInput! ){
    addIndividualPractitionerKYC(input: $input){       
    KRAPIN   
    supportingDocuments{
      supportingDocumentTitle
    }
    registrationNumber
    practiceLicenseID    
    cadre
  }
}
''';

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
