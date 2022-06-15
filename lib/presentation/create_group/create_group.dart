import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mycarehubpro/application/core/services/utils.dart';
import 'package:mycarehubpro/application/core/theme/app_themes.dart';
import 'package:mycarehubpro/application/redux/actions/create_group/create_group_action.dart';
import 'package:mycarehubpro/application/redux/actions/flags/app_flags.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/application/redux/view_models/create_group/create_group_view_model.dart';
import 'package:mycarehubpro/domain/core/entities/create_group/create_group_payload.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_asset_strings.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_enums.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_widget_keys.dart';
import 'package:mycarehubpro/presentation/core/app_bar/custom_app_bar.dart';
import 'package:mycarehubpro/presentation/create_group/create_group_form_manager.dart';
import 'package:mycarehubpro/presentation/onboarding/patient/widgets/patient_details_text_form_field.dart';

class CreateGroupPage extends StatefulWidget {
  const CreateGroupPage({Key? key}) : super(key: key);

  @override
  State<CreateGroupPage> createState() => _CreateGroupPageState();
}

class _CreateGroupPageState extends State<CreateGroupPage> {
  final CreateGroupFormManager _formManager = CreateGroupFormManager();

  Map<String, bool> clientTypeFields = <String, bool>{};
  Map<String, bool> genderFields = <String, bool>{};

