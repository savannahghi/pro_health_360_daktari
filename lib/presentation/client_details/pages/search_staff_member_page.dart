import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:mycarehubpro/application/core/services/helpers.dart';
import 'package:mycarehubpro/application/core/theme/app_themes.dart';
import 'package:mycarehubpro/application/redux/actions/flags/app_flags.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/application/redux/view_models/app_state_view_model.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';
import 'package:mycarehubpro/presentation/core/app_bar/custom_app_bar.dart';
import 'package:shared_themes/spaces.dart';

class SearchStaffMemberPage extends StatefulWidget {
  const SearchStaffMemberPage();

  @override
  State<SearchStaffMemberPage> createState() => _SearchStaffMemberPageState();
}

class _SearchStaffMemberPageState extends State<SearchStaffMemberPage> {
  final TextEditingController searchController = TextEditingController();
  List<String> inviteMemberIds = <String>[];

  String searchQuery = '';
  bool staffMemberFound = false;
  bool showZeroState = false;

  @override
  void initState() {
    super.initState();
    searchController.addListener(() async {
      if (searchController.text.isEmpty) {
        setState(() {
          searchQuery = '';
        });
      } else {
        setState(() {
          searchQuery = searchController.text;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
        title: searchStaffMembersTitle,
        showShadow: false,
        showNotificationIcon: true,
      ),
      body: StoreConnector<AppState, AppStateViewModel>(
        converter: (Store<AppState> store) =>
            AppStateViewModel.fromStore(store),
        builder: (BuildContext context, AppStateViewModel vm) {
          return Column(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        const Text(
                          searchStaffMembersDescription,
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.greyTextColor,
                          ),
                        ),
                        mediumVerticalSizedBox,
                        CustomTextField(
                          controller: searchController,
                          hintText: searchStaffMembersHintString,
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(
                              right: 4.0,
                            ),
                            child: IconButton(
                              onPressed: () {
                                if (searchQuery.isNotEmpty) {
                                  setState(() {
                                    staffMemberFound = false;
                                    showZeroState = false;
                                  });
                                  showTextSnackbar(
                                    ScaffoldMessenger.of(context),
                                    content: comingSoonText,
                                  );
                                }
                              },
                              icon: const Icon(Icons.search),
                            ),
                          ),
                          borderColor: Colors.white,
                          customFillColor: AppColors.galleryColor,
                          onChanged: (String val) {},
                        ),
                        if (vm.state.wait!.isWaitingFor(searchStaffMemberFlag))
                          Container(
                            height: 300,
                            padding: const EdgeInsets.all(20),
                            child: const PlatformLoader(),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
