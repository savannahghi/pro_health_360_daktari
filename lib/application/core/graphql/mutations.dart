import 'package:healthcloud/application/redux/states/practitioner_kyc_models/practitioner.dart';
import 'package:healthcloud/domain/core/entities/identification.dart';
import 'package:healthcloud/domain/core/entities/supporting_documents.dart';

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

Map<String, dynamic> individualPractitionerKYCMutationVariables({
  required IndividualPractitioner payload,
}) {
  return <String, dynamic>{
    'input': <String, dynamic>{
      'identificationDoc': payload.identificationDoc!.toJson(),
      'KRAPIN': payload.kraPin,
      'KRAPINUploadID': payload.kraPinUploadId,
      'registrationNumber': payload.registrationNumber,
      'practiceLicenseID': payload.practiceLicenseID,
      'practiceServices': payload.practiceServices,
      'cadre': payload.cadre,
      'practiceLicenseUploadID': payload.practiceLicenseUploadID,
      'supportingDocuments': payload.supportingDocuments!
          .map((SupportingDocument e) => e.toJson())
          .toList(),
    }
  };
}

const String addOrganizationPractitionerKYCMutation = r'''
  mutation  addOrganizationPractitionerKYC($input: OrganizationPractitionerInput!){
    addOrganizationPractitionerKYC(input: $input){        
      organizationTypeName        
      KRAPIN            
      certificateOfIncorporation
      certificateOfInCorporationUploadID       
      organizationCertificate       
      registrationNumber      
      cadre
    }
  }
''';

Map<String, dynamic> organizationPractitionerKYCMutationVariables(
    {required OrganizationPractitioner payload}) {
  return <String, dynamic>{
    'input': <String, dynamic>{
      'directorIdentifications': payload.directorIdentifications!
          .map((Identification e) => e.toJson())
          .toList(),
      'KRAPIN': payload.kraPin,
      'KRAPINUploadID': payload.kraPinUploadId,
      'certificateOfIncorporation': payload.certificateOfIncorporation,
      'certificateOfInCorporationUploadID':
          payload.certificateOfInCorporationUploadID,
      'organizationTypeName': payload.organizationTypeName,
      'registrationNumber': payload.registrationNumber,
      'practiceLicenseID': payload.practiceLicenseID,
      'practiceServices': payload.practiceServices,
      'cadre': payload.cadre,
      'supportingDocuments': payload.supportingDocuments!
          .map((SupportingDocument e) => e.toJson())
          .toList(),
    }
  };
}
