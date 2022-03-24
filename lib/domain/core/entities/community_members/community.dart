import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'community.freezed.dart';
part 'community.g.dart';

@freezed
class Community with _$Community {
  factory Community({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'memberCount') int? memberCount,
    @JsonKey(name: 'description') String? description,
    @JsonKey(name: 'createdBy') String? createdBy,
  }) = _Community;

  factory Community.fromJson(Map<String, dynamic> json) =>
      _$CommunityFromJson(json);

  factory Community.initial() => Community(
        id: UNKNOWN,
        name: UNKNOWN,
        memberCount: 0,
        description: UNKNOWN,
        createdBy: UNKNOWN,
      );
}
