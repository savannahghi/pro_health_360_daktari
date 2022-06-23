import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/application/redux/actions/create_pin_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/actions/onboarding/update_onboarding_state_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/view_models/onboarding/create_pin_view_model.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_enums.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:shared_themes/constants.dart';

/// [CreateNewPINPage] has two [CustomTextField] to create new user PIN
///
/// The [CustomTextField] for confirm PIN validates if it matches the
/// PIN entered in the above [CustomTextField]
class CreateNewPINPage extends StatefulWidget {
  const CreateNewPINPage({Key? key}) : super(key: key);

  @override
  _CreateNewPINPageState createState() => _CreateNewPINPageState();
}

class _CreateNewPINPageState extends State<CreateNewPINPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String confirmPin = '';
  String pin = '';

  @override
  Widget build(BuildContext context) {
    final bool isResetPin = StoreProvider.state<AppState>(context)
            ?.onboardingState
            ?.currentOnboardingStage ==
        CurrentOnboardingStage.ResetPIN;

    return OnboardingScaffold(
      title: isResetPin ? resetPINTitleString : createNewPINTitleString,
      description: createNewPINSubTitleString,
      child: StoreConnector<AppState, CreatePinViewModel>(
        converter: (Store<AppState> store) =>
            CreatePinViewModel.fromStore(store),
        builder: (BuildContext context, CreatePinViewModel vm) {
          return SizedBox(
            height: MediaQuery.of(context).size.height / 1.6,
            child: Stack(
              children: <Widget>[
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          pinString,
                          style: boldSize14Text(
                            AppColors.greyTextColor,
                          ),
                        ),
                      ),
                      verySmallVerticalSizedBox,
                      CustomTextField(
                        formFieldKey: pinInputKey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        borderColor: Colors.grey[200],
                        maxLength: 4,
                        maxLines: 1,
                        keyboardType: TextInputType.number,
                        obscureText: true,
                        validator: (String? value) {},
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        onChanged: (String val) {
                          setState(() {
                            pin = val;
                          });
                        },
                      ),
                      verySmallVerticalSizedBox,
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          confirmPinString,
                          style: boldSize14Text(
                            AppColors.greyTextColor,
                          ),
                        ),
                      ),
                      verySmallVerticalSizedBox,
                      CustomTextField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        formFieldKey: confirmPinInputKey,
                        borderColor: Colors.grey[200],
                        maxLength: 4,
                        maxLines: 1,
                        keyboardType: TextInputType.number,
                        obscureText: true,
                        validator: userPinValidator,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        onChanged: (String val) {
                          setState(() {
                            confirmPin = val;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                veryLargeVerticalSizedBox,
                if (vm.wait.isWaitingFor(createPinFlag)) ...<Widget>{
                  const PlatformLoader(color: AppColors.secondaryColor)
                },
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: MyAfyaHubPrimaryButton(
                      buttonKey: createPINContinueButtonKey,
                      onPressed: vm.wait.isWaitingFor(createPinFlag)
                          ? null
                          : () async {
                              if (!vm.hasConnection) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(noInternetConnection),
                                  ),
                                );
                                return;
                              }

                              if (_formKey.currentState!.validate()) {
                                // this is the Redux Action that store the PINs user enters
                                StoreProvider.dispatch(
                                  context,
                                  UpdateOnboardingStateAction(
                                    pin: pin,
                                    confirmPIN: confirmPin,
                                  ),
                                );

                                final IGraphQlClient client =
                                    AppWrapperBase.of(context)!.graphQLClient;
                                final String resetPinEndpoint =
                                    AppWrapperBase.of(context)!
                                        .customContext!
                                        .updateUserPinEndpoint;

                                StoreProvider.dispatch(
                                  context,
                                  CreatePINAction(
                                    client: client,
                                    resetPinEndpoint: resetPinEndpoint,
                                    onSuccess: () {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text(pinSuccessString),
                                          duration: Duration(seconds: 2),
                                        ),
                                      );
                                    },
                                    onError: (String? error) {
                                      ScaffoldMessenger.of(context)
                                        ..hideCurrentSnackBar()
                                        ..showSnackBar(
                                          SnackBar(
                                            content: Text(error.toString()),
                                            duration: const Duration(
                                              seconds: kShortSnackBarDuration,
                                            ),
                                            action: dismissSnackBar(
                                              closeString,
                                              Colors.white,
                                              context,
                                            ),
                                          ),
                                        );
                                    },
                                  ),
                                );
                              }
                            },
                      buttonColor: vm.wait.isWaitingFor(createPinFlag)
                          ? Colors.grey
                          : AppColors.primaryColor,
                      borderColor: vm.wait.isWaitingFor(createPinFlag)
                          ? Colors.grey
                          : AppColors.primaryColor,
                      text: saveAndContinueButtonText,
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
