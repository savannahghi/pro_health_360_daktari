// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:healthcloud/application/redux/actions/flags/app_flags.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/application/redux/view_models/app_state_view_model.dart';

import 'package:shared_themes/spaces.dart';

// Project imports:
import 'package:healthcloud/application/core/services/utils.dart';
import 'package:healthcloud/application/core/theme/app_themes.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:healthcloud/domain/core/value_objects/app_widget_keys.dart';
import 'package:shared_ui_components/platform_loader.dart';

/// [CreateNewPINPage] has two [CustomTextField] to create new user PIN
///
/// The [CustomTextField] for confirm PIN validates if it matches the
/// PIN entered in the above [CustomTextField]
class CreateNewPINPage extends StatefulWidget {
  @override
  _CreateNewPINPageState createState() => _CreateNewPINPageState();
}

class _CreateNewPINPageState extends State<CreateNewPINPage> {
  late String confirmPin = '';
  late String pin = '';
  TextEditingController pinController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final bool isResetPin =
        StoreProvider.state<AppState>(context)?.onboardingState?.isResetPin ??
            false;
    return OnboardingScaffold(
      title: isResetPin ? resetPINTitleString : createNewPINTitleString,
      description: createNewPINSubTitleString,
      child: StoreConnector<AppState, AppStateViewModel>(
        converter: (Store<AppState> store) =>
            AppStateViewModel.fromStore(store),
        builder: (BuildContext context, AppStateViewModel vm) {
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
                        validator: userPinValidator,
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
                if (vm.state.wait!.isWaitingFor(createPinFlag)) ...<Widget>{
                  const SILPlatformLoader(
                    color: AppColors.secondaryColor,
                  )
                },
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: MyAfyaHubPrimaryButton(
                      buttonKey: createPINContinueButtonKey,
                      onPressed: vm.state.wait!.isWaitingFor(createPinFlag)
                          ? null
                          : () async {
                              if (!confirmPinValidator(pin, confirmPin)) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(pinMustMatchString),
                                    duration: Duration(seconds: 2),
                                  ),
                                );
                                return;
                              }
                              if (_formKey.currentState!.validate()) {
                                setUserPIN(
                                  context: context,
                                  newPIN: pin,
                                  confirmPIN: confirmPin,
                                  flavour: Flavour.pro.name,
                                );
                              }
                            },
                      buttonColor: vm.state.wait!.isWaitingFor(createPinFlag)
                          ? Colors.grey
                          : AppColors.secondaryColor,
                      borderColor: vm.state.wait!.isWaitingFor(createPinFlag)
                          ? Colors.grey
                          : AppColors.secondaryColor,
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
