// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/flutter_svg.dart';

// Project imports:
import 'package:myharehubpro/application/core/theme/app_themes.dart';
import 'package:myharehubpro/domain/core/value_objects/app_asset_strings.dart';
import 'package:myharehubpro/domain/core/value_objects/app_strings.dart';
import 'package:myharehubpro/presentation/core/app_bar/custom_app_bar.dart';

class ContentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: contentPageTitle,
        showNotificationIcon: true,
      ),
      backgroundColor: AppColors.lightGreyBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SvgPicture.asset(
              contentPageImage,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                contentPageDescription,
                textAlign: TextAlign.center,
                style: normalSize16Text(),
              ),
            ),
            GestureDetector(
              onTap: () {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    const SnackBar(
                      content: Text(comingSoonText),
                    ),
                  );
              },
              child: Container(
                width: 270,
                decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border.all(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      SvgPicture.asset(
                        contentManagementButtonIcon,
                      ),
                      Flexible(
                        child: Text(
                          contentManagementString,
                          style: boldSize16Text(Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
