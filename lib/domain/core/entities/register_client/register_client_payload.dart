import 'package:domain_objects/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:healthcloud/domain/core/value_objects/app_enums.dart';

part 'register_client_payload.freezed.dart';
part 'register_client_payload.g.dart';

@freezed
class RegisterClientPayload with _$RegisterClientPayload {
  factory RegisterClientPayload({
    String? facility,
    ClientType? clientType,
    String? clientName,
    Gender? gender,
    DateTime? dateOfBirth,
    String? phoneNumber,
    DateTime? enrollmentDate,
    String? cccNumber,
    bool? counselled,
  }) = _RegisterClientPaylod;

  factory RegisterClientPayload.fromJson(Map<String, dynamic> json) =>
      _$RegisterClientPayloadFromJson(json);
}
