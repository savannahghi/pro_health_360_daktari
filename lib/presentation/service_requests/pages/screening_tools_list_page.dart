import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mycarehubpro/application/core/theme/app_themes.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_asset_strings.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';
import 'package:mycarehubpro/presentation/core/app_bar/custom_app_bar.dart';
import 'package:mycarehubpro/presentation/service_requests/widgets/screening_tools_item_widget.dart';
import 'package:shared_themes/spaces.dart';

class ScreeningToolsListPage extends StatelessWidget {
  const ScreeningToolsListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: screeningToolsTitle),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            smallVerticalSizedBox,
            SvgPicture.asset(
              screeningToolsImage,
              height: 150,
            ),
            smallVerticalSizedBox,
            Center(
              child: Text(
                screeningToolsPageLongDescription,
                style: normalSize14Text(
                  AppColors.greyTextColor.withOpacity(0.5),
                ),
              ),
            ),
            smallVerticalSizedBox,
            const ScreeningToolsItemWidget(
              title: violenceString,
              description: violenceDescriptionString,
            ),
            const ScreeningToolsItemWidget(
              title: contraceptivesString,
              description: contraceptivesDescriptionString,
            ),
            const ScreeningToolsItemWidget(
              title: tuberculosisString,
              description: tuberculosisDescriptionString,
            ),
            const ScreeningToolsItemWidget(
              title: alcoholUseAssessmentString,
              description: alcoholUseAssessmentDescriptionString,
            ),
          ],
        ),
      ),
    );
  }
}
