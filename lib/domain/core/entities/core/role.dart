import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mycarehubpro/application/core/services/utils.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_enums.dart';

part 'role.freezed.dart';
part 'role.g.dart';

@freezed
class Role with _$Role {
  factory Role({
    @JsonKey(name: 'authorityRoleID') String? roleID,
    @JsonKey(name: 'name', fromJson: roleValueFromJson) RoleValue? name,
    bool? active,
  }) = _Role;

  factory Role.fromJson(Map<String, dynamic> json) => _$RoleFromJson(json);
}
