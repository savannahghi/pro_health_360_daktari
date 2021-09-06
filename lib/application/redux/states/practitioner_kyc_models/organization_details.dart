import 'package:healthcloud/domain/core/entities/identification.dart';
import 'package:healthcloud/domain/core/entities/kra_details.dart';
import 'package:healthcloud/domain/core/entities/supporting_documents.dart';

abstract class OrganizationDetails extends KRADetails {
  String? get organizationTypeName;
  String? get certificateOfIncorporation;
  String? get certificateOfInCorporationUploadID;
  List<Identification>? get directorIdentifications;
  List<SupportingDocument>? get supportingDocuments;
}
