import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/actions/set_nick_name_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/update_user_profile_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/view_models/onboarding/set_nickname_view_model.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';

class SetNickNamePage extends StatefulWidget {
  const SetNickNamePage({Key? key}) : super(key: key);

  @override
  _SetNickNamePageState createState() => _SetNickNamePageState();
}

class _SetNickNamePageState extends State<SetNickNamePage> {
  String? nickName;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double sizedBoxHeight = MediaQuery.of(context).size.width / 4;
    return Scaffold(
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: sizedBoxHeight,
                  ),
                  const OnboardingScaffoldHeader(
                    title: setNicknameString,
                    description: setNicknameDescription,
                  ),
                  smallVerticalSizedBox,
                  SizedBox(
                    child: Column(
                      children: <Widget>[
                        Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  nickNameString,
                                  style: boldSize14Text(
                                    AppColors.greyTextColor,
                                  ),
                                ),
                              ),
                              verySmallVerticalSizedBox,
                              CustomTextField(
                                formFieldKey: nameInputKey,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                borderColor: Colors.grey[200],
                                maxLines: 1,
                                keyboardType: TextInputType.name,
                                validator: (String? value) {
                                  if (value!.isEmpty) {
                                    return nameInputValidateString;
                                  }

                                  return null;
                                },
                                onChanged: (String val) {
                                  setState(() {
                                    nickName = val;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: StoreConnector<AppState, SetNicknameViewModel>(
        converter: (Store<AppState> store) =>
            SetNicknameViewModel.fromStore(store),
        builder: (BuildContext context, SetNicknameViewModel vm) {
          return Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            width: double.infinity,
            height: 52,
            child: (vm.wait.isWaitingFor(setNickNameFlag))
                ? const PlatformLoader()
                : MyAfyaHubPrimaryButton(
                    buttonKey: continueKey,
                    onPressed: () async {
                      if (!vm.hasInternetConnection) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(noInternetConnection),
                          ),
                        );
                        return;
                      }

                      final bool? isFormValid =
                          _formKey.currentState?.validate();

                      if (isFormValid != null &&
                          isFormValid &&
                          nickName != null) {
                        StoreProvider.dispatch<AppState>(
                          context,
                          UpdateUserProfileAction(nickName: nickName),
                        );

                        await StoreProvider.dispatch<AppState>(
                          context,
                          SetNicknameAction(
                            client: AppWrapperBase.of(context)!.graphQLClient,
                            onSuccess: () {
                              ScaffoldMessenger.of(context)
                                ..hideCurrentSnackBar()
                                ..showSnackBar(
                                  const SnackBar(
                                    content: Text(nicknameSuccessString),
                                    duration: Duration(seconds: 2),
                                  ),
                                );
                            },
                          ),
                        );
                      }
                    },
                    buttonColor: AppColors.primaryColor,
                    borderColor: AppColors.primaryColor,
                    text: continueText,
                  ),
          );
        },
      ),
    );
  }
}
