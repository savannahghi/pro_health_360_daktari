import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prohealth360_daktari/domain/community/entities/age_range.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_enums.dart';

part 'community.freezed.dart';
part 'community.g.dart';

@freezed
class Community with _$Community {
  factory Community({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'memberCount') int? memberCount,
    @JsonKey(name: 'description') String? description,
    @JsonKey(name: 'createdBy') Member? createdBy,
    @JsonKey(name: 'ageRange') AgeRange? ageRange,
    @JsonKey(name: 'gender') List<Gender>? gender,
    @JsonKey(name: 'clientType') List<ClientType>? clientType,
  }) = _Community;

  factory Community.fromJson(Map<String, dynamic> json) =>
      _$CommunityFromJson(json);
}
