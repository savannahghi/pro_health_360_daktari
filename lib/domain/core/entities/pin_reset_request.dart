// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'pin_reset_request.g.dart';

@JsonSerializable()
class PINResetRequest {
  PINResetRequest({required this.clientName, required this.phoneNumber, this.approvalStatus = false,});

  factory PINResetRequest.fromJson(Map<String, dynamic> json) =>
      _$PINResetRequestFromJson(json);

  final String clientName;
  final String phoneNumber;
  final bool? approvalStatus;

  Map<String, dynamic> toJson() => _$PINResetRequestToJson(this);
}
