// Project imports:
import 'package:healthcloud/application/redux/states/practitioner_kyc_state.dart';
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
  required PractitionerKYCState payload,
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
