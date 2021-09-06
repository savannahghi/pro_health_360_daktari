import 'package:healthcloud/domain/core/entities/supporting_documents.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:healthcloud/domain/core/value_objects/app_types.dart';
import 'package:healthcloud/domain/core/value_objects/app_widget_keys.dart';
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/common/kyc_utils.dart';
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/common/widgets/supporting_documents_result_card.dart';
import 'package:bewell_pro_core/domain/core/value_objects/numbers_constants.dart';
import 'package:flutter/material.dart';
import 'package:misc_utilities/file_manager.dart';
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';
import 'package:shared_ui_components/buttons.dart';
import 'package:shared_ui_components/inputs.dart';
import 'package:shared_ui_components/platform_loader.dart';

class KYCSupportingDocuments extends StatefulWidget {
  const KYCSupportingDocuments({
    Key? key,
    required this.docs,
    required this.supportingDocOnChanged,
    required this.removeDocumentFunc,
  }) : super(key: key);

  final List<SupportingDocument> docs;
  final RemoveDocFunc removeDocumentFunc;
  final Function supportingDocOnChanged;

  @override
  _KYCSupportingDocumentsState createState() => _KYCSupportingDocumentsState();
}

class _KYCSupportingDocumentsState extends State<KYCSupportingDocuments> {
  bool showWarningMsg = false;

  Future<dynamic> _addSupportingDocBottomSheet(BuildContext context) async {
    String? title;
    String? description;
    String? docID;
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext bc) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter sheetSetState) {
          return Container(
            padding: const EdgeInsets.all(15),
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15)),
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    addSupportingDocs,
                    style: TextThemes.boldSize18Text(healthcloudPrimaryColor),
                  ),
                ),
                smallVerticalSizedBox,
                Divider(thickness: 0.5, color: Colors.grey.withOpacity(0.5)),
                smallVerticalSizedBox,
                SILFormTextField(
                  key: kycSupportingDocumentTitleKey,
                  labelText: documentTitle,
                  hintText: documentTitleHint,
                  borderColor: Colors.grey.withOpacity(0.6),
                  textStyle: TextThemes.normalSize16Text(),
                  onChanged: (String val) => title = val,
                ),
                mediumVerticalSizedBox,
                SILFormTextField(
                  key: kycSupportingDocumentDescriptionKey,
                  maxLines: 2,
                  labelText: documentDescription,
                  hintText: documentDescriptionHint,
                  borderColor: Colors.grey.withOpacity(0.6),
                  textStyle: TextThemes.normalSize16Text(),
                  onChanged: (String val) => description = val,
                ),
                mediumVerticalSizedBox,
                FileManager(
                  onChanged: (String? val) => docID = val,
                  galleryImageKey: kycSupportingDocumentUploadKey,
                  fileTitle: documentUpload,
                  uploadAndReturnIdFunction: uploadFileAndGetId,
                  platformLoader: const SILPlatformLoader(),
                ),
                mediumVerticalSizedBox,
                if (showWarningMsg) ...<Widget>[
                  Text(
                    allFieldsRequired,
                    style: TextThemes.normalSize15Text(Colors.red),
                  ),
                  smallVerticalSizedBox,
                ],
                SizedBox(
                  width: double.infinity,
                  height: number48,
                  child: SILPrimaryButton(
                    onPressed: () {
                      if (title == null ||
                          description == null ||
                          docID == null) {
                        sheetSetState(() {
                          showWarningMsg = true;
                        });
                        return;
                      }
                      sheetSetState(() {
                        showWarningMsg = false;
                      });
                      Navigator.pop(context, <String, String>{
                        'title': title!,
                        'description': description!,
                        'docID': docID!,
                      });
                    },
                    text: doneAddingDoc,
                    customRadius: 5,
                  ),
                )
              ],
            ),
          );
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          addSupportingDocs,
          style: TextThemes.normalSize16Text().copyWith(height: 1.3),
        ),
        mediumVerticalSizedBox,
        for (SupportingDocument document in widget.docs)
          SupportingDocumentsResultCard(
            documentDescription: document.description,
            documentTitle: document.title,
            uploadID: document.upload,
            removeDocFunc: widget.removeDocumentFunc,
          ),
        mediumVerticalSizedBox,
        SizedBox(
          width: double.infinity,
          height: number48,
          child: SILSecondaryButton(
            buttonColor: healthcloudPrimaryColor,
            borderColor: healthcloudPrimaryColor,
            buttonKey: kycAddSupportingDocumentButtonKey,
            onPressed: () async {
              dynamic result = await _addSupportingDocBottomSheet(context);
              if (result == null) {
                return;
              }
              result = result as Map<String, String>;
              widget.supportingDocOnChanged(result);
            },
            text: tapToAddDoc,
          ),
        ),
        mediumVerticalSizedBox,
      ],
    );
  }
}
