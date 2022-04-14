import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mycarehubpro/domain/core/entities/core/role.dart';

part 'roles_list.freezed.dart';
part 'roles_list.g.dart';

@freezed
class RolesList with _$RolesList {
  factory RolesList({
    @JsonKey(name: 'getUserRoles') List<Role>? roles,
  }) = _RolesList;

  factory RolesList.fromJson(Map<String, dynamic> json) =>
      _$RolesListFromJson(json);

  factory RolesList.initial() => RolesList(roles: <Role>[]);
}
