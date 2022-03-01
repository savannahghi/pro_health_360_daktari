import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:healthcloud/application/core/services/utils.dart';
import 'package:healthcloud/domain/core/value_objects/app_enums.dart';

part 'register_client_payload.freezed.dart';
part 'register_client_payload.g.dart';

@freezed
class RegisterClientPayload with _$RegisterClientPayload {
  factory RegisterClientPayload({
    @JsonKey(name: 'facility') String? facility,
    @JsonKey(name: 'clientType') ClientType? clientType,
    @JsonKey(name: 'clientName') String? clientName,
    @JsonKey(name: 'gender', fromJson: genderFromJson) Gender? gender,
    @JsonKey(name: 'dateOfBirth', toJson: dobToJson) DateTime? dateOfBirth,
    @JsonKey(name: 'phoneNumber') String? phoneNumber,
    @JsonKey(name: 'enrollmentDate', toJson: dobToJson)
        DateTime? enrollmentDate,
    @JsonKey(name: 'cccNumber') String? cccNumber,
    @JsonKey(name: 'counselled') bool? counselled,
    @JsonKey(name: 'inviteClient') bool? inviteClient,
  }) = _RegisterClientPayload;

  factory RegisterClientPayload.fromJson(Map<String, dynamic> json) =>
      _$RegisterClientPayloadFromJson(json);
}
