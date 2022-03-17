import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:mycarehubpro/application/core/services/helpers.dart';
import 'package:mycarehubpro/application/core/theme/app_themes.dart';
import 'package:mycarehubpro/application/redux/actions/flags/app_flags.dart';
import 'package:mycarehubpro/application/redux/actions/search_client_action.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/application/redux/view_models/app_state_view_model.dart';
import 'package:mycarehubpro/domain/core/entities/profile/client_response.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_asset_strings.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';
import 'package:mycarehubpro/presentation/client_details/widgets/search_client_item.dart';
import 'package:mycarehubpro/presentation/core/app_bar/custom_app_bar.dart';
import 'package:mycarehubpro/presentation/router/routes.dart';
import 'package:shared_themes/spaces.dart';

class SearchClientPage extends StatefulWidget {
  const SearchClientPage();

  @override
  State<SearchClientPage> createState() => _SearchClientPageState();
}

class _SearchClientPageState extends State<SearchClientPage> {
  final TextEditingController searchController = TextEditingController();
  List<String> inviteMemberIds = <String>[];

  String cccNumber = '';
  ClientResponse? clientDetails;
  bool clientFound = false;
  bool showZeroState = false;

  @override
  void initState() {
    super.initState();
    searchController.addListener(() async {
      if (searchController.text.isEmpty) {
        setState(() {
          cccNumber = '';
        });
      } else {
        setState(() {
          cccNumber = searchController.text;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
        title: searchClientsTitle,
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
                          searchClientsDescription,
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.greyTextColor,
                          ),
                        ),
                        mediumVerticalSizedBox,
                        CustomTextField(
                          controller: searchController,
                          hintText: searchClientsHintString,
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(
                              right: 4.0,
                            ),
                            child: IconButton(
                              onPressed: () {
                                if (cccNumber.isNotEmpty) {
                                  setState(() {
                                    clientFound = false;
                                    showZeroState = false;
                                  });
                                  StoreProvider.dispatch(
                                    context,
                                    SearchClientAction(
                                      client: AppWrapperBase.of(context)!
                                          .graphQLClient,
                                      cccNumber: cccNumber,
                                      clientNotFound: () {
                                        setState(() {
                                          showZeroState = true;
                                        });
                                      },
                                      onFailure: (String message) {
                                        showTextSnackbar(
                                          ScaffoldMessenger.of(context),
                                          content: message,
                                        );
                                      },
                                      onSuccess: (ClientResponse response) {
                                        setState(() {
                                          clientDetails = response;
                                          clientFound = true;
                                        });
                                      },
                                    ),
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
                        if (vm.state.wait!.isWaitingFor(searchClientFlag))
                          Container(
                            height: 300,
                            padding: const EdgeInsets.all(20),
                            child: const PlatformLoader(),
                          ),
                        const SizedBox(height: 24),
                        if (clientFound && clientDetails != null)
                          SearchUserItem(
                            clientDetails: clientDetails!,
                            number: cccNumber,
                            isCCCNumber: true,
                          ),
                        if (showZeroState)
                          GenericErrorWidget(
                            actionKey: const Key('search_not_found_key'),
                            headerIconSvgUrl: searchNotFoundImage,
                            padding: EdgeInsets.zero,
                            recoverCallback: () {
                              Navigator.of(context)
                                  .pushNamed(AppRoutes.addNewPatientPage);
                            },
                            actionText: registerClientString,
                            messageTitle: noClientFoundString,
                            messageBody: <TextSpan>[
                              TextSpan(
                                text: couldNotFindClientString,
                                style: normalSize16Text(
                                  AppColors.greyTextColor,
                                ),
                              ),
                              TextSpan(
                                text: cccNumber,
                                style: boldSize18Text(
                                  AppColors.greyTextColor,
                                ),
                              ),
                              TextSpan(
                                text: confirmCCCNumberIsCorrectString,
                                style: normalSize16Text(
                                  AppColors.greyTextColor,
                                ),
                              )
                            ],
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
