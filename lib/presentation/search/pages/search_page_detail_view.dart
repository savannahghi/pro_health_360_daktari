import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/actions/search_users/fetch_staff_roles_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/view_models/search/search_view_model.dart';
import 'package:prohealth360_daktari/domain/core/entities/search_user/roles_list.dart';
import 'package:prohealth360_daktari/domain/core/entities/search_user/search_user_response.dart';
import 'package:prohealth360_daktari/presentation/core/app_bar/custom_app_bar.dart';
import 'package:prohealth360_daktari/presentation/search/widgets/client_search_widget.dart';
import 'package:prohealth360_daktari/presentation/search/widgets/staff_search_widget.dart';

class SearchPageDetailView extends StatefulWidget {
  const SearchPageDetailView({
    required this.searchUserResponse,
    required this.isClient,
  });

  final SearchUserResponse searchUserResponse;
  final bool isClient;

  @override
  State<SearchPageDetailView> createState() => _SearchPageDetailViewState();
}

class _SearchPageDetailViewState extends State<SearchPageDetailView> {
  @override
  void initState() {
    // fetch roles if the user being searched is a staff member
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!widget.isClient) {
        StoreProvider.dispatch(
          context,
          FetchStaffRolesAction(
            userID: widget.searchUserResponse.user!.id!,
            client: AppWrapperBase.of(context)!.graphQLClient,
            onFailure: () {},
          ),
        );
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: widget.searchUserResponse.user?.userName),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        child: widget.isClient
            ? const ClientSearchWidget()
            : StoreConnector<AppState, SearchViewModel>(
                converter: (Store<AppState> store) =>
                    SearchViewModel.fromStore(store),
                builder: (BuildContext context, SearchViewModel vm) {
                  if (vm.wait.isWaitingFor(getUserRolesFlag)) {
                    return Container(
                      height: 300,
                      padding: const EdgeInsets.all(20),
                      child: const PlatformLoader(),
                    );
                  }
                  return StaffSearchWidget(
                    rolesList: vm.selectedSearchUserResponse?.rolesList ??
                        RolesList.initial(),
                  );
                },
              ),
      ),
    );
  }
}
