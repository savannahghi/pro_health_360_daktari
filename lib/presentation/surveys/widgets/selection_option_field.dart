import 'package:flutter/material.dart';

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
    this.validator,
    this.decoration,
  });

  final Color? color;
  final Key dropDownInputKey;
  final String? hintText;
  final FormFieldSetter<String>? onChanged;
  final FormFieldSetter<String>? onSaved;
  final List<String> options;
  final FormFieldValidator<String>? validator;
  final InputDecoration? decoration;

  final String? value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: DropdownButtonFormField<String>(
        key: dropDownInputKey,
        decoration: decoration,
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
        validator: validator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
      ),
    );
  }
}
