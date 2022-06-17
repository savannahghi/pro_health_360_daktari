import 'dart:async';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';
import 'package:mycarehubpro/presentation/onboarding/patient/validator_mixin.dart';
import 'package:rxdart/rxdart.dart';

void main() {
  group('Validator', () {
    test('validateName works correctly', () async {
      final BehaviorSubject<String> fnameSubject = BehaviorSubject<String>();
      final TestClass testClass = TestClass(firstNameSubject: fnameSubject);

      testClass.inFirstName?.add('John');
      await expectLater(testClass.firstName, emits('John'));

      testClass.inFirstName?.add('');
      await expectLater(
        testClass.firstName,
        emitsError(const UserException(fieldCannotBeEmptyText)),
      );

      fnameSubject.close();
    });

    test('validateCcc works correctly', () async {
      final BehaviorSubject<String> cccSubject = BehaviorSubject<String>();
      final TestClass testClass = TestClass(cccNumberSubject: cccSubject);

      testClass.inCccNumber?.add('12345678');
      await expectLater(testClass.cccNumber, emits('12345678'));

      testClass.inCccNumber?.add('');
      await expectLater(
        testClass.cccNumber,
        emitsError(const UserException(enterAValidCCCNumberText)),
      );

      cccSubject.close();
    });

    test('validateCccNumber works correctly', () async {
      final BehaviorSubject<String> fnameSubject = BehaviorSubject<String>();
      final TestClass testClass = TestClass(firstNameSubject: fnameSubject);

      testClass.inFirstName?.add('John');
      await expectLater(testClass.firstName, emits('John'));

      testClass.inFirstName?.add('');
      await expectLater(
        testClass.firstName,
        emitsError(const UserException(fieldCannotBeEmptyText)),
      );

      fnameSubject.close();
    });

    test('validateDate should work appropriately', () async {
      final BehaviorSubject<DateTime> dobSubject = BehaviorSubject<DateTime>();
      final TestClass testClass = TestClass(dateOfBirthSubject: dobSubject);

      final DateTime now = DateTime.now();
      final DateTime futureDate = DateTime(now.year + 1, now.month, now.day);

      testClass.inDateOfBirth?.add(now);
      await expectLater(testClass.dateOfBirth, emits(now));

      testClass.inDateOfBirth?.add(futureDate);
      await expectLater(
        testClass.dateOfBirth,
        emitsError(const UserException('Date cannot be future date')),
      );
      dobSubject.close();
    });

    test('validateGender should work appropriately', () async {
      final BehaviorSubject<Gender> genderSubject = BehaviorSubject<Gender>();
      final TestClass testClass = TestClass(genderSubject: genderSubject);

      testClass.inGender?.add(Gender.male);
      await expectLater(testClass.gender, emits(Gender.male));

      testClass.inGender?.add(Gender.unknown);
      await expectLater(
        testClass.gender,
        emitsError(const UserException('Unknown not allowed')),
      );

      genderSubject.close();
    });

    test('validatePhoneNumbers should work appropriately', () async {
      const String correctPhoneNumber = '+254798000000';
      const String incorrectPhoneNumber = '12345';
      final BehaviorSubject<String> phoneSubject = BehaviorSubject<String>();
      final TestClass testClass = TestClass(phoneNumberSubject: phoneSubject);

      testClass.inPhoneNumber?.add(correctPhoneNumber);
      await expectLater(testClass.phoneNumber, emits(correctPhoneNumber));

      testClass.inPhoneNumber?.add(incorrectPhoneNumber);
      await expectLater(
        testClass.phoneNumber,
        emitsError(const UserException('Invalid phone number')),
      );

      phoneSubject.close();
    });
  });
}

class TestClass with Validator {
  TestClass({
    BehaviorSubject<String>? firstNameSubject,
    BehaviorSubject<String>? cccNumberSubject,
    BehaviorSubject<DateTime>? dateOfBirthSubject,
    BehaviorSubject<Gender>? genderSubject,
    BehaviorSubject<String>? phoneNumberSubject,
  })  : _firstNameSubject = firstNameSubject,
        _cccNameSubject = cccNumberSubject,
        _dateOfBirthSubject = dateOfBirthSubject,
        _genderSubject = genderSubject,
        _phoneNumber = phoneNumberSubject;

  final BehaviorSubject<String>? _firstNameSubject;
  final BehaviorSubject<String>? _cccNameSubject;
  final BehaviorSubject<DateTime>? _dateOfBirthSubject;
  final BehaviorSubject<Gender>? _genderSubject;
  final BehaviorSubject<String>? _phoneNumber;

  Stream<String>? get firstName =>
      _firstNameSubject?.stream.transform(validateName);
  Sink<String>? get inFirstName => _firstNameSubject?.sink;

  Stream<String>? get cccNumber =>
      _cccNameSubject?.stream.transform(validateCcc);
  Sink<String>? get inCccNumber => _cccNameSubject?.sink;

  Stream<DateTime>? get dateOfBirth =>
      _dateOfBirthSubject?.stream.transform(validateDate);
  Sink<DateTime>? get inDateOfBirth => _dateOfBirthSubject?.sink;

  Stream<Gender>? get gender =>
      _genderSubject?.stream.transform(validateGender);
  Sink<Gender>? get inGender => _genderSubject?.sink;

  Stream<String>? get phoneNumber =>
      _phoneNumber?.stream.transform(validatePhoneNumbers);
  Sink<String>? get inPhoneNumber => _phoneNumber?.sink;
}
