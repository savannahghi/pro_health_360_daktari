import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:myharehubpro/application/core/theme/app_themes.dart';
import 'package:myharehubpro/domain/core/value_objects/app_strings.dart';
import 'package:shared_themes/colors.dart';

class FAQItem extends StatelessWidget {
  ///
  /// [FaqItem ] used in [ProfileFaqsPage] to list Frequently Asked Questions.
  ///
  const FAQItem({
    required this.faqContent,
  });

  final FAQContent faqContent;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 5,
        bottom: 5,
      ),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: white,
        ),
        child: ListTile(
          dense: true,
          title: Text(
            faqContent.title ?? UNKNOWN,
            style: const TextStyle(
              color: black,
              fontSize: 14.0,
              fontWeight: FontWeight.normal,
            ),
          ),
          subtitle: const Text(
            tapToLearnMoreText,
            style: TextStyle(
              color: AppColors.primaryColor,
              fontSize: 12.0,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
