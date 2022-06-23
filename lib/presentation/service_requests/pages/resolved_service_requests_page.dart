import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_asset_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/core/app_bar/custom_app_bar.dart';
import 'package:prohealth360_daktari/presentation/engagement/home/widgets/action_card.dart';
import 'package:prohealth360_daktari/presentation/router/routes.dart';

class ResolvedServiceRequestsPage extends StatelessWidget {
  const ResolvedServiceRequestsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: resolvedServiceRequestsString,
        showNotificationIcon: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 12,
            ),
            width: double.infinity,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Center(
                    child: SvgPicture.asset(
                      resolvedServiceRequestsImageSvgPath,
                      width: 200,
                    ),
                  ),
                ),
                size15VerticalSizedBox,
                const Text(
                  resolvedServiceRequestsBodyString,
                  style: TextStyle(color: AppColors.grey50),
                  textAlign: TextAlign.center,
                ),
                size15VerticalSizedBox,
                Wrap(
                  children: <Widget>[
                    ActionCard(
                      key: resolvedClientRequestsActionCardKey,
                      iconUrl: clientSearchSvgPath,
                      title: clients,
                      backgroundColor:
                          Theme.of(context).primaryColor.withOpacity(0.2),
                      onTap: () => Navigator.pushNamed(
                        context,
                        AppRoutes.resolvedServiceRequestsListPage,
                        arguments: Flavour.consumer,
                      ),
                    ),
                    ActionCard(
                      key: resolvedStaffRequestsActionCardKey,
                      iconUrl: staffSearchSvgPath,
                      title: staffString,
                      backgroundColor:
                          Theme.of(context).primaryColor.withOpacity(0.2),
                      onTap: () => Navigator.pushNamed(
                        context,
                        AppRoutes.resolvedServiceRequestsListPage,
                        arguments: Flavour.pro,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
