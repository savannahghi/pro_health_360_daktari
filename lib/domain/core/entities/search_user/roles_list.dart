import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

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
