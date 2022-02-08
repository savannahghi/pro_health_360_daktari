import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';

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
        sink.addError(const UserException(fieldCannotBeEmptyText));
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
        sink.addError(const UserException('Invalid phone number'));
      }
    },
  );

  static bool isValidName(String name) {
    return name.isNotEmpty;
  }

  static bool isValidDate(DateTime date) {
    return date.year <= DateTime.now().year;
  }

  static bool isValidPhone(String value) {
    return value.length > 12 && PhoneNumber.withValue(value).isValid();
  }

  static bool isValidGender(Gender gender) {
    return gender != Gender.unknown;
  }

  static bool isValidCccNumber(String number) {
    // TODO: Find out criteria for valid ccc number
    return number.isNotEmpty;
  }
}
