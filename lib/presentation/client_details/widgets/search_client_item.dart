import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:mycarehubpro/application/core/theme/app_themes.dart';
import 'package:mycarehubpro/domain/core/entities/profile/client_response.dart';
import 'package:mycarehubpro/presentation/router/routes.dart';
import 'package:shared_themes/spaces.dart';

class SearchClientItem extends StatefulWidget {
  const SearchClientItem({
    required this.clientDetails,
    required this.cccNumber,
  });

  final ClientResponse clientDetails;
  final String cccNumber;

  @override
  State<SearchClientItem> createState() => _SearchClientItemState();
}

class _SearchClientItemState extends State<SearchClientItem> {
  bool isSelected = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final String username = widget.clientDetails.userName ?? UNKNOWN;
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          AppRoutes.searchDetailViewPage,
          arguments: <String, dynamic>{
            'cccNumber': widget.cccNumber,
            'clientResponse': widget.clientDetails,
          },
        );
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
                      username.trim()[0].toUpperCase(),
                      style: boldSize14Text(AppColors.primaryColor),
                    ),
                  ),
                ),
                smallHorizontalSizedBox,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      username,
                      style: boldSize12Text(),
                    ),
                    Text(
                      'CCC#: ${widget.cccNumber}',
                      style: normalSize12Text(AppColors.greyTextColor),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
