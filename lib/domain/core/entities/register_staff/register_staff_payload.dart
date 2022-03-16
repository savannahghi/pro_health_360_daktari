import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mycarehubpro/application/core/services/utils.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_enums.dart';

part 'register_staff_payload.freezed.dart';
part 'register_staff_payload.g.dart';

@freezed
class RegisterStaffPayload with _$RegisterStaffPayload {
  factory RegisterStaffPayload({
    @JsonKey(name: 'facility') String? facility,
    @JsonKey(name: 'staffName') String? staffName,
    @JsonKey(name: 'gender', fromJson: genderFromJson) Gender? gender,
    @JsonKey(name: 'phoneNumber') String? phoneNumber,
    @JsonKey(name: 'idNumber') String? idNumber,
    @JsonKey(name: 'staffNumber') String? staffNumber,
    @JsonKey(name: 'staffRoles', fromJson: roleFromJson) Role? role,
    @JsonKey(name: 'inviteStaff') bool? inviteStaff,
    @JsonKey(name: 'dateOfBirth', toJson: dobToJson) DateTime? dateOfBirth,
  }) = _RegisterStaffPayload;

  factory RegisterStaffPayload.fromJson(Map<String, dynamic> json) =>
      _$RegisterStaffPayloadFromJson(json);
}
