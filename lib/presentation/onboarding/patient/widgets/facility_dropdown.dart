// Flutter imports:

import 'package:flutter/material.dart';
// Project imports:
import 'package:healthcloud/application/core/theme/app_themes.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:healthcloud/domain/core/value_objects/app_widget_keys.dart';
import 'package:healthcloud/presentation/surveys/widgets/selection_option_field.dart';
import 'package:misc_utilities/misc.dart';
// Package imports:
import 'package:shared_themes/spaces.dart';

class FacilityDropdown extends StatelessWidget {
  const FacilityDropdown({
    required this.label,
  });

  final String label;

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
          options: const <String>['Nairobi', 'Nakuru', 'Mombasa', 'Kisumu'],
          color: const Color(0xFFF9F2FE),
          onChanged: (String? v) {
            ScaffoldMessenger.of(context).showSnackBar(
              snackbar(content: comingSoonText),
            );
          },
        ),
      ],
    );
  }
}
