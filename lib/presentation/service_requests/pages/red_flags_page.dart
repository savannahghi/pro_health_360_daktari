// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_themes/spaces.dart';

// Project imports:
import 'package:healthcloud/application/core/services/utils.dart';
import 'package:healthcloud/application/core/theme/app_themes.dart';
import 'package:healthcloud/domain/core/value_objects/app_asset_strings.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:healthcloud/presentation/core/app_bar/custom_app_bar.dart';
import 'package:healthcloud/presentation/service_requests/widgets/red_flag_list_item.dart';

class RedFlagsPage extends StatefulWidget {
  @override
  State<RedFlagsPage> createState() => _RedFlagsPageState();
}

class _RedFlagsPageState extends State<RedFlagsPage> {
  /// [RedFlagsPage] is used to display a list of red
  /// flags that demand immediate attention
  ///
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[
            AppColors.lightGreyBackgroundColor,
            Colors.white,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: <double>[0.0, 1.0],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const CustomAppBar(
          title: redFlagString,
          showNotificationIcon: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 40,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    redFlagImageSvgPath,
                    width: 180,
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      spreadRadius: 1,
                      blurRadius: 8,
                      offset: const Offset(0, -6),
                    ),
                  ],
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: Colors.black.withOpacity(0.10),
                            spreadRadius: 1,
                            blurRadius: 9,
                            offset: const Offset(0, 9),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              searchString,
                              style: normalSize12Text(
                                AppColors.greyTextColor,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: SvgPicture.asset(searchIconSvg),
                          ),
                        ],
                      ),
                    ),
                    veryLargeVerticalSizedBox,
                    ...List<Widget>.generate(reFlagItems.length, (int index) {
                      final String clientName =
                          reFlagItems.elementAt(index).clientName;
                      final String feeling =
                          reFlagItems.elementAt(index).feelingDescription;

                      return RedFlagListItem(
                        clientName: clientName,
                        feelingDescription: feeling,
                      );
                    }),
                    veryLargeVerticalSizedBox,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
