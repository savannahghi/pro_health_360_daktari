import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/actions/retrieve_facility_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/set_facility_contact_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/view_models/app_state_view_model.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_asset_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/presentation/core/app_bar/custom_app_bar.dart';
import 'package:shared_themes/constants.dart';

class AddFacilityContactPage extends StatefulWidget {
  final String phoneNumber;

  const AddFacilityContactPage({
    required this.phoneNumber,
  });

  @override
  State<AddFacilityContactPage> createState() => _AddFacilityContactPageState();
}

class _AddFacilityContactPageState extends State<AddFacilityContactPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String newPhoneNumber = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: addFacilityContactString,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: Column(
          children: <Widget>[
            SvgPicture.asset(
              facilityContactZeroStateSvgPath,
            ),
            mediumVerticalSizedBox,
            Text(
              addFacilityContactDescriptionString,
              style: normalSize14Text(darkGreyTextColor),
              textAlign: TextAlign.center,
            ),
            mediumVerticalSizedBox,
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                facilityPhoneNumberString,
                style: normalSize14Text(darkGreyTextColor),
                textAlign: TextAlign.center,
              ),
            ),
            smallVerticalSizedBox,
            Form(
              key: _formKey,
              child: TextFormField(
                initialValue: widget.phoneNumber.isNotEmpty &&
                        widget.phoneNumber != UNKNOWN
                    ? widget.phoneNumber
                    : null,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(12),
                ],
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: enterPhoneNumberString,
                  hintStyle: const TextStyle(color: AppColors.hintTextColor),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.all(8.0),
                ),
                onChanged: (String value) => setState(() {
                  newPhoneNumber = value;
                }),
                validator: (String? value) {
                  if ((value?.length ?? 0) < 10) {
                    return invalidPhoneNumber;
                  }
                  return null;
                },
              ),
            ),
            const Spacer(),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: double.infinity,
                child: StoreConnector<AppState, AppStateViewModel>(
                  converter: (Store<AppState> store) =>
                      AppStateViewModel.fromStore(store),
                  builder: (BuildContext context, AppStateViewModel vm) {
                    return vm.state.wait
                                ?.isWaitingFor(addFacilityContactFlag) ??
                            false
                        ? const PlatformLoader()
                        : ElevatedButton(
                            onPressed: newPhoneNumber.isNotEmpty &&
                                    newPhoneNumber != widget.phoneNumber
                                ? () {
                                    final bool? isFormValid =
                                        _formKey.currentState?.validate();
                                    if (isFormValid ?? false) {
                                      StoreProvider.dispatch<AppState>(
                                        context,
                                        SetFacilityContactAction(
                                          client: AppWrapperBase.of(context)!
                                              .graphQLClient,
                                          onSuccess: () {
                                            ScaffoldMessenger.of(context)
                                              ..hideCurrentSnackBar()
                                              ..showSnackBar(
                                                const SnackBar(
                                                  content: Text(
                                                    contactUpdateSuccessfulString,
                                                  ),
                                                  duration: Duration(
                                                    seconds:
                                                        kShortSnackBarDuration,
                                                  ),
                                                ),
                                              );
                                            StoreProvider.dispatch<AppState>(
                                              context,
                                              RetrieveFacilityAction(
                                                client:
                                                    AppWrapperBase.of(context)!
                                                        .graphQLClient,
                                              ),
                                            );
                                            Navigator.pop(context);
                                          },
                                          onError: (String message) {
                                            ScaffoldMessenger.of(context)
                                              ..hideCurrentSnackBar()
                                              ..showSnackBar(
                                                SnackBar(
                                                  content: Text(message),
                                                  duration: const Duration(
                                                    seconds:
                                                        kShortSnackBarDuration,
                                                  ),
                                                ),
                                              );
                                          },
                                          phone: newPhoneNumber,
                                        ),
                                      );
                                    }
                                  }
                                : null,
                            child: const Text(saveContactString),
                          );
                  },
                ),
              ),
            ),
            mediumVerticalSizedBox,
          ],
        ),
      ),
    );
  }
}
