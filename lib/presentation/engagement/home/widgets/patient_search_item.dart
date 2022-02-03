// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';

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
            style: normalSize12Text(),
          ),
          Text(
            'CCC No. $cccNumber',
            style: normalSize12Text(),
          ),
        ],
      ),
    );
  }
}
