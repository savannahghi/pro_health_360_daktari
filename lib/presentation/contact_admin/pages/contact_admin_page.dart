// Flutter imports:
import 'package:flutter/material.dart';
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Project imports:
import 'package:healthcloud/application/core/theme/app_themes.dart';
import 'package:healthcloud/domain/core/value_objects/app_asset_strings.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:healthcloud/domain/core/value_objects/app_widget_keys.dart';
import 'package:healthcloud/presentation/contact_admin/widgets/contact_admin_card.dart';
import 'package:healthcloud/presentation/core/app_bar/custom_app_bar.dart';

class ContactAdminPage extends StatelessWidget {
  const ContactAdminPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: contactAdmin),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: ListView(
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              child: SvgPicture.asset(
                contactAdminSvg,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              doYouNeedHelpString,
              style: veryBoldSize16Text(AppColors.lightBlackTextColor),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              contactOurAdmins,
              style: normalSize14Text(darkGreyTextColor),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const ContactAdminCard(
              title: callYourAdmin,
              message: tapBelowToCallAdmin,
              adminPhoneNumber: '+254 712 345 678',
              buttonKey: callAdminKey,
            ),
            const SizedBox(height: 20),
            const ContactAdminCard(
              title: emailYourAdmin,
              message: tapBelowToEmailAdmin,
              adminEmail: 'admin@mycarehub.com',
              buttonKey: emailAdminKey,
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
