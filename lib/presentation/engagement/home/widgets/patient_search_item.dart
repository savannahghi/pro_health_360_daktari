// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
// Project imports
import 'package:shared_themes/text_themes.dart';

class PatientSearchItem extends StatelessWidget {
  const PatientSearchItem({
    required this.username,
    required this.cccNumber,
  });

  final String username;
  final String cccNumber;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            username,
            style: TextThemes.normalSize12Text(),
          ),
          Text(
            'CCC No. $cccNumber',
            style: TextThemes.normalSize12Text(),
          ),
        ],
      ),
    );
  }
}
