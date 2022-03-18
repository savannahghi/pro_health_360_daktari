import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:mycarehubpro/application/core/theme/app_themes.dart';
import 'package:mycarehubpro/domain/core/entities/search_user/search_user_response.dart';
import 'package:mycarehubpro/presentation/router/routes.dart';
import 'package:shared_themes/spaces.dart';

class SearchUserItem extends StatefulWidget {
  const SearchUserItem({
    required this.searchUserResponse,
    this.isCCCNumber = false,
  });

  final SearchUserResponse searchUserResponse;
  final bool isCCCNumber;

  @override
  State<SearchUserItem> createState() => _SearchUserItemState();
}

class _SearchUserItemState extends State<SearchUserItem> {
  bool isSelected = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final String username = widget.searchUserResponse.user?.userName ?? UNKNOWN;
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          AppRoutes.searchDetailViewPage,
          arguments: widget.isCCCNumber
              ? <String, dynamic>{
                  'searchUserResponse': widget.searchUserResponse,
                  'isClient': true,
                }
              : <String, dynamic>{
                  'searchUserResponse': widget.searchUserResponse,
                  'isClient': false,
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
                      widget.isCCCNumber
                          ? 'CCC#: ${widget.searchUserResponse.clientCCCNumber}'
                          : widget.searchUserResponse.staffNumber!,
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
