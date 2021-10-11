// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'supporting_documents.freezed.dart';
part 'supporting_documents.g.dart';

@freezed
class SupportingDocument with _$SupportingDocument {
  const factory SupportingDocument({
    required String title,
    required String description,
    required String upload,
  }) = _SupportingDocument;

  factory SupportingDocument.fromJson(Map<String, dynamic> json) =>
      _$SupportingDocumentFromJson(json);
}
