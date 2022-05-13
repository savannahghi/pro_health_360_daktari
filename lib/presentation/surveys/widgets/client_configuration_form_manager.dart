import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:mycarehubpro/domain/core/entities/create_group/age_range.dart';
import 'package:mycarehubpro/domain/core/entities/surveys/client_configuration_payload.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_enums.dart';
import 'package:mycarehubpro/presentation/onboarding/patient/validator_mixin.dart';
import 'package:rxdart/rxdart.dart';

const double minimumAge = 14;
const double maximumAge = 25;

class ClientConfigurationFormManager with Validator {
  final BehaviorSubject<Map<ClientType, bool>> _clientTypes =
      BehaviorSubject<Map<ClientType, bool>>();
  Stream<Map<ClientType, bool>> get clientTypes => _clientTypes.stream;
  Sink<Map<ClientType, bool>> get inClientTypes => _clientTypes.sink;

  final BehaviorSubject<RangeValues> _ageRange = BehaviorSubject<RangeValues>();
  Stream<RangeValues> get ageRange => _ageRange.stream;
  Sink<RangeValues> get inAgeRange => _ageRange.sink;

  final BehaviorSubject<Map<Gender, bool>> _gender =
      BehaviorSubject<Map<Gender, bool>>();
  Stream<Map<Gender, bool>> get gender => _gender.stream;
  Sink<Map<Gender, bool>> get inGender => _gender.sink;

  // TODO: Wait for API
  Stream<bool> get isFormValid => CombineLatestStream.combine2<
          Map<ClientType, bool>,
          Map<Gender, bool>,
          bool>(_clientTypes, _gender, (
        Map<ClientType, bool> clientTypes,
        Map<Gender, bool> gender,
      ) {
        return clientTypes.isNotEmpty && gender.isNotEmpty;
      });

  ClientConfigurationPayload submit() {
    final RangeValues? ageRange = _ageRange.valueOrNull;

    final AgeRange ageRangeValue = AgeRange(
      lowerBound: ageRange?.start ?? minimumAge,
      upperBound: ageRange?.end ?? maximumAge,
    );

    final List<ClientType>? clientTypes = _clientTypes.valueOrNull?.entries
        .where((MapEntry<ClientType, bool> element) => element.value)
        .map((MapEntry<ClientType, bool> entry) => entry.key)
        .toList();

    final List<Gender>? gender = _gender.valueOrNull?.entries
        .where((MapEntry<Gender, bool> element) => element.value)
        .map((MapEntry<Gender, bool> entry) => entry.key)
        .toList();

    return ClientConfigurationPayload(
      clientTypes: clientTypes,
      ageRange: ageRangeValue,
      gender: gender,
    );
  }
}
