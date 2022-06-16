// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// Project imports:
import 'package:mycarehubpro/application/core/theme/app_themes.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_asset_strings.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_widget_keys.dart';
import 'package:mycarehubpro/presentation/contact_admin/widgets/contact_admin_card.dart';
import 'package:mycarehubpro/presentation/core/app_bar/custom_app_bar.dart';

class ContactAdminPage extends StatelessWidget {
  const ContactAdminPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: contactAdmin,
        showNotificationIcon: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
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
            // TODO: revert and change to a real number
            // const ContactAdminCard(
            //   title: callYourAdmin,
            //   message: tapBelowToCallAdmin,
            //   adminPhoneNumber: '+254712345678',
            //   buttonKey: callAdminKey,
            // ),
            const SizedBox(height: 20),
            const ContactAdminCard(
              title: emailYourAdmin,
              message: tapBelowToEmailAdmin,
              adminEmail: adminEmail,
              buttonKey: emailAdminKey,
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
