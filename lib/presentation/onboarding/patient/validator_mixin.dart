import 'dart:async';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';

mixin Validator {
  final StreamTransformer<String, String> validateName =
      StreamTransformer<String, String>.fromHandlers(
    handleData: (String value, EventSink<String> sink) {
      if (isValidName(value)) {
        sink.add(value);
      } else {
        sink.addError(const UserException(fieldCannotBeEmptyText));
      }
    },
  );

  final StreamTransformer<String, String> validateCcc =
      StreamTransformer<String, String>.fromHandlers(
    handleData: (String value, EventSink<String> sink) {
      if (isValidCccNumber(value)) {
        sink.add(value);
      } else {
        sink.addError(const UserException(enterAValidCCCNumberText));
      }
    },
  );

  final StreamTransformer<DateTime, DateTime> validateDate =
      StreamTransformer<DateTime, DateTime>.fromHandlers(
    handleData: (DateTime value, EventSink<DateTime> sink) {
      if (isValidDate(value)) {
        sink.add(value);
      } else {
        sink.addError(const UserException('Date cannot be future date'));
      }
    },
  );

  final StreamTransformer<Gender, Gender> validateGender =
      StreamTransformer<Gender, Gender>.fromHandlers(
    handleData: (Gender value, EventSink<Gender> sink) {
      if (isValidGender(value)) {
        sink.add(value);
      } else {
        sink.addError(const UserException('Unknown not allowed'));
      }
    },
  );

  final StreamTransformer<String, String> validatePhoneNumbers =
      StreamTransformer<String, String>.fromHandlers(
    handleData: (String value, EventSink<String> sink) {
      if (isValidPhone(value)) {
        sink.add(value);
      } else {
        sink.addError(const UserException(invalidPhoneNumber));
      }
    },
  );
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

  static bool isValidName(String name) {
    return name.isNotEmpty && name != UNKNOWN;
  }

  static bool isValidAgeRange(String age) {
    final int convertedAge = int.tryParse(age) ?? 0;

    return convertedAge > 13 && convertedAge < 26;
  }

  static bool isValidDate(DateTime date) {
    return date.year <= DateTime.now().year;
  }

  static bool isValidPhone(String value) {
    return PhoneNumber.withValue(value).isValid();
  }

  static bool isValidGender(Gender gender) {
    return gender != Gender.unknown;
  }

  static bool isValidCccNumber(String number) {
    final int length = number.length;
    return number.isNotEmpty && length >= 7 && length <= 10;
  }
}
