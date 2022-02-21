import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:healthcloud/application/core/services/utils.dart';
import 'package:healthcloud/application/core/theme/app_themes.dart';
import 'package:healthcloud/domain/core/value_objects/app_asset_strings.dart';
import 'package:healthcloud/domain/core/value_objects/app_enums.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:healthcloud/domain/core/value_objects/app_widget_keys.dart';
import 'package:healthcloud/presentation/core/app_bar/custom_app_bar.dart';
import 'package:healthcloud/presentation/create_group/create_group_form_manager.dart';
import 'package:healthcloud/presentation/onboarding/patient/widgets/patient_details_text_form_field.dart';
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

                              return RangeSlider(
                                key: ageRangeSlider,
                                values: data ?? const RangeValues(15, 25),
                                min: 15,
                                max: 25,
                                divisions: 10,
                                labels: RangeLabels(
                                  data?.start.toString() ??
                                      minimumAge.toString(),
                                  data?.end.toString() ?? maximumAge.toString(),
                                ),
                                onChanged: (RangeValues values) {
                                  _formManager.inAgeRange.add(values);
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
                Row(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // Submit button
                        Row(
                          children: <Widget>[
                            Container(
                              padding: const EdgeInsets.only(left: 24),
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: StreamBuilder<bool>(
                                stream: _formManager.isFormValid,
                                builder: (
                                  BuildContext context,
                                  AsyncSnapshot<bool> snapshot,
                                ) {
                                  final bool isValid = snapshot.data ?? false;

                                  return ElevatedButton(
                                    key: createGroupBtnKey,
                                    onPressed:
                                        isValid ? () => _submitForm() : null,
                                    style: ElevatedButton.styleFrom(
                                      primary: AppColors.secondaryColor,
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
                      ],
                    ),
                  ],
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
      clientTypeFields[clientType.name] = false;
    }
  }

  void createGenderFields() {
    for (final Gender gender in Gender.values) {
      final String key = capitalizeFirst(gender.name);
      genderFields[key] = false;
    }
  }

  void _submitForm() {
    _formManager.submit();

    Navigator.of(context).pop();
  }
}
