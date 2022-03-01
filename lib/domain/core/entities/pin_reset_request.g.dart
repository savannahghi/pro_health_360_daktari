// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pin_reset_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PINResetRequest _$PINResetRequestFromJson(Map<String, dynamic> json) =>
    PINResetRequest(
      clientName: json['clientName'] as String,
      phoneNumber: json['phoneNumber'] as String,
      approvalStatus: json['approvalStatus'] as bool? ?? false,
    );

Map<String, dynamic> _$PINResetRequestToJson(PINResetRequest instance) =>
    <String, dynamic>{
      'clientName': instance.clientName,
      'phoneNumber': instance.phoneNumber,
      'approvalStatus': instance.approvalStatus,
    };
