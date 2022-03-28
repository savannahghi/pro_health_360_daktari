// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ban_status.freezed.dart';
part 'ban_status.g.dart';

@freezed
class BanStatus with _$BanStatus {
  factory BanStatus({
    @JsonKey(name: 'bannedInCommunity') bool? value,
  }) = _BanStatus;

  factory BanStatus.fromJson(Map<String, dynamic> json) => _$BanStatusFromJson(json);

  factory BanStatus.initial() => BanStatus(
        value: false,
      );
}
