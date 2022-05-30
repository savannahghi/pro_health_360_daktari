import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mycarehubpro/application/core/theme/app_themes.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_asset_strings.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';
import 'package:mycarehubpro/presentation/core/app_bar/custom_app_bar.dart';
import 'package:mycarehubpro/presentation/onboarding/patient/widgets/patient_details_text_form_field.dart';

class EditGroupInfoPage extends StatefulWidget {
  const EditGroupInfoPage({
    Key? key,
  }) : super(key: key);

  @override
  State<EditGroupInfoPage> createState() => _EditGroupInfoPageState();
}

class _EditGroupInfoPageState extends State<EditGroupInfoPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
                      child: ElevatedButton(
                        child: const Padding(
                          padding: EdgeInsets.all(2.0),
                          child: Text(saveString),
                        ),
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {}
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
