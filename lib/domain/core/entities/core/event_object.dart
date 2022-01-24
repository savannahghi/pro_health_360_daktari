import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_object.freezed.dart';
part 'event_object.g.dart';

/// [EventObject] holds the structure of the payload the will be sent to firebase analytics
/// all fields are nullable to allow us to extend this class without the need to create another
/// object class.
/// Future attributes should be added as fields in this class
@freezed
class EventObject with _$EventObject {
  factory EventObject({
    @JsonKey(name: 'first_name') String? firstName,
    @JsonKey(name: 'last_name') String? lastName,
    @JsonKey(name: 'uid') String? uid,
    @JsonKey(name: 'route') String? route,
    @JsonKey(name: 'primary_phonenumber') String? primaryPhoneNumber,
    @JsonKey(name: 'timestamp') DateTime? timestamp,
    @JsonKey(name: 'flavour') String? flavour,
    @JsonKey(name: 'app_version', defaultValue: APPVERSION) String? appVersion,
  }) = _EventObject;

  factory EventObject.fromJson(Map<String, dynamic> json) =>
      _$EventObjectFromJson(json);

  factory EventObject.initial() => EventObject(
        firstName: UNKNOWN,
        lastName: UNKNOWN,
        uid: UNKNOWN,
        route: UNKNOWN,
        timestamp: DateTime.now(),
        flavour: UNKNOWN,
        appVersion: UNKNOWN,
      );
}
