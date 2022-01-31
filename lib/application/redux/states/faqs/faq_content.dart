// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'faq_content.freezed.dart';
part 'faq_content.g.dart';

@freezed
class FAQContent with _$FAQContent {
  factory FAQContent({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'createdAt') String? createdAt,
    @JsonKey(name: 'excerpt') String? excerpt,
    @JsonKey(name: 'featureImage') String? featureImage,
    @JsonKey(name: 'html') String? html,
    @JsonKey(name: 'publishedAt') String? publishedAt,
    @JsonKey(name: 'slug') String? slug,
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'readingTime') int? readingTime,
    @JsonKey(name: 'tags') List<FAQTag?>? tags,
  }) = _FAQContent;
  factory FAQContent.fromJson(Map<String, dynamic> json) =>
      _$FAQContentFromJson(json);
}

@freezed
class FAQTag with _$FAQTag {
  factory FAQTag({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'slug') String? slug,
  }) = _FAQTag;
  factory FAQTag.fromJson(Map<String, dynamic> json) => _$FAQTagFromJson(json);
}
