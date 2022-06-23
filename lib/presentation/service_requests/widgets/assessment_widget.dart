import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';

class AssessmentWidget extends StatelessWidget {
  const AssessmentWidget({
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10.0),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(50)),
        color: AppColors.primaryColor.withOpacity(0.3),
      ),
      child: Text(
        title,
        style: boldSize13Text(AppColors.primaryColor),
      ),
    );
  }
}
