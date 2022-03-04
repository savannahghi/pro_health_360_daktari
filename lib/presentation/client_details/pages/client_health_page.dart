// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_themes/spaces.dart';

// Project imports:
import 'package:myharehubpro/application/core/services/utils.dart';
import 'package:myharehubpro/application/core/theme/app_themes.dart';
import 'package:myharehubpro/domain/core/value_objects/app_asset_strings.dart';
import 'package:myharehubpro/domain/core/value_objects/app_strings.dart';
import 'package:myharehubpro/domain/core/value_objects/app_widget_keys.dart';
import 'package:myharehubpro/presentation/client_details/widgets/client_details_card_widget.dart';
import 'package:myharehubpro/presentation/client_details/widgets/my_health_timeline.dart';
import 'package:myharehubpro/presentation/client_details/widgets/profile_health_details_widget.dart';
import 'package:myharehubpro/presentation/core/app_bar/custom_app_bar.dart';

class ClientHealthPage extends StatefulWidget {
  /// [ClientHealthPage] is used to approve client profile updates and to
  /// edit client details or adding new entires
  ///
  @override
  State<ClientHealthPage> createState() => _ClientHealthPageState();
}

class _ClientHealthPageState extends State<ClientHealthPage> {
  ///viewProfile variable is used to flag the section to view upon tapping
  ///the view profile button
  late bool viewProfile = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: const CustomAppBar(
        title: myHealthPageTitle,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ClientDetailsCard(
                userInitials: initials,
                name: name,
                cccNumber: userCCCNumberString,
                age: ageExampleString,
                phoneNumber: phoneNumber,
                home: homeExampleString,
                onTapViewProfile: () {
                  setState(() {
                    viewProfile = true;
                  });
                },
              ),
              size15VerticalSizedBox,
              if (!viewProfile)
                Column(
                  children: <Widget>[
                    Container(
                      height: 110,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: const <Widget>[
                          ProfileHealthDetailsWidget(
                            svgPath: viralLoadIcon,
                            title: myHealthViralLoad,
                            description: myHealthViralLoadReading,
                            descriptionSubScript: myHealthViralLoadReadingUnit,
                          ),
                          ProfileHealthDetailsWidget(
                            svgPath: nextRefillIcon,
                            title: myHealthNextRefill,
                            description: myHealthNextRefillDate,
                            descriptionSubScript: myHealthNextRefillMonth,
                          ),
                        ],
                      ),
                    ),
                    size15VerticalSizedBox,
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: InformationListCard(
                            title: Text(
                              myHealthPageHealthDiary,
                              style: normalSize14Text(
                                AppColors.buttonAltColor,
                              ),
                            ),
                            alternateLeadingIcon: Container(
                              padding: const EdgeInsets.all(18),
                              decoration: BoxDecoration(
                                color: Theme.of(context).backgroundColor,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: SvgPicture.asset(
                                healthDiaryIcon,
                                width: 20,
                                height: 20,
                                color: AppColors.buttonAltColor,
                              ),
                            ),
                          ),
                        ),
                        smallHorizontalSizedBox,
                        Expanded(
                          child: InformationListCard(
                            title: Text(
                              myHealthPageAppointments,
                              style: normalSize14Text(
                                AppColors.buttonAltColor,
                              ),
                            ),
                            alternateLeadingIcon: Container(
                              padding: const EdgeInsets.all(18),
                              decoration: BoxDecoration(
                                color: Theme.of(context).backgroundColor,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: SvgPicture.asset(
                                appointmentIcon,
                                width: 20,
                                height: 20,
                                color: AppColors.buttonAltColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const MyHealthTimeline(),
                  ],
                ),
              if (viewProfile)
                Column(
                  children: <Widget>[
                    ...List<Widget>.generate(clientProfileItems.length,
                        (int index) {
                      final String iconPath =
                          clientProfileItems.elementAt(index).iconAssetPath;
                      final String title =
                          clientProfileItems.elementAt(index).title;

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: InformationListCard(
                          title: Text(
                            title,
                            maxLines: 2,
                            style: veryBoldSize14Text(
                              AppColors.buttonAltColor,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          iconBackgroundColor: AppColors.galleryColor,
                          leadingIcon: Container(
                            width: 25,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: SvgPicture.asset(
                              iconPath,
                              width: 20,
                              height: 20,
                              color: AppColors.buttonAltColor,
                            ),
                          ),
                        ),
                      );
                    }),
                    largeVerticalSizedBox,
                    SizedBox(
                      height: 42,
                      width: 150,
                      child: MyAfyaHubPrimaryButton(
                        text: transferOut,
                        textStyle: boldSize14Text(Colors.white),
                        buttonColor: Colors.red,
                        customRadius: 15,
                      ),
                    )
                  ],
                ),
            ],
          ),
        ),
      ),
      floatingActionButton: Visibility(
        visible: !viewProfile,
        child: GestureDetector(
          key: newEntryButtonKey,
          onTap: () {
            addNewProfileEntryBottomSheet(context);
          },
          child: Container(
            height: 65,
            width: 300,
            padding:
                const EdgeInsets.symmetric(vertical: 4.0, horizontal: 30.0),
            decoration: const BoxDecoration(
              color: AppColors.accentColor,
            ),
            child: Column(
              children: <Widget>[
                const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                verySmallVerticalSizedBox,
                Text(
                  newEntryString,
                  style: veryBoldSize15Text(Colors.white),
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
