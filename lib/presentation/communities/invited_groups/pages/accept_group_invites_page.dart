import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mycarehubpro/application/core/theme/app_themes.dart';
import 'package:mycarehubpro/application/redux/actions/communities/accept_communities_invite_action.dart';
import 'package:mycarehubpro/application/redux/actions/communities/decline_communities_invite_action.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_asset_strings.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';
import 'package:mycarehubpro/presentation/core/app_bar/custom_app_bar.dart';
import 'package:mycarehubpro/presentation/router/routes.dart';

class AcceptGroupInvitesPage extends StatefulWidget {
  const AcceptGroupInvitesPage({
    required this.groupId,
    required this.groupName,
    required this.numberOfMembers,
    this.acceptInviteRoute = AppRoutes.communityPage,
  });

  final String acceptInviteRoute;
  final String groupId;
  final String groupName;
  final int numberOfMembers;

  @override
  State<AcceptGroupInvitesPage> createState() => _AcceptGroupInvitesPageState();
}

class _AcceptGroupInvitesPageState extends State<AcceptGroupInvitesPage> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: widget.groupName),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SvgPicture.asset(acceptInvitesImage),
              Text(
                widget.groupName,
                style: boldSize20Text(AppColors.blackColor.withOpacity(0.8)),
              ),
              smallVerticalSizedBox,
              Text(
                '${widget.numberOfMembers} members',
                style: normalSize16Text(AppColors.greyTextColor),
              ),
              mediumVerticalSizedBox,
              Text(
                groupInviteDescription(widget.groupName),
                style: normalSize17Text(AppColors.greyTextColor),
                textAlign: TextAlign.center,
              ),
              largeVerticalSizedBox,
              SizedBox(
                width: double.infinity,
                height: 48,
                child: loading
                    ? const PlatformLoader()
                    : MyAfyaHubPrimaryButton(
                        text: joinGroup,
                        onPressed: () async {
                          setState(() {
                            loading = true;
                          });
                          await StoreProvider.dispatch(
                            context,
                            AcceptCommunitiesInviteAction(
                              communityID: widget.groupId,
                              client: AppWrapperBase.of(context)!.graphQLClient,
                              onSuccess: () {
                                ScaffoldMessenger.of(context)
                                  ..hideCurrentSnackBar()
                                  ..showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        invitationAcceptedSuccessfully,
                                      ),
                                    ),
                                  );
                                Navigator.of(context)
                                    .pushNamed(widget.acceptInviteRoute);
                              },
                              onFailure: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          );
                        },
                      ),
              ),
              mediumVerticalSizedBox,
              if (!loading)
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: MyAfyaHubPrimaryButton(
                    borderColor: Colors.transparent,
                    buttonColor: AppColors.primaryColor.withOpacity(0.1),
                    textColor: AppColors.lightRedTextColor,
                    text: declineInvite,
                    onPressed: () async {
                      setState(() {
                        loading = true;
                      });
                      await StoreProvider.dispatch(
                        context,
                        DeclineCommunitiesInviteAction(
                          communityID: widget.groupId,
                          client: AppWrapperBase.of(context)!.graphQLClient,
                          onSuccess: () {
                            ScaffoldMessenger.of(context)
                              ..hideCurrentSnackBar()
                              ..showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    invitationDeclinedSuccessfully,
                                  ),
                                ),
                              );
                            Navigator.of(context)
                                .pushNamed(AppRoutes.profilePage);
                          },
                          onFailure: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      );
                    },
                  ),
                ),
              mediumVerticalSizedBox,
            ],
          ),
        ),
      ),
    );
  }
}
