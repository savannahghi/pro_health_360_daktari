import 'package:healthcloud/application/redux/states/practitioner_kyc_models/practitioner.dart';
import 'package:healthcloud/domain/core/value_objects/app_enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'practitioner_kyc_state.freezed.dart';
part 'practitioner_kyc_state.g.dart';

@freezed
class PractitionerKYCState with _$PractitionerKYCState {
  const factory PractitionerKYCState({
    @JsonKey(
      unknownEnumValue: KYCType.unknown,
      defaultValue: KYCType.unknown,
    )
        required KYCType kycType,
    IndividualPractitioner? individualPractitioner,
    OrganizationPractitioner? organizationPractitioner,
  }) = _PractitionerKYCState;

  factory PractitionerKYCState.initial() => PractitionerKYCState(
        kycType: KYCType.unknown,
        organizationPractitioner: OrganizationPractitioner.initial(),
        individualPractitioner: IndividualPractitioner.initial(),
      );

  factory PractitionerKYCState.fromJson(Map<String, dynamic> json) =>
      _$PractitionerKYCStateFromJson(json);
}
