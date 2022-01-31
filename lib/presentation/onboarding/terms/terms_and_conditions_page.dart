import 'package:afya_moja_core/buttons.dart';
import 'package:afya_moja_core/checkbox_component.dart';
import 'package:afya_moja_core/colors.dart';
import 'package:afya_moja_core/information_list_card.dart';
import 'package:afya_moja_core/text_themes.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:healthcloud/application/core/theme/app_themes.dart';
import 'package:healthcloud/application/redux/actions/flags/app_flags.dart';
import 'package:healthcloud/application/redux/actions/terms/accept_terms_action.dart';
import 'package:healthcloud/application/redux/actions/terms/get_terms_action.dart';
import 'package:healthcloud/application/redux/actions/update_user_profile_action.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/application/redux/view_models/terms/terms_view_model.dart';
import 'package:healthcloud/domain/core/entities/terms/terms_and_conditions.dart';
import 'package:healthcloud/domain/core/value_objects/app_asset_strings.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_ui_components/platform_loader.dart';
import 'package:unicons/unicons.dart';

class TermsAndConditionsPage extends StatefulWidget {
  const TermsAndConditionsPage({Key? key}) : super(key: key);

  @override
  _TermsAndConditionsPageState createState() => _TermsAndConditionsPageState();
}

class _TermsAndConditionsPageState extends State<TermsAndConditionsPage> {
  bool isAgreed = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback(
      (_) => StoreProvider.dispatch<AppState>(
        context,
        GetTermsAction(client: AppWrapperBase.of(context)!.graphQLClient),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: StoreConnector<AppState, TermsViewModel>(
            converter: (Store<AppState> store) =>
                TermsViewModel.fromStore(store),
            builder: (BuildContext context, TermsViewModel vm) {
              final TermsAndConditions? termsObject = vm.termsAndConditions;
              final bool userAccepted = termsObject?.text != null &&
                  termsObject?.text != UNKNOWN &&
                  isAgreed;

              if (vm.error != null && vm.error != UNKNOWN) {
                return Container(
                  height: 200,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(errorDisplayImgUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      vm.error!,
                      style: boldSize16Text(whiteColor),
                      textDirection: TextDirection.ltr,
                    ),
                  ),
                );
              }

              return Column(
                children: <Widget>[
                  // Terms and Conditions Card
                  InformationListCard(
                    leadingIcon: const Center(
                      child: Icon(
                        UniconsLine.file_lock_alt,
                        size: 32,
                        color: AppColors.secondaryColor,
                      ),
                    ),
                    title: Text(
                      portalTermsText,
                      style: normalSize16Text(
                        Theme.of(context).primaryColor,
                      ),
                    ),
                    body: Text(
                      readAndAcceptText,
                      style: normalSize14Text(Colors.grey),
                    ),
                  ),

                  const SizedBox(height: 8),

                  // Terms and Conditions scrollable view
                  Expanded(
                    child: Scrollbar(
                      isAlwaysShown: true,
                      thickness: 10.0,
                      radius: const Radius.circular(10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child: SingleChildScrollView(
                          physics: const AlwaysScrollableScrollPhysics(),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: vm.wait.isWaitingFor(getTermsFlag)
                                  ? Container(
                                      height: 300,
                                      padding: const EdgeInsets.all(20),
                                      child: const SILPlatformLoader(),
                                    )
                                  : SizedBox(
                                      width: double.infinity,
                                      child: Html(
                                        data: vm.termsAndConditions?.text,
                                      ),
                                    ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Accepts terms check box
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: CheckBoxComponent(
                      text: acceptTermsText,
                      value: isAgreed,
                      color: AppColors.secondaryColor,
                      onChanged: (bool? value) async {
                        setState(() {
                          isAgreed = value!;
                        });
                        if (vm.termsAndConditions?.text != UNKNOWN) {
                          setState(() {
                            isAgreed = value!;
                          });
                        }
                      },
                    ),
                  ),

                  smallVerticalSizedBox,

                  // Continue button
                  SizedBox(
                    height: 48,
                    width: double.infinity,
                    child: vm.wait.isWaitingFor(acceptTermsFlag)
                        ? const SILPlatformLoader(
                            color: AppColors.secondaryColor,
                          )
                        : MyAfyaHubPrimaryButton(
                            text: continueString,
                            borderColor: userAccepted
                                ? AppColors.secondaryColor
                                : Colors.grey,
                            buttonColor: userAccepted
                                ? AppColors.secondaryColor
                                : Colors.grey,
                            onPressed: !isAgreed
                                ? null
                                : () {
                                    StoreProvider.dispatch(
                                      context,
                                      UpdateUserProfileAction(
                                        termsAccepted: true,
                                      ),
                                    );

                                    StoreProvider.dispatch<AppState>(
                                      context,
                                      // Accept terms and conditions
                                      AcceptTermAction(
                                        client: AppWrapperBase.of(context)!
                                            .graphQLClient,
                                      ),
                                    );
                                  },
                          ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
