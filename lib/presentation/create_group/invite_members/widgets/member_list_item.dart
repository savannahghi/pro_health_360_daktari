import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myharehubpro/application/core/theme/app_themes.dart';
import 'package:myharehubpro/domain/core/value_objects/app_asset_strings.dart';
import 'package:shared_themes/spaces.dart';

class MemberListItem extends StatefulWidget {
  const MemberListItem({
    required this.username,
    required this.onClicked,
    this.isSelected = false,
  });

  final void Function(bool value) onClicked;
  final String username;
  final bool isSelected;

  @override
  State<MemberListItem> createState() => _MemberListItemState();
}

class _MemberListItemState extends State<MemberListItem> {
  bool isSelected = false;

  @override
  void initState() {
    isSelected = widget.isSelected;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
        widget.onClicked.call(isSelected);
      },
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
                      widget.username.trim()[0].toUpperCase(),
                      style: boldSize14Text(AppColors.primaryColor),
                    ),
                  ),
                ),
                smallHorizontalSizedBox,
                Text(
                  widget.username,
                  style: boldSize12Text(),
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
