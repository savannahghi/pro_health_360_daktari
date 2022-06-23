import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:prohealth360_daktari/application/core/services/utils.dart';
import 'package:prohealth360_daktari/domain/core/entities/create_group/age_range.dart';
import 'package:prohealth360_daktari/domain/core/entities/create_group/create_group_payload.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_enums.dart';
import 'package:prohealth360_daktari/presentation/onboarding/patient/validator_mixin.dart';
import 'package:rxdart/rxdart.dart';

const String minimumAge = '14';
const String maximumAge = '25';

class CreateGroupFormManager with Validator {
  final BehaviorSubject<String> _name = BehaviorSubject<String>();
  Stream<String> get name => _name.stream.transform(validateName);
  Sink<String> get inName => _name.sink;

  final BehaviorSubject<String> _description = BehaviorSubject<String>();
  Stream<String> get description => _description.stream.transform(validateName);
  Sink<String> get inDescription => _description.sink;

  final BehaviorSubject<String> _higherBoundAge = BehaviorSubject<String>();
  Stream<String> get higherBoundAge =>
      _higherBoundAge.stream.transform(validateAgeRange);
  Sink<String> get inHigherBoundAge => _higherBoundAge.sink;

  final BehaviorSubject<String> _lowerBoundAge = BehaviorSubject<String>();
  Stream<String> get lowerBoundAge =>
      _lowerBoundAge.stream.transform(validateAgeRange);
  Sink<String> get inLowerBoundAge => _lowerBoundAge.sink;

  final BehaviorSubject<Map<String, bool>> _gender =
      BehaviorSubject<Map<String, bool>>();
  Sink<Map<String, bool>> get inGender => _gender.sink;

  final BehaviorSubject<Map<String, bool>> _clientType =
      BehaviorSubject<Map<String, bool>>();
  Sink<Map<String, bool>> get inClientType => _clientType.sink;

  final BehaviorSubject<bool> _inviteOnly = BehaviorSubject<bool>.seeded(false);
  Stream<bool> get inviteOnly => _inviteOnly.stream;
  Sink<bool> get inInviteOnly => _inviteOnly.sink;

  Stream<bool> get isFormValid => CombineLatestStream.combine6<String, String,
          Map<String, bool>, Map<String, bool>, String, String, bool>(
        _name,
        _description,
        _gender,
        _clientType,
        _lowerBoundAge,
        _higherBoundAge,
        validateFields,
      );

  bool validateFields(
    String name,
    String description,
    Map<String, bool> genders,
    Map<String, bool> clientType,
    String lowerBoundAge,
    String higherBoundAge,
  ) {
    return Validator.isValidName(name) &&
        Validator.isValidName(description) &&
        genders.isNotEmpty &&
        clientType.isNotEmpty &&
        Validator.isValidAgeRange(lowerBoundAge) &&
        Validator.isValidAgeRange(higherBoundAge);
  }

  CreateGroupPayload submit() {
    final String? lowerBoundAge = _lowerBoundAge.valueOrNull;
    final String? higherBoundAge = _higherBoundAge.valueOrNull;

    final AgeRange ageRangeValue = AgeRange(
      lowerBound: lowerBoundAge ?? '',
      upperBound: higherBoundAge ?? '',
    );

    final List<ClientType> clientTypeList = <ClientType>[];
    final Map<String, bool>? clientTypes = _clientType.valueOrNull;

    if (clientTypes != null) {
      for (final MapEntry<String, bool> clientType in clientTypes.entries) {
        if (clientType.value) {
          final ClientType clientTypeFromKey =
              clientTypeFromJson(clientType.key);

          clientTypeList.add(clientTypeFromKey);
        }
      }
    }

    final List<Gender> genderList = <Gender>[];
    final Map<String, bool>? genders = _gender.valueOrNull;

    if (genders != null) {
      for (final MapEntry<String, bool> gender in genders.entries) {
        if (gender.value) {
          final Gender genderFromString = genderFromJson(gender.key);

          genderList.add(genderFromString);
        }
      }
    }

    return CreateGroupPayload(
      name: _name.valueOrNull,
      description: _description.valueOrNull,
      ageRange: ageRangeValue,
      gender: genderList,
      clientType: clientTypeList,
      inviteOnly: _inviteOnly.valueOrNull,
    );
  }
}
