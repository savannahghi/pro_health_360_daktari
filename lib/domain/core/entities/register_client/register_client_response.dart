// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_client_response.freezed.dart';
part 'register_client_response.g.dart';

@freezed
class RegisterClientResponse with _$RegisterClientResponse {
  factory RegisterClientResponse({
    @JsonKey(name: 'ID') String? id,
    @JsonKey(name: 'active') bool? active,
    @JsonKey(name: 'clientType') String? clientType,
    @JsonKey(name: 'enrollmentDate') String? enrollmentDate,
    @JsonKey(name: 'fhirPatientID') String? fhirPatientID,
    @JsonKey(name: 'emrHealthRecordID') String? emrHealthRecordID,
    @JsonKey(name: 'treatmentBuddy') String? treatmentBuddy,
    @JsonKey(name: 'counselled') bool? counselled,
    @JsonKey(name: 'organisation') String? organisation,
    @JsonKey(name: 'userID') String? userID,
    @JsonKey(name: 'currentFacilityID') String? currentFacilityID,
    @JsonKey(name: 'chv') String? chv,
    @JsonKey(name: 'caregiver') String? caregiver,
  }) = _RegisterClientResponse;

  factory RegisterClientResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterClientResponseFromJson(json);
}
