import 'package:healthcloud/application/core/theme/app_themes.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:healthcloud/domain/core/value_objects/app_types.dart';
import 'package:healthcloud/domain/core/value_objects/app_widget_keys.dart';
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/common/kyc_utils.dart';
import 'package:flutter/material.dart';
import 'package:misc_utilities/file_manager.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';
import 'package:shared_ui_components/inputs.dart';
import 'package:shared_ui_components/platform_loader.dart';

class KYCLicenceAndRegistrationNumber extends StatefulWidget {
  const KYCLicenceAndRegistrationNumber({
    Key? key,
    this.hasRegistrationNumber = false,
    this.isOrganization = false,
    this.isPractitioner = false,
    this.hasLicence = true,
    this.isLicenceUploadRequired = false,
    this.licenseHint,
    this.licenseLabel,
    this.licenseUploadIDOnChanged,
    this.organizationTypeOnChanged,
    this.licenseNumberOnChanged,
    this.cadreOnChanged,
    this.registrationNumberOnChanged,
    this.certificateOfIncorporationDocID,
    this.onCertificateOfIncorporationNumberChanged,
  }) : super(key: key);

  /// Called when the cadre is entered
  final CadreOnChanged? cadreOnChanged;

  /// Called when the certificate of incorporation is uploaded
  final CertificateOfIncorporationDocID? certificateOfIncorporationDocID;

  /// If the KYC requires a license
  final bool hasLicence;

  /// If the KYC requires a registration number
  final bool hasRegistrationNumber;

  /// If the license document is required to be uploaded
  final bool isLicenceUploadRequired;

  /// If the KYC type is an organization
  final bool isOrganization;

  /// If the KYC type is a practitioner
  final bool isPractitioner;

  /// The hint of the license input
  final String? licenseHint;

  /// The label text of the license input
  final String? licenseLabel;

  /// Called when the license number is entered
  final LicenseNumberOnChanged? licenseNumberOnChanged;

  /// Called when the license is uploaded
  final LicenseUploadIDOnChanged? licenseUploadIDOnChanged;

  /// Called when the certificate of incorporation is changed
  final CertificateOfIncorporationNumber?
      onCertificateOfIncorporationNumberChanged;

  /// Called when the organization type is changed
  final OrganizationTypeOnChanged? organizationTypeOnChanged;

  /// Called when the registration number is changed
  final RegistrationNumberOnChanged? registrationNumberOnChanged;

  @override
  _KYCLicenceAndRegistrationNumberState createState() =>
      _KYCLicenceAndRegistrationNumberState();
}

