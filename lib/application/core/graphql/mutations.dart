// Project imports:

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
