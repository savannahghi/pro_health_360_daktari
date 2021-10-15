// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:bewell_pro_core/domain/core/value_objects/numbers_constants.dart';
import 'package:misc_utilities/misc.dart';
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';
import 'package:shared_ui_components/buttons.dart';

// Project imports:
import 'package:healthcloud/domain/core/entities/identification.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:healthcloud/domain/core/value_objects/app_types.dart';
import 'package:healthcloud/domain/core/value_objects/app_widget_keys.dart';
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/common/widgets/director_identification_result_card.dart';
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/common/widgets/kyc_id_doc_and_kra.dart';

class KYCDirectorIdentifications extends StatefulWidget {
  final List<Identification> docs;
  final Function directorIDsDocOnChanged;
  final RemoveIdentificationDoc removeIdentificationFunc;

  const KYCDirectorIdentifications({
    Key? key,
    required this.docs,
    required this.directorIDsDocOnChanged,
    required this.removeIdentificationFunc,
  }) : super(key: key);
  @override
  _KYCDirectorIdentificationsState createState() =>
      _KYCDirectorIdentificationsState();
}

class _KYCDirectorIdentificationsState
    extends State<KYCDirectorIdentifications> {
  bool showWarningMsg = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          addDirectorIDs,
          style: TextThemes.normalSize16Text().copyWith(height: 1.3),
        ),
        mediumVerticalSizedBox,
        for (Identification document in widget.docs)
          DirectorIdentificationCard(
            identification: document,
            removeDocumentFunc: widget.removeIdentificationFunc,
          ),
        mediumVerticalSizedBox,
        SizedBox(
          width: double.infinity,
          height: number48,
          child: SILSecondaryButton(
            buttonKey: kycAddDirectorIdentificationButtonKey,
            onPressed: () async {
              dynamic result = await _addDirectorIDBottomSheet(context);
              if (result == null) {
                return;
              }
              result = result as Map<String, String>;
              widget.directorIDsDocOnChanged(result);
            },
            text: tapToAddDoc,
          ),
        ),
        mediumVerticalSizedBox,
      ],
    );
  }

  Future<dynamic> _addDirectorIDBottomSheet(BuildContext context) async {
    String? idNumber;
    String idType = nationalIdText;
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
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  mediumVerticalSizedBox,
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      addDirectorIDs,
                      style: TextThemes.boldSize18Text(healthcloudPrimaryColor),
                    ),
                  ),
                  smallVerticalSizedBox,
                  Divider(thickness: 0.5, color: Colors.grey.withOpacity(0.5)),
                  smallVerticalSizedBox,
                  KYCIdDocAndKraPIN(
                    showKra: false,
                    idType: getIdType(idType: idType, userString: true),
                    idDocTypeOnChanged: (String? v) {
                      idType = v.toString();
                    },
                    idNumberOnChanged: (String val) {
                      idNumber = val;
                    },
                    idDocIDOnChanged: (dynamic value) {
                      docID = value.toString();
                    },
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
                      buttonKey:
                          kycBottomSheetAddDirecorIdentificationButtonKey,
                      onPressed: () {
                        if (idNumber == null || docID == null) {
                          sheetSetState(() {
                            showWarningMsg = true;
                          });
                          return;
                        }
                        sheetSetState(() {
                          showWarningMsg = false;
                        });
                        Navigator.pop(context, <String, String>{
                          'idNumber': idNumber!,
                          'idType': idType,
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
          },
        );
      },
    );
  }
}
