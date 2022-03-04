// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:myharehubpro/domain/core/entities/core/facility.dart';
import 'package:myharehubpro/domain/core/entities/core/user.dart';

part 'staff_state.freezed.dart';
part 'staff_state.g.dart';

@freezed
class StaffState with _$StaffState {
  factory StaffState({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'user_id') String? userId,
    @JsonKey(name: 'active', defaultValue: false) bool? active,
    @JsonKey(name: 'staff_number') String? staffNumber,
    @JsonKey(name: 'facilities') List<Facility>? facilities,
    @JsonKey(name: 'default_facility') String? defaultFacility,
    @JsonKey(name: 'user') User? user,
  }) = _StaffState;

  factory StaffState.fromJson(Map<String, dynamic> json) =>
      _$StaffStateFromJson(json);

  factory StaffState.initial() => StaffState(
        id: UNKNOWN,
        active: false,
        userId: UNKNOWN,
        staffNumber: UNKNOWN,
        facilities: <Facility>[],
        defaultFacility: UNKNOWN,
        user: User.initial(),
      );
}
