typedef CadreOnChanged = void Function(String? value);
typedef CertificateOfIncorporationDocID = void Function(dynamic value);
typedef LicenseNumberOnChanged = void Function(String value);
typedef LicenseUploadIDOnChanged = void Function(dynamic value);
typedef CertificateOfIncorporationNumber = void Function(String value);
typedef OrganizationTypeOnChanged = void Function(String? value);
typedef RegistrationNumberOnChanged = void Function(String value);
typedef IdDocIDOnChanged = void Function(dynamic value);
typedef IdDocTypeOnChanged = void Function(String? value);
typedef IdNumberOnChanged = void Function(String value);
typedef KraNumIDOnChanged = void Function(dynamic value);
typedef KraNumOnChanged = void Function(String value);
typedef RemoveDocFunc = void Function({
  required String title,
  required String description,
});
typedef RemoveIdentificationDoc = void Function({
  required String idNumber,
});
