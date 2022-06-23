import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/actions/onboarding/create_staff_pin_reset_request_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/view_models/app_state_view_model.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_asset_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/router/routes.dart';
import 'package:shared_themes/constants.dart';

class VerifySecurityQuestionsHelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                veryLargeVerticalSizedBox,
                SvgPicture.asset(pinRequestSentImage),
                largeVerticalSizedBox,
                Text(
                  doYouNeedHelpString,
                  style: heavySize20Text(),
                  textAlign: TextAlign.center,
                ),
                smallVerticalSizedBox,
                Text(
                  verifySecurityQuestionHelpMessageString,
                  style: normalSize14Text(darkGreyTextColor),
                  textAlign: TextAlign.center,
                ),
                mediumVerticalSizedBox,
                StoreConnector<AppState, AppStateViewModel>(
                  converter: (Store<AppState> store) =>
                      AppStateViewModel.fromStore(store),
                  builder: (BuildContext context, AppStateViewModel vm) {
                    return vm.state.wait
                                ?.isWaitingFor(pinResetServiceRequestFlag) ??
                            false
                        ? const Padding(
                            padding: EdgeInsets.all(20.0),
                            child: PlatformLoader(),
                          )
                        : SizedBox(
                            width: double.infinity,
                            height: 48,
                            child: MyAfyaHubPrimaryButton(
                              buttonKey: askForHelpButtonKey,
                              text: askForHelpString,
                              onPressed: () {
                                final String? endpoint =
                                    AppWrapperBase.of(context)
                                        ?.customContext
                                        ?.pinResetServiceRequestEndpoint;
                                final IGraphQlClient? client =
                                    AppWrapperBase.of(context)?.graphQLClient;
                                StoreProvider.dispatch<AppState>(
                                  context,
                                  CreateStaffPINResetRequestAction(
                                    pinResetServiceRequestEndpoint: endpoint!,
                                    client: client!,
                                    onSuccess: () {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                            successfulPINResetRequestString,
                                          ),
                                          duration: Duration(
                                            seconds: kShortSnackBarDuration,
                                          ),
                                        ),
                                      );
                                    },
                                    onError: () {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            getErrorMessage(
                                              sendingPINResetRequestSting,
                                            ),
                                          ),
                                          duration: const Duration(
                                            seconds: kShortSnackBarDuration,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                );
                              },
                            ),
                          );
                  },
                ),
                smallVerticalSizedBox,
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: MyAfyaHubPrimaryButton(
                    buttonKey: tryAgainButtonKey,
                    text: tryAgainString,
                    buttonColor:
                        Theme.of(context).primaryColor.withOpacity(0.1),
                    textStyle: normalSize14Text(AppColors.redColor),
                    borderColor: Colors.transparent,
                    onPressed: () => Navigator.of(context).pushReplacementNamed(
                      AppRoutes.loginPage,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
