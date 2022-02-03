// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_themes/spaces.dart';

// Project imports:
import 'package:healthcloud/application/core/theme/app_themes.dart';
import 'package:healthcloud/domain/core/value_objects/app_asset_strings.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:healthcloud/domain/core/value_objects/app_widget_keys.dart';

class ClientDetailsCard extends StatefulWidget {
  /// [ClientDetailsCard] is a shared widget used in [ClientHealth  Page]
  ///
  /// It takes in required [userInitials], [name], [userCCCNumber], [age], [phoneNumber]
  /// and [home] parameters
  ///
  /// The [onTapInvite], [onTapViewProfile] and [onTapEditUserProfile] are VoidCallBacks used
  /// to add functionality to Invite to MyAfyaHub, ViewProfile and Edit buttons respectively
  const ClientDetailsCard({
    Key? key,
    required this.userInitials,
    required this.cccNumber,
    required this.age,
    required this.phoneNumber,
    required this.home,
    required this.name,
    this.onTapInvite,
    this.onTapViewProfile,
    this.onTapEditUserProfile,
  }) : super(key: key);
  final String name;
  final String userInitials;
  final String cccNumber;
  final String age;
  final String phoneNumber;
  final VoidCallback? onTapInvite;
  final VoidCallback? onTapViewProfile;
  final VoidCallback? onTapEditUserProfile;

  final String home;

  @override
  State<ClientDetailsCard> createState() => _ClientDetailsCardState();
}

class _ClientDetailsCardState extends State<ClientDetailsCard> {
  late bool viewProfile = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: AppColors.clientDetailsCardBackgroundColor,
      ),
      child: Stack(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(10.0),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.diaryListCardColor,
                ),
                child: Text(
                  widget.userInitials,
                  style: const TextStyle(
                    fontSize: 22,
                    color: AppColors.secondaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              smallHorizontalSizedBox,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  smallVerticalSizedBox,
                  Text(
                    formatCCCNumber(widget.cccNumber),
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  smallVerticalSizedBox,
                  Text(
                    formatAge(widget.age),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  largeVerticalSizedBox,
                  Row(
                    children: <Widget>[
                      SvgPicture.asset(
                        phoneCallIcon,
                        color: Colors.white,
                        width: 14,
                        height: 18,
                      ),
                      size15HorizontalSizedBox,
                      Text(
                        widget.phoneNumber,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  size15VerticalSizedBox,
                  Row(
                    children: <Widget>[
                      SvgPicture.asset(
                        homeLocationIcon,
                        color: Colors.white,
                        width: 15,
                        height: 15,
                      ),
                      size15HorizontalSizedBox,
                      Text(
                        widget.home,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  mediumVerticalSizedBox,
                  Wrap(
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        key: inviteButtonKey,
                        onTap: widget.onTapInvite,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 8,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                            inviteToMyAfyaHubString,
                            style: boldSize13Text(
                              Colors.white,
                            ),
                          ),
                        ),
                      ),
                      smallHorizontalSizedBox,
                      Visibility(
                        visible: !viewProfile,
                        child: GestureDetector(
                          key: viewProfileButtonKey,
                          onTap: () {
                            setState(() {
                              widget.onTapViewProfile!();
                              viewProfile = true;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 8,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text(
                              viewProfileString,
                              style: boldSize13Text(
                                Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            key: editUserProfileButtonKey,
            top: 6,
            right: 6,
            child: GestureDetector(
              onTap: widget.onTapEditUserProfile,
              child: SvgPicture.asset(editProfileIconSvg),
            ),
          ),
        ],
      ),
    );
  }
}
