import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:mycarehubpro/application/core/theme/app_themes.dart';
import 'package:mycarehubpro/application/redux/actions/flags/app_flags.dart';
import 'package:mycarehubpro/application/redux/actions/search_users/invite_client_action.dart';
import 'package:mycarehubpro/application/redux/actions/search_users/reactivate_client_action.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/application/redux/view_models/search/search_view_model.dart';
import 'package:mycarehubpro/domain/core/entities/search_user/search_user_response.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';
import 'package:mycarehubpro/presentation/router/routes.dart';
import 'package:mycarehubpro/presentation/search/widgets/search_details_information_widget.dart';
import 'package:shared_themes/spaces.dart';

class ClientSearchWidget extends StatelessWidget {
  const ClientSearchWidget();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: StoreConnector<AppState, SearchViewModel>(
        converter: (Store<AppState> store) => SearchViewModel.fromStore(store),
        builder: (BuildContext context, SearchViewModel vm) {
          final SearchUserResponse selectedSearchUserResponse =
              vm.selectedSearchUserResponse!;

          final bool isActive = selectedSearchUserResponse.isActive ?? true;
          return Column(
            children: <Widget>[
              SearchDetailsInformationWidget(
                searchUserResponse: selectedSearchUserResponse,
                isClient: true,
              ),
              const Divider(),
              mediumVerticalSizedBox,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      isActive ? actions : deactivatedUserString,
                      style: boldSize18Text(AppColors.greyTextColor),
                    ),
                    smallVerticalSizedBox,
                    if (isActive)
                      Text(
                        '1. $myCareHubInviteText',
                        style: boldSize15Text(AppColors.greyTextColor),
                      )
                    else
                      Text(
                        '${selectedSearchUserResponse.user?.userName} $deactivatedUserPageDescriptionString',
                        style: normalSize14Text(AppColors.greyTextColor),
                      ),
                    if (isActive) ...<Widget>{
                      verySmallVerticalSizedBox,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14.0),
                        child: Text(
                          tapBelowToInvite(
                            selectedSearchUserResponse.user?.userName ?? '',
                          ),
                          style: normalSize14Text(AppColors.greyTextColor),
                        ),
                      )
                    },
                    mediumVerticalSizedBox,
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14.0),
                      width: double.infinity,
                      child: (vm.wait.isWaitingFor(inviteClientFlag) ||
                              vm.wait.isWaitingFor(reactivateClientFlag))
                          ? const PlatformLoader()
                          : MyAfyaHubPrimaryButton(
                              customChild: Text(
                                isActive
                                    ? inviteToMyCareHubString
                                    : reactivateUserString,
                                style: veryBoldSize15Text(
                                  AppColors.whiteColor,
                                ),
                              ),
                              onPressed: () => onPressedPrimaryButton(
                                context: context,
                                selectedSearchUserResponse:
                                    selectedSearchUserResponse,
                              ),
                            ),
                    ),
                    mediumVerticalSizedBox,
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

void onPressedPrimaryButton({
  required BuildContext context,
  required SearchUserResponse selectedSearchUserResponse,
}) {
  final bool isActive = selectedSearchUserResponse.isActive ?? true;
  final String userName = selectedSearchUserResponse.user?.userName ?? '';

  if (isActive) {
    StoreProvider.dispatch(
      context,
      InviteClientAction(
        clientResponse: selectedSearchUserResponse,
        client: AppWrapperBase.of(context)!.graphQLClient,
        onSuccess: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                '$inviteSent $userName',
              ),
            ),
          );
          Navigator.of(context).pushNamedAndRemoveUntil(
            AppRoutes.homePage,
            (Route<dynamic> route) => false,
          );
        },
        onFailure: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(unableToSendInvite),
            ),
          );
          Navigator.of(context).pushNamedAndRemoveUntil(
            AppRoutes.homePage,
            (Route<dynamic> route) => false,
          );
        },
      ),
    );
  } else {
    final String? endpoint =
        AppWrapperBase.of(context)?.customContext?.optInClientEndpoint;
    final IGraphQlClient? client = AppWrapperBase.of(context)?.graphQLClient;
    StoreProvider.dispatch(
      context,
      ReactivateClientAction(
        client: client!,
        optInEndpoint: endpoint ?? '',
        searchUserResponse: selectedSearchUserResponse,
        onSuccess: () => ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              '$userName $reactivatedSuccessfullyString',
            ),
          ),
        ),
        onError: () => ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              '$errorWhileReactivatingString $userName',
            ),
          ),
        ),
      ),
    );
  }
}
