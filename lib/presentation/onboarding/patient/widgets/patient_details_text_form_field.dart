import 'package:flutter/material.dart';
import 'package:healthcloud/application/core/theme/app_themes.dart';
import 'package:shared_themes/spaces.dart';

class PatientDetailsTextFormField extends StatelessWidget {
  const PatientDetailsTextFormField({
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
        TextFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: const Color(0xFFF9F2FE),
            contentPadding: const EdgeInsets.all(8.0),
          ),
          style: const TextStyle(color: AppColors.greyTextColor),
        ),
      ],
    );
  }
}
