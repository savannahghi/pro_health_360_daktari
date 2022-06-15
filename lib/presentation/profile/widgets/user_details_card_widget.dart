// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_svg/flutter_svg.dart';
// Project imports:
import 'package:mycarehubpro/application/core/theme/app_themes.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_asset_strings.dart';

// Project imports:

class UserDetailsCard extends StatelessWidget {
  /// [UserDetailsCard] is a shared widget used in [UserProfilePage]
  ///
  /// It takes in required [name], [profession], [clinicName], [age], [phoneNumber],
  ///  [emailAddress], [licenseNumber] and [gender] parameters
  ///
  const UserDetailsCard({
    required this.name,
    required this.profession,
    required this.clinicName,
    required this.phoneNumber,
    required this.gender,
    required this.licenseNumber,
    required this.defaultHospitalName,
    required this.nickName,
  });

  final String clinicName;
  final Gender gender;
  final String licenseNumber;
  final String name;
  final String phoneNumber;
  final String profession;
  final String defaultHospitalName;
  final String nickName;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: AppColors.userDetailsCardBackgroundColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Stack(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  name,
                  style: veryBoldSize16Text(Colors.white),
                ),
                smallVerticalSizedBox,
                Text(
                  'Nickname: $nickName',
                  style: boldSize16Text(Colors.white),
                ),
                smallVerticalSizedBox,
                Text(
                  profession,
                  style: boldSize16Text(Colors.white),
                ),
                smallVerticalSizedBox,
                Text(
                  defaultHospitalName,
                  style: lightSize16Text(Colors.white),
                ),
                largeVerticalSizedBox,
                Row(
                  children: <Widget>[
                    SvgPicture.asset(
                      phoneIconSvgPath,
                      color: Colors.white,
                      width: 18,
                    ),
                    size15HorizontalSizedBox,
                    Text(
                      phoneNumber,
                      style: boldSize14Text(Colors.white),
                    ),
                  ],
                ),
                size15VerticalSizedBox,
                Row(
                  children: <Widget>[
                    SvgPicture.asset(
                      profileIconSvgPath,
                      color: Colors.white,
                      width: 20,
                    ),
                    size15HorizontalSizedBox,
                    Text(
                      gender.name,
                      style: boldSize14Text(Colors.white),
                    ),
                  ],
                ),
                size15VerticalSizedBox,
                Row(
                  children: <Widget>[
                    SvgPicture.asset(
                      certificateIconSvgPath,
                      color: Colors.white,
                      width: 20,
                    ),
                    size15HorizontalSizedBox,
                    Text(
                      licenseNumber,
                      style: boldSize14Text(Colors.white),
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
