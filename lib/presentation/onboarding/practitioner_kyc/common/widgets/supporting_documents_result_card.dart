// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';

// Project imports:
import 'package:healthcloud/domain/core/value_objects/app_types.dart';

class SupportingDocumentsResultCard extends StatelessWidget {
  const SupportingDocumentsResultCard({
    Key? key,
    required this.documentDescription,
    required this.documentTitle,
    required this.uploadID,
    required this.removeDocFunc,
  }) : super(key: key);

  final String documentDescription;
  final String documentTitle;
  final RemoveDocFunc removeDocFunc;
  final String uploadID;

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
          Icon(
            Icons.file_copy,
            size: 40,
            color: Theme.of(context).primaryColor.withOpacity(0.8),
          ),
          size15HorizontalSizedBox,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  documentTitle,
                  style: TextThemes.heavySize14Text(),
                ),
                verySmallVerticalSizedBox,
                Text(
                  documentDescription,
                  style: TextThemes.normalSize13Text().copyWith(height: 1.3),
                ),
              ],
            ),
          ),
          smallHorizontalSizedBox,
          IconButton(
            icon: Icon(
              Icons.delete,
              color: Colors.red.withOpacity(0.9),
            ),
            onPressed: () {
              removeDocFunc(
                  title: documentTitle, description: documentDescription);
            },
          ),
        ],
      ),
    );
  }
}
