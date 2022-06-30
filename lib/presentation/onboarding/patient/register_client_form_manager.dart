import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:prohealth360_daktari/domain/core/entities/register_client/register_client_payload.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_enums.dart';
import 'package:prohealth360_daktari/presentation/onboarding/patient/validator_mixin.dart';
import 'package:rxdart/rxdart.dart';

class RegisterClientFormManager with Validator {
  final BehaviorSubject<String> _facility = BehaviorSubject<String>();
  Sink<String> get inFacility => _facility.sink;

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

  final BehaviorSubject<Map<ClientType, bool>> _clientTypes =
      BehaviorSubject<Map<ClientType, bool>>();
  Stream<Map<ClientType, bool>> get clientTypes => _clientTypes.stream;
  Sink<Map<ClientType, bool>> get inClientTypes => _clientTypes.sink;

  final BehaviorSubject<bool> _inviteClient = BehaviorSubject<bool>();
  Stream<bool> get inviteClient => _inviteClient.stream;
  Sink<bool> get inInviteClient => _inviteClient.sink;

  // TODO: Wait for API
  Stream<bool> get isFormValid => CombineLatestStream.combine9<
              String,
              Map<ClientType, bool>,
              String,
              String,
              Gender,
              DateTime,
              String,
              DateTime,
              String,
              bool>(_facility, _clientTypes, _firstName, _lastName, _gender,
          _dateOfBirth, _phoneNumber, _enrollmentDate, _cccNumber, (
        String facility,
        Map<ClientType, bool> clientTypes,
        String firstName,
        String lastName,
        Gender gender,
        DateTime dateOfBirth,
        String phoneNumber,
        DateTime enrollmentDate,
        String cccNumber,
      ) {
        return clientTypes.isNotEmpty &&
            clientTypes.containsValue(true) &&
            Validator.isValidName(facility) &&
            Validator.isValidName(firstName) &&
            Validator.isValidName(lastName) &&
            Validator.isValidGender(gender) &&
            Validator.isValidDate(dateOfBirth) &&
            Validator.isValidPhone(phoneNumber) &&
            Validator.isValidDate(enrollmentDate) &&
            Validator.isValidCccNumber(cccNumber);
      });

  RegisterClientPayload submit() {
    final String? firstNameValue = _firstName.valueOrNull;
    final String? lastNameValue = _lastName.valueOrNull;
    final bool? inviteClient = _inviteClient.valueOrNull;

    final List<ClientType>? clientTypes = _clientTypes.valueOrNull?.entries
        .where((MapEntry<ClientType, bool> element) => element.value)
        .map((MapEntry<ClientType, bool> entry) => entry.key)
        .toList();

    return RegisterClientPayload(
      facility: _facility.valueOrNull,
      clientTypes: clientTypes,
      clientName: '$firstNameValue $lastNameValue',
      gender: _gender.valueOrNull,
      dateOfBirth: _dateOfBirth.valueOrNull,
      phoneNumber: _phoneNumber.valueOrNull,
      enrollmentDate: _enrollmentDate.valueOrNull,
      cccNumber: _cccNumber.valueOrNull,
      counselled: true,
      inviteClient: inviteClient ?? false,
    );
  }
}
