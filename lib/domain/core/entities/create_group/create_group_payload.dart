import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mycarehubpro/domain/core/entities/create_group/age_range.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_enums.dart';

part 'create_group_payload.freezed.dart';
part 'create_group_payload.g.dart';

@freezed
class CreateGroupPayload with _$CreateGroupPayload {
  @JsonSerializable(explicitToJson: true)
  factory CreateGroupPayload({
    String? name,
    String? description,
    AgeRange? ageRange,
    List<Gender>? gender,
    List<ClientType>? clientType,
    bool? inviteOnly,
  }) = _CreateGroupPayload;

  factory CreateGroupPayload.fromJson(Map<String, dynamic> json) =>
      _$CreateGroupPayloadFromJson(json);
}
