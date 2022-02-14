import 'package:domain_objects/value_objects.dart';
import 'package:healthcloud/domain/core/entities/register_client/register_client_payload.dart';
import 'package:healthcloud/domain/core/value_objects/app_enums.dart';
import 'package:healthcloud/presentation/onboarding/patient/validator_mixin.dart';
import 'package:rxdart/rxdart.dart';

class RegisterClientFormManager with Validator {
  final BehaviorSubject<String> _facility = BehaviorSubject<String>();
  Stream<String> get facility => _facility.stream.transform(validateName);
  Sink<String> get inFacility => _facility.sink;

  final BehaviorSubject<ClientType> _clientType = BehaviorSubject<ClientType>();
  Stream<ClientType> get clientType => _clientType.stream;
  Sink<ClientType> get inClientType => _clientType.sink;

  final BehaviorSubject<String> _firstName = BehaviorSubject<String>();
  Stream<String> get firstName => _firstName.stream.transform(validateName);
  Sink<String> get inFirstName => _firstName.sink;

  final BehaviorSubject<String> _lastName = BehaviorSubject<String>();
  Stream<String> get lastName => _lastName.stream.transform(validateName);
  Sink<String> get inLastName => _lastName.sink;

  final BehaviorSubject<Gender> _gender = BehaviorSubject<Gender>();
  Stream<Gender> get gender => _gender.stream.transform(validateGender);
  Sink<Gender> get inGender => _gender.sink;

  final BehaviorSubject<DateTime> _dateOfBirth = BehaviorSubject<DateTime>();
  Sink<DateTime> get inDateOfBirth => _dateOfBirth.sink;

  final BehaviorSubject<String> _phoneNumber = BehaviorSubject<String>();
  Stream<String> get phoneNumber =>
      _phoneNumber.stream.transform(validatePhoneNumbers);
  Sink<String> get inPhoneNumber => _phoneNumber.sink;

  final BehaviorSubject<DateTime> _enrollmentDate = BehaviorSubject<DateTime>();
  Sink<DateTime> get inEnrollmentDate => _enrollmentDate.sink;

  final BehaviorSubject<String> _cccNumber = BehaviorSubject<String>();
  Stream<String> get cccNumber => _cccNumber.stream.transform(validateCcc);
  Sink<String> get inCccNumber => _cccNumber.sink;

  final BehaviorSubject<bool> _inviteClient = BehaviorSubject<bool>();
  Stream<bool> get inviteClient => _inviteClient.stream;
  Sink<bool> get inInviteClient => _inviteClient.sink;

  Stream<bool> get isFormValid => CombineLatestStream.list(
        <Stream<dynamic>>[
          _facility,
          _clientType,
          _firstName,
          _lastName,
          _gender,
          _dateOfBirth,
          _phoneNumber,
          _enrollmentDate,
          _cccNumber,
        ],
      ).map<bool>((List<dynamic> values) {
        final String facility = values[0] as String;
        final String firstName = values[2] as String;
        final String lastName = values[3] as String;
        final Gender gender = values[4] as Gender;
        final DateTime dob = values[5] as DateTime;
        final String phoneNumber = values[6] as String;
        final DateTime enrollmentDate = values[7] as DateTime;
        final String cccNumber = values[8] as String;

        return Validator.isValidName(facility) &&
            Validator.isValidName(firstName) &&
            Validator.isValidName(lastName) &&
            Validator.isValidGender(gender) &&
            Validator.isValidDate(dob) &&
            Validator.isValidPhone(phoneNumber) &&
            Validator.isValidDate(enrollmentDate) &&
            Validator.isValidCccNumber(cccNumber);
      });

  RegisterClientPayload submit() {
    final String? firstNameValue = _firstName.valueOrNull;
    final String? lastNameValue = _lastName.valueOrNull;

    return RegisterClientPayload(
      facility: _facility.valueOrNull,
      clientType: _clientType.valueOrNull,
      clientName: '$firstNameValue $lastNameValue',
      gender: _gender.valueOrNull,
      dateOfBirth: _dateOfBirth.valueOrNull,
      phoneNumber: _phoneNumber.valueOrNull,
      enrollmentDate: _enrollmentDate.valueOrNull,
      cccNumber: _cccNumber.valueOrNull,
      counselled: true,
      inviteClient: _inviteClient.valueOrNull,
    );
  }
}
