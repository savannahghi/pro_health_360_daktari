// Flutter imports:

import 'package:flutter/material.dart';
// Project imports:
import 'package:healthcloud/application/core/theme/app_themes.dart';
import 'package:healthcloud/presentation/surveys/widgets/selection_option_field.dart';

class FacilityDropdown extends StatelessWidget {
  const FacilityDropdown({
    required this.label,
    required this.stream,
    required this.dropdownInputKey,
    this.onChanged,
  });

  final String label;
  final Stream<String> stream;
  final Key dropdownInputKey;
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
        const SizedBox(height: 10),
        // TODO (John): Fetch facilites from backend
        StreamBuilder<String>(
          stream: stream,
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            final String? data = snapshot.data;
            return SelectOptionField(
              dropDownInputKey: dropdownInputKey,
              value: data ?? 'Nairobi',
              options: const <String>['Nairobi', 'Nakuru', 'Mombasa', 'Kisumu'],
              onChanged: onChanged,
            );
          },
        ),
      ],
    );
  }
}
