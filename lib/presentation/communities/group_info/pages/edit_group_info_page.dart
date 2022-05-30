import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mycarehubpro/application/core/theme/app_themes.dart';
import 'package:mycarehubpro/application/redux/actions/communities/update_group_info_action.dart';
import 'package:mycarehubpro/application/redux/actions/flags/app_flags.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_asset_strings.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';
import 'package:mycarehubpro/presentation/communities/view_models/group_info_view_model.dart';
import 'package:mycarehubpro/presentation/core/app_bar/custom_app_bar.dart';
import 'package:mycarehubpro/presentation/onboarding/patient/widgets/patient_details_text_form_field.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class EditGroupInfoPage extends StatefulWidget {
  const EditGroupInfoPage({
    Key? key,
  }) : super(key: key);

  @override
  State<EditGroupInfoPage> createState() => _EditGroupInfoPageState();
}

class _EditGroupInfoPageState extends State<EditGroupInfoPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _groupNameController = TextEditingController();
  final TextEditingController _groupDescriptionController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Channel channel = StreamChannel.of(context).channel;

    String channelName = '';
    String description = '';

    if (channel.extraData.containsKey('Name')) {
      channelName = channel.extraData['Name']! as String;
    }

    if (channel.extraData.containsKey('Description')) {
      description = channel.extraData['Description']! as String;
    }

    _groupNameController.text = channelName;
    _groupDescriptionController.text = description;

    return Scaffold(
      appBar: const CustomAppBar(showShadow: false),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SvgPicture.asset(
                groupInfoImage,
                height: 200.0,
                width: 200.0,
              ),
              Text(
                getEditTitle,
                style: boldSize20Text(AppColors.lightBlackTextColor),
              ),
              const SizedBox(height: 26),
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    PatientDetailsTextFormField(
                      controller: _groupNameController,
                      textFieldKey: const Key('group_name'),
                      hintText: nameOfGroupText,
                      label: groupName,
                      onChanged: (String value) {},
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return emptyFieldErrorText;
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 26),
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
                    TextFormField(
                      controller: _groupDescriptionController,
                      key: const Key('group_description_key'),
                      maxLines: 5,
                      decoration: InputDecoration(
                        hintText: describeGroupText,
                        hintStyle:
                            const TextStyle(color: AppColors.hintTextColor),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: AppColors.galleryColor,
                      ),
                      onChanged: (String value) {},
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return emptyFieldErrorText;
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: StoreConnector<AppState, GroupInfoViewModel>(
                        converter: (Store<AppState> store) =>
                            GroupInfoViewModel.fromStore(store),
                        builder: (BuildContext context, GroupInfoViewModel vm) {
                          return ElevatedButton(
                            child: vm.wait.isWaitingFor(updateGroupInfoFlag)
                                ? const PlatformLoader()
                                : const Text(saveString),
                            onPressed: () {
                              if (_formKey.currentState?.validate() ?? false) {
                                final String groupName =
                                    _groupNameController.text;
                                final String groupDescription =
                                    _groupDescriptionController.text;

                                StoreProvider.dispatch(
                                  context,
                                  UpdateGroupInfoAction(
                                    groupName: groupName,
                                    groupDescription: groupDescription,
                                    channel: channel,
                                    onSuccess: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                );
                              }
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Container(
                decoration: BoxDecoration(
                  color: warningColor.withOpacity(0.14),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      deleteGroupText,
                      style: boldSize18Text(warningColor),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      deleteGroupWarning,
                      style: normalSize14Text(AppColors.grey50),
                    ),
                    const SizedBox(height: 14),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          backgroundColor: warningColor,
                          primary: warningColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          deleteGroupText,
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {},
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
