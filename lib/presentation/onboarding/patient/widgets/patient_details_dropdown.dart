// Flutter imports:

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
// Project imports:
import 'package:myharehubpro/application/core/theme/app_themes.dart';
import 'package:myharehubpro/domain/core/value_objects/app_widget_keys.dart';
import 'package:shared_themes/spaces.dart';

class PatientDetailsDropdown extends StatelessWidget {
  const PatientDetailsDropdown({
    required this.label,
    required this.options,
    this.onChanged,
  });

  final String label;
  final List<String> options;
  final ValueChanged<String?>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.greyTextColor,
            ),
          ),
        ),
        smallVerticalSizedBox,
        SelectOptionField(
          dropDownInputKey: facilitySelectOptionFieldKey,
          value: 'Nairobi',
          options: options,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
