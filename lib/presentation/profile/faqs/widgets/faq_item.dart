import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:mycarehubpro/application/core/theme/app_themes.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/spaces.dart';

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
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                faqContent.title ?? UNKNOWN,
                style: const TextStyle(
                  color: black,
                  fontSize: 14.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
              smallVerticalSizedBox,
              const Text(
                tapToLearnMoreText,
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 12.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
