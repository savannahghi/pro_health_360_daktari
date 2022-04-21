import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mycarehubpro/application/core/theme/app_themes.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_asset_strings.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';

class ResumeWithPinPage extends StatefulWidget {
  const ResumeWithPinPage({
    Key? key,
    required this.username,
    required this.onSubmit,
    required this.isLoading,
    required this.logoutCallback,
    this.errorMessage,
  }) : super(key: key);

  final String? errorMessage;
  final bool isLoading;
  final VoidCallback logoutCallback;
  final void Function(String) onSubmit;
  final String username;

  @override
  State<ResumeWithPinPage> createState() => _ResumeWithPinPageState();
}

class _ResumeWithPinPageState extends State<ResumeWithPinPage> {
  final TextEditingController pinTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                SvgPicture.asset(securitySvgAsset),
                const SizedBox(height: 42),
                Text(
                  welcomeBackUserText(widget.username),
                  style: const TextStyle(
                    color: AppColors.resumeWithPinTitleColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  resumeWithPinText,
                  style: TextStyle(
                    color: AppColors.unSelectedReactionIconColor,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 36),
                PINInputField(
                  controller: pinTextController,
                  key: const Key('pin_input_field'),
                  maxLength: 4,
                  onDone: (String value) {
                    pinTextController.text = '';
                    widget.onSubmit(value);
                  },
                ),
                if (widget.isLoading) ...<Widget>[
                  const SizedBox(height: 12),
                  const PlatformLoader()
                ],
                const SizedBox(height: 116),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: MyAfyaHubPrimaryButton(
                    buttonKey: const Key('logout_button'),
                    onPressed: widget.logoutCallback,
                    text: logoutButtonText,
                    textColor: AppColors.primaryColor,
                    borderColor: Colors.transparent,
                    buttonColor: AppColors.primaryColor.withOpacity(0.14),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
