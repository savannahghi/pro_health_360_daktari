import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/domain/core/entities/core/facility.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_asset_strings.dart';

class FacilityListItem extends StatelessWidget {
  const FacilityListItem({
    required this.facility,
    required this.onClicked,
    this.isSelected = false,
  });

  final Facility facility;
  final VoidCallback onClicked;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClicked,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  height: 38,
                  width: 38,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.galleryColor,
                  ),
                  child: Center(
                    child: Text(
                      facility.name!.trim()[0].toUpperCase(),
                      style: boldSize14Text(AppColors.primaryColor),
                    ),
                  ),
                ),
                smallHorizontalSizedBox,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      facility.name!,
                      style: boldSize14Text().copyWith(),
                    ),
                    if (facility.code != null)
                      Text(
                        facility.code.toString(),
                        style: boldSize12Text().copyWith(
                          color: greyTextColor.withOpacity(0.6),
                          fontSize: 10,
                        ),
                      ),
                  ],
                ),
              ],
            ),
            if (isSelected)
              SvgPicture.asset(doneIconSvgPath)
            else
              const SizedBox()
          ],
        ),
      ),
    );
  }
}
