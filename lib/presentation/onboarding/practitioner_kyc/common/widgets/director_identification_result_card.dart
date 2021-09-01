import 'package:healthcloud/domain/core/entities/identification.dart';
import 'package:healthcloud/domain/core/value_objects/app_types.dart';
import 'package:healthcloud/domain/core/value_objects/app_widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';

class DirectorIdentificationCard extends StatelessWidget {
  final Identification identification;
  final RemoveIdentificationDoc removeDocumentFunc;

  const DirectorIdentificationCard({
    Key? key,
    required this.identification,
    required this.removeDocumentFunc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: patientSearchBorderColor),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(
                Icons.file_copy,
                size: 40,
                color: Theme.of(context).primaryColor.withOpacity(0.8),
              ),
              size15HorizontalSizedBox,
              Text(
                identification.docNumber,
                style: TextThemes.boldSize16Text(),
              ),
              smallHorizontalSizedBox,
            ],
          ),
          IconButton(
            key: kycRemoveDirectorIdentificationDocumentKey,
            icon: Icon(
              Icons.delete,
              color: Colors.red.withOpacity(0.9),
            ),
            onPressed: () {
              removeDocumentFunc(
                idNumber: identification.docNumber,
              );
            },
          ),
        ],
      ),
    );
  }
}
