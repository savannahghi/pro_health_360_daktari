import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myharehubpro/application/core/services/utils.dart';
import 'package:myharehubpro/application/core/theme/app_themes.dart';
import 'package:myharehubpro/application/redux/actions/create_group/create_group_action.dart';
import 'package:myharehubpro/domain/core/value_objects/app_asset_strings.dart';
import 'package:myharehubpro/domain/core/value_objects/app_enums.dart';
import 'package:myharehubpro/domain/core/value_objects/app_strings.dart';
import 'package:myharehubpro/domain/core/value_objects/app_widget_keys.dart';
import 'package:myharehubpro/presentation/core/app_bar/custom_app_bar.dart';
import 'package:myharehubpro/presentation/create_group/create_group_form_manager.dart';
import 'package:myharehubpro/domain/core/entities/create_group/create_group_payload.dart';
import 'package:myharehubpro/presentation/onboarding/patient/widgets/patient_details_text_form_field.dart';
import 'package:shared_themes/spaces.dart';

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
                      decoration: const InputDecoration(
                        border: InputBorder.none,
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
                Row(
                  children: <Widget>[
                    // Age
                    Flexible(
                      child: Column(
                        children: <Widget>[
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
                          StreamBuilder<RangeValues>(
                            stream: _formManager.ageRange,
                            builder: (
                              BuildContext context,
                              AsyncSnapshot<RangeValues> snapshot,
                            ) {
                              final RangeValues? data = snapshot.data;

                              final String lowerAge = data?.start.toString() ??
                                  minimumAge.toString();

                              final String higherAge =
                                  data?.end.toString() ?? maximumAge.toString();

                              return Row(
                                children: <Widget>[
                                  Text(lowerAge),
                                  Expanded(
                                    child: RangeSlider(
                                      key: ageRangeSlider,
                                      values: data ??
                                          const RangeValues(
                                            minimumAge,
                                            maximumAge,
                                          ),
                                      min: minimumAge,
                                      max: maximumAge,
                                      divisions: 10,
                                      labels: RangeLabels(lowerAge, higherAge),
                                      onChanged: (RangeValues values) {
                                        _formManager.inAgeRange.add(values);
                                      },
                                    ),
                                  ),
                                  Text(higherAge)
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
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

                      return ElevatedButton(
                        key: createGroupBtnKey,
                        onPressed: isValid ? () => _submitForm() : null,
                        style: ElevatedButton.styleFrom(
                          primary: AppColors.primaryColor,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(createGroupText),
                        ),
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
