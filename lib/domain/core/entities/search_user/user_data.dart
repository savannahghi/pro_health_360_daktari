// Package imports:

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mycarehubpro/domain/core/entities/core/contact.dart';

part 'user_data.freezed.dart';
part 'user_data.g.dart';

@freezed
class UserData with _$UserData {
  factory UserData({
    @JsonKey(name: 'ID') String? id,
    @JsonKey(name: 'Username') String? userName,
    @JsonKey(name: 'TermsAccepted', defaultValue: false) bool? termsAccepted,
    @JsonKey(name: 'Active', defaultValue: false) bool? active,
    @JsonKey(name: 'Contacts') Contact? primaryContact,
    @JsonKey(name: 'Name') String? name,
  }) = _UserData;

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

  factory UserData.initial() => UserData(
        id: UNKNOWN,
        userName: UNKNOWN,
        termsAccepted: false,
        active: false,
        primaryContact: Contact.initial(),
        name: UNKNOWN,
      );
}
