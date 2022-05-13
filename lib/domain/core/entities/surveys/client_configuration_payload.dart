import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mycarehubpro/domain/core/entities/create_group/age_range.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_enums.dart';

part 'client_configuration_payload.freezed.dart';
part 'client_configuration_payload.g.dart';

@freezed
class ClientConfigurationPayload with _$ClientConfigurationPayload {
  factory ClientConfigurationPayload({
    @JsonKey(name: 'clientTypes') List<ClientType>? clientTypes,
    @JsonKey(name: 'ageRange') AgeRange? ageRange,
    @JsonKey(name: 'gender') List<Gender>? gender,
  }) = _ClientConfigurationPayload;

  factory ClientConfigurationPayload.fromJson(Map<String, dynamic> json) =>
      _$ClientConfigurationPayloadFromJson(json);
}
