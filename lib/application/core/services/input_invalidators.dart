import 'package:healthcloud/domain/core/value_objects/app_strings.dart';

RegExp validNumberRegexp = RegExp(r'^-?[0-9]+$');

class InputValidators {
  /// check if the value contains only numbers
  static bool isNumeric(String value) {
    return validNumberRegexp.hasMatch(value);
  }

  /// Validates a user PIN
  ///
  /// The [value] is the PIN entered by the user
  ///
  /// [initiallyEnteredPin] is used in the case of
  /// verifying an already entered PIN
  static String? validatePin({
    required String? value,
    String? initiallyEnteredPin,
  }) {
    if (value == null || value.isEmpty) {
      return confirmPinPrompt;
    }
    if (!isNumeric(value)) {
      return loginPinDigits;
    }
    if (value.length < 4) {
      return loginPinLength;
    }

    if (initiallyEnteredPin != null) {
      if (value != initiallyEnteredPin) {
        return confirmPinMatch;
      }
    }
    return null;
  }
}