class _KYCLicenceAndRegistrationNumberState
    extends State<KYCLicenceAndRegistrationNumber> {
  String? selectedCadreType;
  String? selectedOrganizationType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // If the KYC type is an organization
        if (widget.isOrganization) ...<Widget>[
          // Organization type prompt
          Text(
            orgTypeName,
            style: TextThemes.normalSize16Text(Colors.black87),
          ),
          mediumVerticalSizedBox,

          // LIMITED COMPANY
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            margin: const EdgeInsets.only(bottom: 15),
            decoration: decoration(context: context),
            child: SILRadio<String>(
              radioButtonKey: kycOrganizationLimitedCompRadioButtonKey,
              value: organizationTypeOneValueText,
              text: organizationTypeOneText,
              onChanged: (String? val) {
                setState(() {
                  selectedOrganizationType = val;
                });
                widget.organizationTypeOnChanged!(val);
              },
              groupValue: selectedOrganizationType,
            ),
          ),

          // TRUST
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            margin: const EdgeInsets.only(bottom: 15),
            decoration: decoration(context: context),
            child: SILRadio<String>(
              radioButtonKey: kycOrganizationTrustRadioButtonKey,
              value: organizationTypeTwoValueText,
              text: organizationTypeTwoText,
              onChanged: (String? value) {
                setState(() {
                  selectedOrganizationType = value;
                });
                widget.organizationTypeOnChanged!(value);
              },
              groupValue: selectedOrganizationType,
            ),
          ),

          // UNIVERSITY
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            margin: const EdgeInsets.only(bottom: 15),
            decoration: decoration(context: context),
            child: SILRadio<String>(
              radioButtonKey: kycOrganizationUniversityRadioButtonKey,
              value: organizationTypeThreeValueText,
              text: organizationTypeThreeText,
              onChanged: (String? v) {
                setState(() {
                  selectedOrganizationType = v;
                });
                widget.organizationTypeOnChanged!(v);
              },
              groupValue: selectedOrganizationType,
            ),
          ),
          mediumVerticalSizedBox,

          /// Certificate of Incorporation Details
          Text(
            orgCertIncorporation,
            style: TextThemes.normalSize16Text(Colors.black87),
          ),
          mediumVerticalSizedBox,
          // Certificate of Incorporation input
          SILFormTextField(
            key: kycOrganizationCertIncorporationKey,
            labelText: incorporationCertificateLabel,
            hintText: incorporationCertificateHintText,
            borderColor: Colors.grey.withOpacity(0.6),
            textStyle: TextThemes.normalSize16Text(),
            onChanged: widget.onCertificateOfIncorporationNumberChanged,
          ),
          mediumVerticalSizedBox,

          // Certificate of Incorporation upload
          FileManager(
            galleryImageKey: kycOrganizationCertIncorporationUploadKey,
            onChanged: widget.certificateOfIncorporationDocID!,
            fileTitle: incorporationCertificateUploadText,
            uploadAndReturnIdFunction: uploadFileAndGetId,
            platformLoader: const SILPlatformLoader(),
          ),
        ],
        mediumVerticalSizedBox,

        // If the KYC type is a practitioner
        if (widget.isPractitioner) ...<Widget>[
          Text(
            cadreText,
            style: TextThemes.normalSize16Text(Colors.black87),
          ),
          mediumVerticalSizedBox,

          // Doctor
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            margin: const EdgeInsets.only(bottom: 15),
            decoration: decoration(context: context),
            child: SILRadio<String>(
              radioButtonKey: doctorRadioKey,
              value: doctorValue,
              text: doctorText,
              onChanged: (String? val) {
                setState(() {
                  selectedCadreType = val;
                });
                widget.cadreOnChanged!(val);
              },
              groupValue: selectedCadreType,
            ),
          ),

          // Nurse
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            margin: const EdgeInsets.only(bottom: 15),
            decoration: decoration(context: context),
            child: SILRadio<String>(
              radioButtonKey: nurseRadioKey,
              value: nurseValue,
              text: nurseText,
              onChanged: (String? val) {
                setState(() {
                  selectedCadreType = val;
                });
                widget.cadreOnChanged!(val);
              },
              groupValue: selectedCadreType,
            ),
          ),

          // Clinical officer
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            margin: const EdgeInsets.only(bottom: 15),
            decoration: decoration(context: context),
            child: SILRadio<String>(
              radioButtonKey: clinicalOfficerRadioKey,
              value: clinicalOfficerValue,
              text: clinicalOfficerText,
              onChanged: (String? val) {
                setState(() {
                  selectedCadreType = val;
                });
                widget.cadreOnChanged!(val);
              },
              groupValue: selectedCadreType,
            ),
          ),
        ],

        // If the KYC requires a registration number
        if (widget.hasRegistrationNumber) ...<Widget>[
          mediumVerticalSizedBox,
          // Registration number
          SILFormTextField(
            key: kycRegNumberKey,
            labelText: regNoLabel,
            hintText: regHintText,
            borderColor: Colors.grey.withOpacity(0.6),
            textStyle: TextThemes.normalSize16Text(),
            validator: (String? value) {
              if (value!.isEmpty) {
                return regRequired;
              }
              return null;
            },
            onChanged: widget.registrationNumberOnChanged,
          ),
        ],

        // If the KYC requires a license
        if (widget.hasLicence) ...<Widget>[
          mediumVerticalSizedBox,
          // License input
          SILFormTextField(
            key: kycLicenceNumberKey,
            labelText: widget.licenseLabel,
            hintText: widget.licenseHint,
            borderColor: Colors.grey.withOpacity(0.6),
            textStyle: TextThemes.normalSize16Text(),
            validator: (dynamic value) {
              if (value.toString().isEmpty) {
                return licRequired;
              }
              return null;
            },
            onChanged: widget.licenseNumberOnChanged,
          ),
          mediumVerticalSizedBox,

          // Upload for the license
          FileManager(
            galleryImageKey: kycLicenceNumUploadKey,
            onChanged: widget.licenseUploadIDOnChanged!,
            fileTitle: widget.isLicenceUploadRequired
                ? licenceUploadText
                : licUploadText,
            uploadAndReturnIdFunction: uploadFileAndGetId,
            platformLoader: const SILPlatformLoader(),
          ),
        ],
      ],
    );
  }
}
