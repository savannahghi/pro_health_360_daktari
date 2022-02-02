// Package imports:
import 'package:domain_objects/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_pin.freezed.dart';
part 'create_pin.g.dart';

@freezed
class CreatePINState with _$CreatePINState {
  factory CreatePINState({
    String? newPIN,
    String? confirmPIN,
  }) = _CreatePINState;

  factory CreatePINState.fromJson(Map<String, dynamic> json) =>
      _$CreatePINStateFromJson(json);

  factory CreatePINState.initial() => CreatePINState(
        newPIN: UNKNOWN,
        confirmPIN: UNKNOWN,
      );
}
