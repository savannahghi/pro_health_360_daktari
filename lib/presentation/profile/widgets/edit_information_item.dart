import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';

class EditInformationItem {
  EditInformationItem({
    required this.title,
    required this.editInformationInputItem,
    this.description,
  });

  final String title;
  final String? description;
  final List<EditInformationInputItem> editInformationInputItem;
}

class EditInformationInputItem {
  EditInformationInputItem({
    required this.fieldName,
    required this.hintText,
    required this.inputType,
    required this.inputController,
    this.dropDownOptionList,
    String? apiFieldValue,
  })   // Asserts that the dropDown cannot be null if it is a dropdown
  : assert(
          inputType == EditInformationInputType.DropDown
              ? dropDownOptionList != null && dropDownOptionList.isNotEmpty
              : dropDownOptionList == null,
        ),
        apiFieldValue = apiFieldValue ?? fieldName;

  final String fieldName;
  final String hintText;
  final EditInformationInputType inputType;
  final TextEditingController inputController;
  final List<String>? dropDownOptionList;
  final String apiFieldValue;
}
