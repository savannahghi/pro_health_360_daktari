import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:healthcloud/domain/core/value_objects/app_types.dart';
import 'package:healthcloud/domain/core/value_objects/app_widget_keys.dart';
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/common/kyc_utils.dart';
import 'package:flutter/material.dart';
import 'package:misc_utilities/file_manager.dart';
import 'package:misc_utilities/misc.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';
import 'package:shared_ui_components/inputs.dart';
import 'package:shared_ui_components/platform_loader.dart';

class KYCIdDocAndKraPIN extends StatefulWidget {
  const KYCIdDocAndKraPIN({
    Key? key,
    this.idType,
    this.idDocIDOnChanged,
    this.idDocTypeOnChanged,
    this.kraNumIDOnChanged,
    this.kraNumOnChanged,
    this.idNumberOnChanged,
    this.showId = true,
    this.showKra = true,
  }) : super(key: key);

  final IdDocIDOnChanged? idDocIDOnChanged;
  final IdDocTypeOnChanged? idDocTypeOnChanged;
  final IdNumberOnChanged? idNumberOnChanged;
  final String? idType;
  final KraNumIDOnChanged? kraNumIDOnChanged;
  final KraNumOnChanged? kraNumOnChanged;
  final bool showId;
  final bool showKra;

  @override
  _KYCIdDocAndKraPINState createState() => _KYCIdDocAndKraPINState();
}

class _KYCIdDocAndKraPINState extends State<KYCIdDocAndKraPIN> {
  String? selectedIdType;

  @override
  void initState() {
    selectedIdType = widget.idType;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (widget.showId) ...<Widget>[
          Text(
            idDocumentDetailsText,
            style: TextThemes.normalSize16Text(Colors.black87),
          ),
          mediumVerticalSizedBox,
          SILSelectOptionField(
            dropDownInputKey: kycIdOptions,
            hintText: selectIdLabel,
            options: identificationOptions,
            value: getIdType(idType: selectedIdType!, userString: true),
            onChanged: (String? val) {
              setState(() {
                selectedIdType = val;
              });
              widget.idDocTypeOnChanged!(
                getIdType(idType: val!, userString: false),
              );
            },
          ),
          mediumVerticalSizedBox,
          SILFormTextField(
            key: kycIdNumber,
            labelText:
                idLabel(getIdType(idType: selectedIdType!, userString: true)),
            hintText:
                idLabel(getIdType(idType: selectedIdType!, userString: true)),
            borderColor: Colors.grey.withOpacity(0.6),
            textStyle: TextThemes.normalSize16Text(),
            validator: (String? value) {
              if (value!.isEmpty) {
                return idRequired;
              }
              return null;
            },
            onChanged: widget.idNumberOnChanged,
          ),
          mediumVerticalSizedBox,
          FileManager(
            galleryImageKey: kycIdOptionUpload,
            onChanged: widget.idDocIDOnChanged!,
            fileTitle: getIdType(idType: selectedIdType!, userString: true),
            uploadAndReturnIdFunction: uploadFileAndGetId,
            platformLoader: const SILPlatformLoader(),
          ),
          size40VerticalSizedBox,
        ],
        if (widget.showKra) ...<Widget>[
          Text(
            kraPINText,
            style: TextThemes.normalSize16Text(Colors.black87),
          ),
          mediumVerticalSizedBox,
          SILFormTextField(
            key: kycKraNumber,
            labelText: kraLabel,
            hintText: kraHintText,
            borderColor: Colors.grey.withOpacity(0.6),
            textStyle: TextThemes.normalSize16Text(),
            validator: (String? value) {
              if (value.toString().isEmpty) {
                return kraRequired;
              }
              return null;
            },
            onChanged: widget.kraNumOnChanged,
          ),
          mediumVerticalSizedBox,
          FileManager(
            galleryImageKey: kycKraNumberUpload,
            onChanged: widget.kraNumIDOnChanged!,
            fileTitle: kraTitle,
            uploadAndReturnIdFunction: uploadFileAndGetId,
            platformLoader: const SILPlatformLoader(),
          ),
        ]
      ],
    );
  }
}
