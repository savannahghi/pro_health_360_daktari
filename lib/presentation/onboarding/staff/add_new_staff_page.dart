import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mycarehubpro/application/core/services/utils.dart';
import 'package:mycarehubpro/application/core/theme/app_themes.dart';
import 'package:mycarehubpro/application/redux/actions/flags/app_flags.dart';
import 'package:mycarehubpro/application/redux/actions/register_staff/register_staff_action.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/application/redux/view_models/register_staff/register_staff_view_model.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_asset_strings.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_enums.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_widget_keys.dart';
import 'package:mycarehubpro/presentation/core/app_bar/custom_app_bar.dart';
import 'package:mycarehubpro/presentation/onboarding/patient/register_staff_form_manager.dart';
import 'package:mycarehubpro/presentation/onboarding/patient/widgets/facility_dropdown.dart';
import 'package:mycarehubpro/presentation/onboarding/patient/widgets/patient_details_text_form_field.dart';
import 'package:intl/intl.dart';
import 'package:shared_themes/spaces.dart';

class AddNewStaffPage extends StatefulWidget {
  const AddNewStaffPage({Key? key}) : super(key: key);

  @override
  State<AddNewStaffPage> createState() => _AddNewStaffPageState();
}

class _AddNewStaffPageState extends State<AddNewStaffPage> {
  final RegisterStaffFormManager _formManager = RegisterStaffFormManager();
  final TextEditingController dobTextController = TextEditingController();

  final InputDecoration dropdownDecoration = InputDecoration(
    filled: true,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    enabledBorder: const UnderlineInputBorder(
      borderSide: BorderSide(color: Color(0x00eeeeee)),
    ),
  );

