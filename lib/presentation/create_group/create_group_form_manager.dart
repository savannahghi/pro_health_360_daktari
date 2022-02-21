import 'package:domain_objects/value_objects.dart';
import 'package:flutter/material.dart';
import 'package:healthcloud/application/core/services/utils.dart';
import 'package:healthcloud/domain/core/value_objects/app_enums.dart';
import 'package:healthcloud/presentation/onboarding/patient/validator_mixin.dart';
import 'package:rxdart/rxdart.dart';

import 'create_group_payload.dart';

const double minimumAge = 15;
const double maximumAge = 25;

class CreateGroupFormManager with Validator {
  final BehaviorSubject<String> _name = BehaviorSubject<String>();
  Stream<String> get name => _name.stream.transform(validateName);
  Sink<String> get inName => _name.sink;

  final BehaviorSubject<String> _description = BehaviorSubject<String>();
  Stream<String> get description => _description.stream.transform(validateName);
  Sink<String> get inDescription => _description.sink;

  final BehaviorSubject<RangeValues> _ageRange = BehaviorSubject<RangeValues>();
  Stream<RangeValues> get ageRange => _ageRange.stream;
  Sink<RangeValues> get inAgeRange => _ageRange.sink;

  final BehaviorSubject<Map<String, bool>> _gender =
      BehaviorSubject<Map<String, bool>>();
  Sink<Map<String, bool>> get inGender => _gender.sink;

  final BehaviorSubject<Map<String, bool>> _clientType =
      BehaviorSubject<Map<String, bool>>();
  Sink<Map<String, bool>> get inClientType => _clientType.sink;

  final BehaviorSubject<bool> _inviteOnly = BehaviorSubject<bool>.seeded(false);
  Stream<bool> get inviteOnly => _inviteOnly.stream;
  Sink<bool> get inInviteOnly => _inviteOnly.sink;

  Stream<bool> get isFormValid => CombineLatestStream.combine4<
      String,
      String,
      Map<String, bool>,
      Map<String, bool>,
      bool>(_name, _description, _gender, _clientType, validateFields);

  bool validateFields(
    String name,
    String description,
    Map<String, bool> genders,
    Map<String, bool> clientType,
  ) {
    return Validator.isValidName(name) &&
        Validator.isValidName(description) &&
        genders.isNotEmpty &&
        clientType.isNotEmpty;
  }

  CreateGroupPayload submit() {
    final RangeValues? ageRange = _ageRange.valueOrNull;

    final AgeRange ageRangeValue = AgeRange(
      lowerBound: ageRange?.start ?? minimumAge,
      upperBound: ageRange?.end ?? maximumAge,
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
