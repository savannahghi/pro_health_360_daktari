import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ReachOutChannelWidget extends StatelessWidget {
  const ReachOutChannelWidget({
    Key? key,
    required this.description,
    required this.iconSvgUrl,
    this.onTapCallback,
  }) : super(key: key);

  final String description;
  final String iconSvgUrl;
  final VoidCallback? onTapCallback;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width / 3.6;
    return GestureDetector(
      onTap: onTapCallback,
      child: Container(
        width: width,
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor.withOpacity(0.14),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: <Widget>[
            SvgPicture.asset(
              iconSvgUrl,
              color: Theme.of(context).primaryColor,
              width: width - 50,
            ),
            smallVerticalSizedBox,
            Text(
              description,
              style: normalSize15Text(Theme.of(context).primaryColor)
                  .copyWith(fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}
