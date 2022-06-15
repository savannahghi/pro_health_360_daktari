import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:mycarehubpro/application/core/theme/app_themes.dart';
import 'package:mycarehubpro/application/redux/actions/flags/app_flags.dart';
import 'package:mycarehubpro/application/redux/actions/search_users/invite_client_action.dart';
import 'package:mycarehubpro/application/redux/actions/search_users/reactivate_client_action.dart';
import 'package:mycarehubpro/application/redux/actions/search_users/shared_health_diary_action.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/application/redux/view_models/search/search_view_model.dart';
import 'package:mycarehubpro/domain/core/entities/health_diary/health_diary_entry.dart';
import 'package:mycarehubpro/domain/core/entities/search_user/search_user_response.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';
import 'package:mycarehubpro/presentation/client_details/widgets/health_diary_entry_widget.dart';
import 'package:mycarehubpro/presentation/router/routes.dart';
import 'package:mycarehubpro/presentation/search/widgets/active_client_actions.dart';
import 'package:mycarehubpro/presentation/search/widgets/inactive_user_actions.dart';
import 'package:mycarehubpro/presentation/search/widgets/search_details_information_widget.dart';

class ClientSearchWidget extends StatelessWidget {
  const ClientSearchWidget();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: StoreConnector<AppState, SearchViewModel>(
        onInit: (Store<AppState> store) {
          final String clientID = store.state.miscState?.searchUserResponseState
                  ?.selectedSearchUserResponse?.id ??
              '';
          final String facilityID = store
                  .state
                  .miscState
                  ?.searchUserResponseState
                  ?.selectedSearchUserResponse
                  ?.facilityID ??
              '';

          store.dispatch(
            SharedHealthDiaryAction(
              client: AppWrapperBase.of(context)!.graphQLClient,
              clientID: clientID,
              facilityID: facilityID,
            ),
          );
        },
        converter: (Store<AppState> store) => SearchViewModel.fromStore(store),
        builder: (BuildContext context, SearchViewModel vm) {
          final SearchUserResponse selectedSearchUserResponse =
              vm.selectedSearchUserResponse!;

          final List<HealthDiaryEntry?> entries =
              vm.sharedDiaryEntries ?? <HealthDiaryEntry>[];

          final bool isActive = selectedSearchUserResponse.isActive ?? true;
          final String names = selectedSearchUserResponse.user?.name ?? '';

          return Column(
            children: <Widget>[
              SearchDetailsInformationWidget(
                searchUserResponse: selectedSearchUserResponse,
                isClient: true,
              ),
              smallVerticalSizedBox,
              const Divider(),
              smallVerticalSizedBox,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // Only send an invite when a user is active

                    if (isActive)
                      ActiveClientActions(
                        names: names,
                        isSendLoading: vm.wait.isWaitingFor(inviteClientFlag),
                        isResendLoading:
                            vm.wait.isWaitingFor(resendClientInviteFlag),
                        searchUserResponse: selectedSearchUserResponse,
                      )
                    else
                      InActiveUserActions(
                        names: names,
                        isLoading: vm.wait.isWaitingFor(reactivateClientFlag),
                        searchUserResponse: selectedSearchUserResponse,
                      ),

                    /// Shared health diary entries section
                    if (vm.wait.isWaitingFor(sharedHealthDiaryFlag))
                      Container(
                        height: 300,
                        padding: const EdgeInsets.all(20),
                        child: const PlatformLoader(),
                      ),
                    if (!vm.wait.isWaitingFor(sharedHealthDiaryFlag) &&
                        entries.isNotEmpty)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            shareDiaryEntry,
                            style: boldSize18Text(AppColors.greyTextColor),
                          ),
                          smallVerticalSizedBox,
                          ListView.builder(
                            itemCount: entries.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              final HealthDiaryEntry? currentEntry =
                                  entries.elementAt(index);
                              if (currentEntry != null) {
                                return HealthDiaryEntryWidget(
                                  diaryEntry: currentEntry,
                                  index: index,
                                );
                              } else {
                                return const SizedBox();
                              }
                            },
                          ),
                          smallVerticalSizedBox,
                        ],
                      ),
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

/// Performs an invite to a client or reinvite based on the value of [reinvite]
///
/// It sends an invite if [reinvite] is true and a reinvite if false
void clientSearchAction({
  required BuildContext context,
  required SearchUserResponse selectedSearchUserResponse,
  final bool reinvite = false,
}) {
  final bool isActive = selectedSearchUserResponse.isActive ?? true;
  final String name = selectedSearchUserResponse.user?.name ?? 'the client';
  final IGraphQlClient? client = AppWrapperBase.of(context)?.graphQLClient;

  if (isActive) {
    StoreProvider.dispatch(
      context,
      InviteClientAction(
        clientResponse: selectedSearchUserResponse,
        client: client!,
        reinvite: reinvite,
        onSuccess: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('$inviteSent $name')),
          );
          Navigator.of(context).pushNamedAndRemoveUntil(
            AppRoutes.homePage,
            (Route<dynamic> route) => false,
          );
        },
        onFailure: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text(unableToSendInvite)),
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

    StoreProvider.dispatch(
      context,
      ReactivateClientAction(
        client: client!,
        optInEndpoint: endpoint ?? '',
        searchUserResponse: selectedSearchUserResponse,
        onSuccess: () => ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('$name $reactivatedSuccessfullyString')),
        ),
        onError: () => ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('$errorWhileReactivatingString $name')),
        ),
      ),
    );
  }
}
