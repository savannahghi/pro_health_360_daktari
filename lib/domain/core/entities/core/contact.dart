// Package imports:
import 'package:domain_objects/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
// Project imports:
import 'package:healthcloud/domain/core/value_objects/app_enums.dart';

part 'contact.freezed.dart';
part 'contact.g.dart';

@freezed
class Contact with _$Contact {
  factory Contact({
    @JsonKey(name: 'contactType') ContactType? contactType,
    @JsonKey(name: 'contactValue') String? value,
    @JsonKey(name: 'active', defaultValue: false) bool? active,
    @JsonKey(name: 'optedIn', defaultValue: false) bool? optedIn,
  }) = _Contact;

  factory Contact.fromJson(Map<String, dynamic> json) =>
      _$ContactFromJson(json);

  factory Contact.initial() => Contact(
        contactType: ContactType.PHONE,
        value: UNKNOWN,
        active: false,
        optedIn: false,
      );
}