  @override
  void initState() {
    super.initState();

    createClientTypeFields();
    createGenderFields();

    _formManager.inLowerBoundAge.add(minimumAge);
    _formManager.inHigherBoundAge.add(maximumAge);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
        title: createGroup,
        showShadow: false,
        showNotificationIcon: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SvgPicture.asset(
                  addNewGroupImage,
                  height: 180,
                ),
                const SizedBox(height: 24),
                Row(
                  children: <Widget>[
                    Flexible(
                      child: StreamBuilder<String>(
                        stream: _formManager.name,
                        builder: (
                          BuildContext context,
                          AsyncSnapshot<String> snapshot,
                        ) {
                          return PatientDetailsTextFormField(
                            textFieldKey: groupNameKey,
                            hintText: groupNameHintText,
                            label: groupName,
                            onChanged: (String value) {
                              _formManager.inName.add(value);
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
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    groupDescription,
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.greyTextColor,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                StreamBuilder<String>(
                  stream: _formManager.description,
                  builder:
                      (BuildContext context, AsyncSnapshot<String> snapshot) {
                    return TextFormField(
                      key: groupDescriptionKey,
                      maxLines: 5,
                      decoration: InputDecoration(
                        hintText: groupDescriptionHintText,
                        hintStyle:
                            const TextStyle(color: AppColors.hintTextColor),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: AppColors.galleryColor,
                      ),
                      onChanged: (String value) {
                        _formManager.inDescription.add(value);
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (String? value) {
                        if (snapshot.hasError) {
                          return (snapshot.error! as UserException).msg;
                        }
                        return null;
                      },
                    );
                  },
                ),
                const SizedBox(height: 24),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    clientTypes,
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.greyTextColor,
                    ),
                  ),
                ),
                Wrap(
                  children: clientTypeFields.entries
                      .map<Widget>((MapEntry<String, bool> entry) {
                    return CheckboxListTile(
                      activeColor: AppColors.primaryColor,
                      selectedTileColor: AppColors.primaryColor,
                      title: Text(entry.key),
                      value: entry.value,
                      onChanged: (bool? value) {
                        setState(() {
                          clientTypeFields[entry.key] = value ?? false;
                        });
                        _formManager.inClientType.add(clientTypeFields);
                      },
                    );
                  }).toList(),
                ),
                const SizedBox(height: 24),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    ageGroup,
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.greyTextColor,
                    ),
                  ),
                ),
                smallVerticalSizedBox,
                Align(
                  alignment: Alignment.topLeft,
                  child: RichText(
                    text: TextSpan(
                      style: normalSize14Text(AppColors.greyTextColor),
                      children: <TextSpan>[
                        const TextSpan(
                          text: enterAgeFromString,
                        ),
                        TextSpan(
                          text: ageConstraintsString,
                          style: veryBoldSize14Text(AppColors.greyTextColor),
                        ),
                      ],
                    ),
                  ),
                ),
                verySmallVerticalSizedBox,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // Lower bound
                      Flexible(
                        child: StreamBuilder<String>(
                          stream: _formManager.lowerBoundAge,
                          builder: (
                            BuildContext context,
                            AsyncSnapshot<String> snapshot,
                          ) {
                            return PatientDetailsTextFormField(
                              textFieldKey: lowerBoundKey,
                              initialValue: minimumAge,
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(2),
                              ],
                              label: fromString,
                              onChanged: (String? value) {
                                _formManager.inLowerBoundAge.add(value ?? '');
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
                      const SizedBox(width: 20),
                      // Higher bound
                      Flexible(
                        child: StreamBuilder<String>(
                          stream: _formManager.higherBoundAge,
                          builder: (
                            BuildContext context,
                            AsyncSnapshot<String> snapshot,
                          ) {
                            return PatientDetailsTextFormField(
                              textFieldKey: higherBoundKey,
                              initialValue: maximumAge,
                              label: toString,
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(10),
                              ],
                              onChanged: (String? value) {
                                _formManager.inHigherBoundAge.add(value ?? '');
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
                ),
                const SizedBox(height: 24),
                Column(
                  children: <Widget>[
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        genders,
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.greyTextColor,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    ...genderFields.entries
                        .map<Widget>((MapEntry<String, bool> entry) {
                      return CheckboxListTile(
                        activeColor: AppColors.primaryColor,
                        selectedTileColor: AppColors.primaryColor,
                        title: Text(entry.key),
                        value: entry.value,
                        onChanged: (bool? value) {
                          setState(() {
                            genderFields[entry.key] = value ?? false;
                          });
                          _formManager.inGender.add(genderFields);
                        },
                      );
                    }).toList(),
                  ],
                ),
                const SizedBox(height: 24),
                Column(
                  children: <Widget>[
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        inviteOnlyText,
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.greyTextColor,
                        ),
                      ),
                    ),
                    StreamBuilder<bool>(
                      stream: _formManager.inviteOnly,
                      builder: (
                        BuildContext context,
                        AsyncSnapshot<bool> snapshot,
                      ) {
                        return CheckboxListTile(
                          key: inviteOnlyKey,
                          activeColor: AppColors.primaryColor,
                          selectedTileColor: AppColors.primaryColor,
                          title: const Text(inviteOnlyText),
                          value: snapshot.data ?? false,
                          onChanged: (bool? value) {
                            if (value != null) {
                              _formManager.inInviteOnly.add(value);
                            }
                          },
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: StreamBuilder<bool>(
                    stream: _formManager.isFormValid,
                    builder: (
                      BuildContext context,
                      AsyncSnapshot<bool> snapshot,
                    ) {
                      final bool isValid = snapshot.data ?? false;

                      return StoreConnector<AppState, CreateGroupViewModel>(
                        converter: (Store<AppState> store) =>
                            CreateGroupViewModel.fromStore(store),
                        builder: (_, CreateGroupViewModel vm) {
                          return ElevatedButton(
                            key: createGroupBtnKey,
                            onPressed: isValid ? () => _submitForm() : null,
                            child: vm.wait.isWaitingFor(createGroupFlag)
                                ? const PlatformLoader(color: Colors.white)
                                : const Text(createGroupText),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void createClientTypeFields() {
    for (final ClientType clientType in ClientType.values) {
      if (clientType != ClientType.YOUTH) {
        clientTypeFields[clientType.name] = false;
      }
    }
  }

  void createGenderFields() {
    for (final Gender gender in Gender.values) {
      if (gender != Gender.unknown) {
        final String key = capitalizeFirst(gender.name);
        genderFields[key] = false;
      }
    }
  }

  void _submitForm() {
    final CreateGroupPayload payload = _formManager.submit();

    StoreProvider.dispatch(
      context,
      CreateGroupAction(
        createGroupPayload: payload,
        client: AppWrapperBase.of(context)!.graphQLClient,
        onSuccess: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(registerGroupSuccess),
              duration: Duration(seconds: 5),
            ),
          );

          Navigator.of(context).pop();
        },
      ),
    );
  }
}
