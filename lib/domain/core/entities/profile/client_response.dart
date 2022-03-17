// Package imports:

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mycarehubpro/domain/core/entities/core/contact.dart';

part 'client_response.freezed.dart';
part 'client_response.g.dart';

@freezed
class ClientResponse with _$ClientResponse {
  factory ClientResponse({
    @JsonKey(name: 'ID') String? userId, // This is the nickname
    @JsonKey(name: 'Username') String? userName,
    @JsonKey(name: 'TermsAccepted', defaultValue: false) bool? termsAccepted,
    @JsonKey(name: 'Active', defaultValue: false) bool? active,
    @JsonKey(name: 'Contacts') Contact? primaryContact,
  }) = _ClientResponse;

  factory ClientResponse.fromJson(Map<String, dynamic> json) =>
      _$ClientResponseFromJson(json);

  factory ClientResponse.initial() => ClientResponse(
        userId: UNKNOWN,
        userName: UNKNOWN,
        termsAccepted: false,
        active: false,
        primaryContact: Contact.initial(),
      );
}
