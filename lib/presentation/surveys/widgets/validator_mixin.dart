import 'dart:async';
import 'package:async_redux/async_redux.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';

mixin Validator {
  final StreamTransformer<String, String> validateAgeRange =
      StreamTransformer<String, String>.fromHandlers(
    handleData: (String value, EventSink<String> sink) {
      if (isValidAgeRange(value)) {
        sink.add(value);
      } else {
        sink.addError(const UserException(ageMustBeWithinRange));
      }
    },
  );
  static bool isValidAgeRange(String age) {
    final int convertedAge = int.tryParse(age) ?? 0;

    return convertedAge > 13 && convertedAge < 26;
  }
}
