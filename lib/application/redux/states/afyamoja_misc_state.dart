// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:healthcloud/domain/core/entities/home/bottom_nav_obj.dart';

// Project imports:

part 'afyamoja_misc_state.freezed.dart';
part 'afyamoja_misc_state.g.dart';

@freezed
class AfyaMojaMiscState with _$AfyaMojaMiscState {
  factory AfyaMojaMiscState({
    BottomNavObj? bottomNavObj,
    List<dynamic>? libraryListItems,
  }) = _AfyaMojaMiscState;

  factory AfyaMojaMiscState.fromJson(Map<String, dynamic> json) =>
      _$AfyaMojaMiscStateFromJson(json);

  factory AfyaMojaMiscState.initial() => AfyaMojaMiscState(
        bottomNavObj: BottomNavObj(),
        libraryListItems: <dynamic>[],
      );
}
