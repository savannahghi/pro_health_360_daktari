import 'package:freezed_annotation/freezed_annotation.dart';

part 'identification.freezed.dart';
part 'identification.g.dart';

@freezed
class Identification with _$Identification {
  const factory Identification({
    required String type,
    required String docNumber,
    required String uploadID,
  }) = _Identification;

  factory Identification.fromJson(Map<String, dynamic> json) =>
      _$IdentificationFromJson(json);
}