  @override
  void initState() {
    super.initState();
    _formManager.inGender.add(Gender.other);
    _formManager.inRole.add(RoleValue.CLIENT_MANAGEMENT);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
        title: 'Add new staff',
        showShadow: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SvgPicture.asset(
                  addNewStaffImageSvg,
                  height: 180,
                ),
                const SizedBox(height: 24),
                Row(
                  children: <Widget>[
                    // First name
                    Flexible(
                      child: StreamBuilder<String>(
                        stream: _formManager.firstName,
                        builder: (
                          BuildContext context,
                          AsyncSnapshot<String> snapshot,
                        ) {
                          return PatientDetailsTextFormField(
                            textFieldKey: firstNameKey,
                            label: firstNameLabel,
                            onChanged: (String value) {
                              _formManager.inFirstName.add(value);
                            },
                            validator: (String? value) {
                              if (snapshot.hasError) {
                                return (snapshot.error! as UserException).msg;
                              }
                              return null;
                            },
                          );
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    // Last name
                    Flexible(
                      child: StreamBuilder<String>(
                        stream: _formManager.lastName,
                        builder: (
                          BuildContext context,
                          AsyncSnapshot<String> snapshot,
                        ) {
                          return PatientDetailsTextFormField(
                            textFieldKey: lastNameKey,
                            label: lastNameLabel,
                            onChanged: (String value) {
                              _formManager.inLastName.add(value);
                            },
                            validator: (String? value) {
                              if (snapshot.hasError) {
                                return (snapshot.error! as UserException).msg;
                              }
                              return null;
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                // Facility
                Row(
                  children: <Widget>[
                    Flexible(
                      child: FacilityDropdown(
                        dropdownInputKey: facilitySelectOptionFieldKey,
                        label: facilityLabel,
                        stream: _formManager.facility,
                        onChanged: (String? value) {
                          if (value != null) {
                            _formManager.inFacility.add(value);
                          }
                        },
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 24),
                Row(
                  children: <Widget>[
                    // Birth date
                    Flexible(
                      child: Column(
                        children: <Widget>[
                          const Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              birthDateLabel,
                              style: TextStyle(
                                fontSize: 14,
                                color: AppColors.greyTextColor,
                              ),
                            ),
                          ),
                          smallVerticalSizedBox,
                          DatePickerField(
                            allowCurrentYear: true,
                            gestureDateKey: dobKey,
                            controller: dobTextController,
                            decoration: InputDecoration(
                              suffixIcon: const Icon(Icons.date_range),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              contentPadding: const EdgeInsets.all(8.0),
                            ),
                            style:
                                const TextStyle(color: AppColors.greyTextColor),
                            onChanged: (String? value) {
                              if (value != null) {
                                final DateTime date =
                                    DateFormat(datePickerFormat)
                                        .parseLoose(value);
                                _formManager.inDateOfBirth.add(date);
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    // Gender dropdown
                    Flexible(
                      child: Column(
                        children: <Widget>[
                          const Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              genderLabel,
                              style: TextStyle(
                                fontSize: 14,
                                color: AppColors.greyTextColor,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          StreamBuilder<Gender>(
                            stream: _formManager.gender,
                            builder: (
                              BuildContext context,
                              AsyncSnapshot<Gender> snapshot,
                            ) {
                              final Gender? data = snapshot.data;

                              return SelectOptionField(
                                decoration: dropdownDecoration,
                                dropDownInputKey: genderOptionFieldKey,
                                value: data == null
                                    ? capitalizeFirst(
                                        describeEnum(Gender.other),
                                      )
                                    : capitalizeFirst(data.name),
                                options: getGenderList(),
                                onChanged: (String? value) {
                                  if (value != null) {
                                    _formManager.inGender
                                        .add(genderFromJson(value));
                                  }
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 24),
                // Phone number
                Row(
                  children: <Widget>[
                    Flexible(
                      child: Column(
                        children: <Widget>[
                          const Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Phone Number *',
                              style: TextStyle(
                                fontSize: 14,
                                color: AppColors.greyTextColor,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          StreamBuilder<String>(
                            stream: _formManager.phoneNumber,
                            builder: (
                              BuildContext context,
                              AsyncSnapshot<String> snapshot,
                            ) {
                              return MyAfyaHubPhoneInput(
                                textFormFieldKey: staffNumberField,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide.none,
                                  ),
                                  filled: true,
                                  contentPadding: const EdgeInsets.all(8.0),
                                ),
                                style: const TextStyle(
                                  color: AppColors.greyTextColor,
                                ),
                                onChanged: (String? value) {
                                  if (value != null) {
                                    _formManager.inPhoneNumber.add(value);
                                  }
                                },
                                phoneNumberFormatter: formatPhoneNumber,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                // ID number
                Row(
                  children: <Widget>[
                    Flexible(
                      child: StreamBuilder<String>(
                        stream: _formManager.idNumber,
                        builder: (_, AsyncSnapshot<String> snapshot) {
                          return PatientDetailsTextFormField(
                            textFieldKey: const Key('id_number_key'),
                            label: 'ID number *',
                            onChanged: (String value) {
                              _formManager.inIdNumber.add(value);
                            },
                            validator: (String? value) {
                              if (snapshot.hasError) {
                                return (snapshot.error! as UserException).msg;
                              }
                              return null;
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                // staff number
                Row(
                  children: <Widget>[
                    Flexible(
                      child: StreamBuilder<String>(
                        stream: _formManager.staffNumber,
                        builder: (_, AsyncSnapshot<String> snapshot) {
                          return PatientDetailsTextFormField(
                            textFieldKey: const Key('staff_number_key'),
                            label: 'Staff number *',
                            onChanged: (String value) {
                              _formManager.inStaffNumber.add(value);
                            },
                            validator: (String? value) {
                              if (snapshot.hasError) {
                                return (snapshot.error! as UserException).msg;
                              }
                              return null;
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                // Role
                Row(
                  children: <Widget>[
                    Flexible(
                      child: Column(
                        children: <Widget>[
                          const Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Staff roles *',
                              style: TextStyle(
                                fontSize: 14,
                                color: AppColors.greyTextColor,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          StreamBuilder<RoleValue>(
                            stream: _formManager.role,
                            builder: (_, AsyncSnapshot<RoleValue> snapshot) {
                              final RoleValue? data = snapshot.data;

                              return SelectOptionField(
                                decoration: dropdownDecoration,
                                dropDownInputKey: const Key('role_key'),
                                value: data == null
                                    ? capitalizeFirst(
                                        RoleValue.CLIENT_MANAGEMENT.name,
                                      )
                                    : capitalizeFirst(data.name),
                                options: getRoleList(),
                                onChanged: (String? value) {
                                  if (value != null) {
                                    _formManager.inRole
                                        .add(_roleValueFromString(value));
                                  }
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Row(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          proInviteText,
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.greyTextColor,
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            StreamBuilder<bool>(
                              stream: _formManager.inviteClient,
                              builder: (
                                BuildContext context,
                                AsyncSnapshot<bool> snapshot,
                              ) {
                                final bool? data = snapshot.data;

                                return Checkbox(
                                  key: myAfyaHubInviteKey,
                                  activeColor: AppColors.primaryColor,
                                  value: data ?? false,
                                  onChanged: (bool? value) {
                                    if (value != null) {
                                      _formManager.inInviteClient.add(value);
                                    }
                                  },
                                );
                              },
                            ),
                            const Text(myCareHubInviteText),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // Submit button
                    SizedBox(
                      width: double.infinity,
                      child: StreamBuilder<bool>(
                        stream: _formManager.isFormValid,
                        builder: (_, AsyncSnapshot<bool> snapshot) {
                          final bool hasData =
                              snapshot.hasData && snapshot.data != null;

                          return StoreConnector<AppState,
                              RegisterStaffViewModel>(
                            converter: (Store<AppState> store) =>
                                RegisterStaffViewModel.fromStore(store),
                            builder: (_, RegisterStaffViewModel vm) {
                              if (vm.wait.isWaitingFor(registerStaffFlag)) {
                                return const PlatformLoader();
                              }

                              return SizedBox(
                                height: 48,
                                child: ElevatedButton(
                                  key: const Key('staffRegisterButton'),
                                  onPressed: hasData && snapshot.data!
                                      ? () =>
                                          _processAndNavigate(vm.hasConnection)
                                      : null,
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.all(8),
                                  ),
                                  child: const Text(registerBtnText),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<String> getGenderList() {
    final List<String> result = <String>[];

    for (final Gender gender in Gender.values) {
      if (gender != Gender.unknown) {
        result.add(capitalizeFirst(describeEnum(gender)));
      }
    }

    return result;
  }

  List<String> getRoleList() {
    final List<String> result = <String>[];

    for (final RoleValue role in RoleValue.values) {
      result.add(capitalizeFirst(role.name));
    }

    return result;
  }

  RoleValue _roleValueFromString(String? roleString) {
    if (roleString == null || roleString.isEmpty || roleString == UNKNOWN) {
      return RoleValue.CONTENT_MANAGEMENT;
    }

    return RoleValue.values.firstWhere((RoleValue role) {
      return role.name.toLowerCase() == roleString.toLowerCase();
    });
  }

  void _processAndNavigate(bool hasConnection) {
    if (!hasConnection) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: const Text(
              connectionLostText,
            ),
            duration: const Duration(seconds: 5),
            action: dismissSnackBar(
              closeString,
              Colors.white,
              context,
            ),
          ),
        );

      return;
    }

    StoreProvider.dispatch(
      context,
      RegisterStaffAction(
        registerStaffPayload: _formManager.submit(),
        client: AppWrapperBase.of(context)!.graphQLClient,
        onSuccess: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(registerStaffSuccess),
              duration: Duration(seconds: 5),
            ),
          );

          Navigator.of(context).pop();
        },
      ),
    );
  }
}
