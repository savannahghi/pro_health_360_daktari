// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:flutter_svg/flutter_svg.dart';

// Project imports:
import 'package:mycarehubpro/domain/core/value_objects/app_asset_strings.dart';

class SurveyLinkInputWidget extends StatelessWidget {
  const SurveyLinkInputWidget({
    Key? key,
    this.color,
    this.enabled,
    this.controller,
    this.onSaved,
    this.onTap,
    this.labelText,
    this.hintText,
    this.initialValue,
    required this.onChanged,
    this.onFieldSubmit,
    this.focusNode,
    this.keyboardType,
    this.formatters,
    this.maxLines,
    this.maxLength,
    this.textStyle,
    this.suffixIcon,
    this.isSearchField = false,
    this.obscureText,
    this.autoValidate = false,
    this.isSearchFieldSmall = false,
    this.autoFocus,
    this.inputFormatters,
    this.prefixIcon,
    this.textInputAction,
    this.customFillColor,
    this.hintColor,
    this.hintTextColor,
    this.borderColor,
    this.textFieldBackgroundColor,
    this.decoration,
    this.fieldKey,
  }) : super(key: key);

  final bool? autoFocus;
  final bool? autoValidate;
  final Color? borderColor;
  final Color? color;
  final TextEditingController? controller;
  final Color? customFillColor;
  final InputDecoration? decoration;
  final bool? enabled;
  final Key? fieldKey;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? formatters;
  final Color? hintColor;
  final String? hintText;
  final Color? hintTextColor;
  final String? initialValue;
  final List<TextInputFormatter>? inputFormatters;
  final bool isSearchField;
  final bool isSearchFieldSmall;
  final TextInputType? keyboardType;
  final String? labelText;
  final int? maxLength;
  final int? maxLines;
  final bool? obscureText;
  final ValueChanged<String> onChanged;
  final ValueChanged<String>? onFieldSubmit;
  final FormFieldSetter<String>? onSaved;
  final VoidCallback? onTap;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? textFieldBackgroundColor;
  final TextInputAction? textInputAction;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: Colors.white.withOpacity(0.3),
          ),
        ),
        child: TextFormField(
          key: fieldKey,
          enabled: enabled ?? true,
          maxLines: maxLines,
          maxLength: maxLength,
          autovalidateMode: autoValidate ?? false
              ? AutovalidateMode.always
              : AutovalidateMode.disabled,
          initialValue: initialValue,
          decoration: decoration ??
              InputDecoration(
                alignLabelWithHint: alignLabelWithHint(maxLines),
                contentPadding: isSearchField
                    ? const EdgeInsets.all(20)
                    : EdgeInsets.symmetric(
                        vertical: isSearchFieldSmall ? 10 : 15,
                        horizontal: 15,
                      ),
                labelText: labelText,
                hintText: hintText,
                hintStyle: Theme.of(context).textTheme.headline4!.copyWith(
                      color: hintColor ?? Colors.grey,
                      fontSize: 16,
                    ),
                suffixIcon: GestureDetector(
                  onTap: onTap,
                  child: SvgPicture.asset(
                    shareIconSvgPath,
                    height: 18,
                    width: 16,
                  ),
                ),
                suffixIconConstraints:
                    const BoxConstraints(minHeight: 24, minWidth: 24),
                border: InputBorder.none,
                prefixIcon: prefixIcon,
                labelStyle: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: Colors.grey, fontSize: 16),
                focusColor: Colors.grey,
              ),
          cursorColor: Colors.grey,
          autofocus: autoFocus ?? false,
          style: textStyle ??
              Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: Colors.black, fontSize: 14),
          onFieldSubmitted: onFieldSubmit,
          textInputAction: textInputAction ?? TextInputAction.done,
          textAlignVertical: TextAlignVertical.center,
          onChanged: onChanged,
          onSaved: onSaved,
          controller: controller,
          focusNode: focusNode,
          obscureText: obscureText ?? false,
          keyboardType: keyboardType ?? TextInputType.text,
          inputFormatters: inputFormatters,
        ),
      ),
    );
  }
}
