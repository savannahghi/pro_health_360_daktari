// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'connectivity_state.freezed.dart';
part 'connectivity_state.g.dart';

@freezed
class ConnectivityState with _$ConnectivityState {
  factory ConnectivityState({required bool isConnected}) = _ConnectivityState;

  factory ConnectivityState.initial() => ConnectivityState(isConnected: false);

  factory ConnectivityState.fromJson(Map<String, dynamic> json) =>
      _$ConnectivityStateFromJson(json);
}
