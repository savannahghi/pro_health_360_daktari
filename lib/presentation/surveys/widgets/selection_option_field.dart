import 'package:flutter/material.dart';
import 'package:healthcloud/application/core/theme/app_themes.dart';

class SelectOptionField extends StatelessWidget {
  /// [SelectOptionField] customized for selection options.
  ///
  /// This widget can be used in dropdown buttons and select option fields
  ///
  /// EXAMPLE:
  /// ```dart
  ///  SelectOptionField(
  ///    hintText: 'Select gender',
  ///    context: context,
  ///    value: _selectedGender,
  ///    focusNode: _gender,
  ///    options: ['Male', 'Female', 'Unknown', 'Other'],
  ///    validator: (dynamic value) {
  ///       if (value.isEmpty || value == null) {
  ///       return 'Next of kin gender is required';
  ///       }
  ///      return null;
  ///     },
  ///    onChanged: (dynamic value) {},
  ///    onSaved: (dynamic value) {},
  ///  ),
  /// ```
  const SelectOptionField({
    this.onSaved,
    required this.options,
    this.value,
    required this.dropDownInputKey,
    this.hintText,
    this.onChanged,
    this.color,
    bool? disabled,
  }) : this.disabled = disabled ?? false;

  final Color? color;
  final bool disabled;
  final Key dropDownInputKey;
  final String? hintText;
  final FormFieldSetter<String>? onChanged;
  final FormFieldSetter<String>? onSaved;
  final List<String> options;

  final String? value;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        color: disabled ? Colors.grey[200] : AppColors.inputBackgroundColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: InputDecorator(
        decoration: InputDecoration(
          fillColor: Colors.white,
          focusColor: AppColors.secondaryColor,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          enabledBorder: disabled
              ? null
              : OutlineInputBorder(
                  borderSide: BorderSide(color: color ?? Colors.grey),
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.secondaryColor),
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[200]!),
            borderRadius: const BorderRadius.all(Radius.circular(5)),
          ),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            key: dropDownInputKey,
            dropdownColor: Colors.white,
            hint: hintText != null
                ? Text(
                    hintText!,
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(color: Colors.grey, fontSize: 16),
                  )
                : null,
            value: value,
            items: options.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                key: ValueKey<String>(value),
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: onChanged,
            isDense: true,
          ),
        ),
      ),
    );
  }
}
