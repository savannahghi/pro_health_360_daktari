// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faq_content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FAQContent _$_$_FAQContentFromJson(Map<String, dynamic> json) {
  return _$_FAQContent(
    id: json['id'] as String?,
    createdAt: json['createdAt'] as String?,
    excerpt: json['excerpt'] as String?,
    featureImage: json['featureImage'] as String?,
    html: json['html'] as String?,
    publishedAt: json['publishedAt'] as String?,
    slug: json['slug'] as String?,
    title: json['title'] as String?,
    readingTime: json['readingTime'] as int?,
    tags: (json['tags'] as List<dynamic>?)
        ?.map((e) =>
            e == null ? null : FAQTag.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$_$_FAQContentToJson(_$_FAQContent instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'excerpt': instance.excerpt,
      'featureImage': instance.featureImage,
      'html': instance.html,
      'publishedAt': instance.publishedAt,
      'slug': instance.slug,
      'title': instance.title,
      'readingTime': instance.readingTime,
      'tags': instance.tags,
    };

_$_FAQTag _$_$_FAQTagFromJson(Map<String, dynamic> json) {
  return _$_FAQTag(
    id: json['id'] as String?,
    name: json['name'] as String?,
    slug: json['slug'] as String?,
  );
}

Map<String, dynamic> _$_$_FAQTagToJson(_$_FAQTag instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
    };
