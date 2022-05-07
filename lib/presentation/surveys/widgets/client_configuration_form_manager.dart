import 'package:mycarehubpro/domain/core/entities/surveys/client_configuration_payload.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_enums.dart';
import 'package:mycarehubpro/presentation/onboarding/patient/validator_mixin.dart';
import 'package:rxdart/rxdart.dart';

class ClientConfigurationFormManager with Validator {
  final BehaviorSubject<Map<ClientType, bool>> _clientTypes =
      BehaviorSubject<Map<ClientType, bool>>();
  Stream<Map<ClientType, bool>> get clientTypes => _clientTypes.stream;
  Sink<Map<ClientType, bool>> get inClientTypes => _clientTypes.sink;

  final BehaviorSubject<Map<String, bool>> _ageGroups =
      BehaviorSubject<Map<String, bool>>();
  Stream<Map<String, bool>> get ageGroups => _ageGroups.stream;
  Sink<Map<String, bool>> get inAgeGroups => _ageGroups.sink;

  // TODO: Wait for API
  Stream<bool> get isFormValid => CombineLatestStream.combine2<
          Map<ClientType, bool>,
          Map<String, bool>,
          bool>(_clientTypes, _ageGroups, (
        Map<ClientType, bool> clientTypes,
        Map<String, bool> ageGroups,
      ) {
        return clientTypes.isNotEmpty && ageGroups.isNotEmpty;
      });

  ClientConfigurationPayload submit() {
    final List<ClientType>? clientTypes = _clientTypes.valueOrNull?.entries
        .where((MapEntry<ClientType, bool> element) => element.value)
        .map((MapEntry<ClientType, bool> entry) => entry.key)
        .toList();

    final List<String>? ageGroups = _ageGroups.valueOrNull?.entries
        .where((MapEntry<String, bool> element) => element.value)
        .map((MapEntry<String, bool> entry) => entry.key)
        .toList();

    return ClientConfigurationPayload(
      clientTypes: clientTypes,
      ageGroups: ageGroups,
    );
  }
}
