// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// Project imports:
import 'package:healthcloud/application/core/theme/app_themes.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:healthcloud/domain/core/value_objects/app_widget_keys.dart';
import 'package:shared_themes/spaces.dart';

class ShareClassificationWidget extends StatelessWidget {
  const ShareClassificationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            shareToString,
            textAlign: TextAlign.center,
            style: normalSize14Text().copyWith(
              color: AppColors.greyTextColor,
            ),
          ),
        ),
        smallVerticalSizedBox,
        Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              color: Colors.white.withOpacity(0.3),
            ),
          ),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    bandString,
                    textAlign: TextAlign.center,
                    style: normalSize16Text().copyWith(
                      color: AppColors.dodgerBlueColor,
                    ),
                  ),
                  smallHorizontalSizedBox,
                  Text(
                    chooseOneString,
                    textAlign: TextAlign.center,
                    style: normalSize12Text().copyWith(
                      color: AppColors.lightGreyColor,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
              smallVerticalSizedBox,
              SelectOptionField(
                dropDownInputKey: bandSelectOptionFieldKey,
                value: 'Female',
                options: const <String>['Male', 'Female', UNKNOWN],
                color: AppColors.galleryColor,
                onChanged: (String? v) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(snackbar(content: comingSoonText));
                },
              ),
              mediumVerticalSizedBox,
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  ageString,
                  textAlign: TextAlign.center,
                  style: normalSize16Text().copyWith(
                    color: AppColors.dodgerBlueColor,
                  ),
                ),
              ),
              smallVerticalSizedBox,
              SelectOptionField(
                dropDownInputKey: ageSelectOptionFieldKey,
                value: '16-20yrs',
                options: const <String>['16-20yrs', '20-25yrs', '25-30yrs'],
                color: AppColors.galleryColor,
                onChanged: (String? v) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(snackbar(content: comingSoonText));
                },
              ),
              mediumVerticalSizedBox,
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  locationString,
                  textAlign: TextAlign.center,
                  style: normalSize16Text().copyWith(
                    color: AppColors.dodgerBlueColor,
                  ),
                ),
              ),
              smallVerticalSizedBox,
              SelectOptionField(
                dropDownInputKey: locationSelectOptionFieldKey,
                value: 'Ruiru',
                options: const <String>['Ruiru', 'Thika', 'Nairobi'],
                color: AppColors.galleryColor,
                onChanged: (String? v) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(snackbar(content: comingSoonText));
                },
              ),
              mediumVerticalSizedBox,
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  clinicString,
                  textAlign: TextAlign.center,
                  style: normalSize16Text().copyWith(
                    color: AppColors.dodgerBlueColor,
                  ),
                ),
              ),
              smallVerticalSizedBox,
              SelectOptionField(
                dropDownInputKey: clinicSelectOptionFieldKey,
                value: 'Ruiru Level iv Hospital',
                options: const <String>[
                  'Ruiru Level iv Hospital',
                  'Thika Level iv Hospital',
                  'Nairobi Level iv Hospital'
                ],
                color: AppColors.galleryColor,
                onChanged: (String? v) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(snackbar(content: comingSoonText));
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
