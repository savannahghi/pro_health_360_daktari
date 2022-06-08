import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mycarehubpro/application/core/theme/app_themes.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_asset_strings.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';
import 'package:mycarehubpro/presentation/router/routes.dart';

import 'package:shared_themes/spaces.dart';

class EmptyConversationsWidget extends StatelessWidget {
  const EmptyConversationsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SvgPicture.asset(noChatImage),
            smallVerticalSizedBox,
            Text(
              noConversationsAvailable,
              style: veryBoldSize20Text(),
            ),
            size15VerticalSizedBox,
            Text(
              noConversationsDescription,
              style: normalSize16Text(AppColors.greyTextColor),
              textAlign: TextAlign.center,
            ),
            mediumVerticalSizedBox,
            SizedBox(
              height: 48,
              width: double.infinity,
              child: MyAfyaHubPrimaryButton(
                text: viewInvites,
                onPressed: () =>
                    Navigator.of(context).pushNamed(AppRoutes.groupInvitesPage),
              ),
            ),
            size15VerticalSizedBox,
            Text(
              orString,
              style: normalSize16Text(AppColors.greyTextColor),
              textAlign: TextAlign.center,
            ),
            size15VerticalSizedBox,
            SizedBox(
              height: 48,
              width: double.infinity,
              child: MyAfyaHubNoBorderButton(
                text: createGroup,
                onPressed: () =>
                    Navigator.of(context).pushNamed(AppRoutes.addNewGroupPage),
              ),
            )
          ],
        ),
      ),
    );
  }
}
