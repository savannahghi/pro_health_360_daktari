import 'package:domain_objects/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:healthcloud/domain/core/value_objects/app_enums.dart';

part 'create_group_payload.freezed.dart';

@freezed
class CreateGroupPayload with _$CreateGroupPayload {
  factory CreateGroupPayload({
    String? name,
    String? description,
    AgeRange? ageRange,
    List<Gender>? gender,
    List<ClientType>? clientType,
    bool? inviteOnly,
  }) = _CreateGroupPayload;
}

@freezed
class AgeRange with _$AgeRange {
  factory AgeRange({
    required double lowerBound,
    required double upperBound,
  }) = _AgeRange;
}
