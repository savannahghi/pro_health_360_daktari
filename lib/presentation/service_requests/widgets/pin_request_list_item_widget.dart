// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:shared_themes/spaces.dart';

// Project imports:
import 'package:myharehubpro/application/core/theme/app_themes.dart';
import 'package:myharehubpro/domain/core/value_objects/app_strings.dart';
import 'package:myharehubpro/domain/core/value_objects/app_widget_keys.dart';

class PINRequestListItem extends StatefulWidget {
  /// [PINRequestListItem] is a shared widget used in [PINResetRequestsPage]
  ///
  ///It takes in two required [clientName] and [phoneNumber] parameters
  ///and [approvalStatus] as an optional parameter
  const PINRequestListItem({
    required this.clientName,
    required this.phoneNumber,
    this.approvalStatus,
  });
  final String clientName;
  final String phoneNumber;
  final bool? approvalStatus;

  @override
  State<PINRequestListItem> createState() => _PINRequestListItemState();
}

class _PINRequestListItemState extends State<PINRequestListItem> {
  late bool _checked = widget.approvalStatus ?? false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Wrap(
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 15,
              width: 15,
              child: Checkbox(
                key: pinRequestApproveCheckboxKey,
                value: _checked,
                checkColor: AppColors.malachiteColor,
                activeColor: AppColors.malachiteColor,
                onChanged: (bool? value) {
                  setState(() {
                    if (!_checked) _checked = value!;
                  });
                },
              ),
            ),
            smallHorizontalSizedBox,
            Text(
              widget.clientName,
              style: boldSize14Text(AppColors.greyTextColor),
            ),
            smallHorizontalSizedBox,
            Text(
              widget.phoneNumber,
              style: boldSize14Text(
                AppColors.greyTextColor,
              ),
            ),
            smallHorizontalSizedBox,
            GestureDetector(
              key: pinRequestApproveButtonKey,
              onTap: () {
                setState(() {
                  if (!_checked) _checked = true;
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                decoration: BoxDecoration(
                  color: AppColors.malachiteColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  approveString,
                  style: boldSize13Text(
                    Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
        smallVerticalSizedBox,
      ],
    );
  }
}
