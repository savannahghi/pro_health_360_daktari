// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'faq_content.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FAQContent _$FAQContentFromJson(Map<String, dynamic> json) {
  return _FAQContent.fromJson(json);
}

/// @nodoc
class _$FAQContentTearOff {
  const _$FAQContentTearOff();

  _FAQContent call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'createdAt') String? createdAt,
      @JsonKey(name: 'excerpt') String? excerpt,
      @JsonKey(name: 'featureImage') String? featureImage,
      @JsonKey(name: 'html') String? html,
      @JsonKey(name: 'publishedAt') String? publishedAt,
      @JsonKey(name: 'slug') String? slug,
      @JsonKey(name: 'title') String? title,
      @JsonKey(name: 'readingTime') int? readingTime,
      @JsonKey(name: 'tags') List<FAQTag?>? tags}) {
    return _FAQContent(
      id: id,
      createdAt: createdAt,
      excerpt: excerpt,
      featureImage: featureImage,
      html: html,
      publishedAt: publishedAt,
      slug: slug,
      title: title,
      readingTime: readingTime,
      tags: tags,
    );
  }

  FAQContent fromJson(Map<String, Object> json) {
    return FAQContent.fromJson(json);
  }
}

/// @nodoc
const $FAQContent = _$FAQContentTearOff();

/// @nodoc
mixin _$FAQContent {
  @JsonKey(name: 'id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'createdAt')
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'excerpt')
  String? get excerpt => throw _privateConstructorUsedError;
  @JsonKey(name: 'featureImage')
  String? get featureImage => throw _privateConstructorUsedError;
  @JsonKey(name: 'html')
  String? get html => throw _privateConstructorUsedError;
  @JsonKey(name: 'publishedAt')
  String? get publishedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'slug')
  String? get slug => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'readingTime')
  int? get readingTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'tags')
  List<FAQTag?>? get tags => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FAQContentCopyWith<FAQContent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FAQContentCopyWith<$Res> {
  factory $FAQContentCopyWith(
          FAQContent value, $Res Function(FAQContent) then) =
      _$FAQContentCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'createdAt') String? createdAt,
      @JsonKey(name: 'excerpt') String? excerpt,
      @JsonKey(name: 'featureImage') String? featureImage,
      @JsonKey(name: 'html') String? html,
      @JsonKey(name: 'publishedAt') String? publishedAt,
      @JsonKey(name: 'slug') String? slug,
      @JsonKey(name: 'title') String? title,
      @JsonKey(name: 'readingTime') int? readingTime,
      @JsonKey(name: 'tags') List<FAQTag?>? tags});
}

/// @nodoc
class _$FAQContentCopyWithImpl<$Res> implements $FAQContentCopyWith<$Res> {
  _$FAQContentCopyWithImpl(this._value, this._then);

  final FAQContent _value;
  // ignore: unused_field
  final $Res Function(FAQContent) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? excerpt = freezed,
    Object? featureImage = freezed,
    Object? html = freezed,
    Object? publishedAt = freezed,
    Object? slug = freezed,
    Object? title = freezed,
    Object? readingTime = freezed,
    Object? tags = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      excerpt: excerpt == freezed
          ? _value.excerpt
          : excerpt // ignore: cast_nullable_to_non_nullable
              as String?,
      featureImage: featureImage == freezed
          ? _value.featureImage
          : featureImage // ignore: cast_nullable_to_non_nullable
              as String?,
      html: html == freezed
          ? _value.html
          : html // ignore: cast_nullable_to_non_nullable
              as String?,
      publishedAt: publishedAt == freezed
          ? _value.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      slug: slug == freezed
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      readingTime: readingTime == freezed
          ? _value.readingTime
          : readingTime // ignore: cast_nullable_to_non_nullable
              as int?,
      tags: tags == freezed
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<FAQTag?>?,
    ));
  }
}

/// @nodoc
abstract class _$FAQContentCopyWith<$Res> implements $FAQContentCopyWith<$Res> {
  factory _$FAQContentCopyWith(
          _FAQContent value, $Res Function(_FAQContent) then) =
      __$FAQContentCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'createdAt') String? createdAt,
      @JsonKey(name: 'excerpt') String? excerpt,
      @JsonKey(name: 'featureImage') String? featureImage,
      @JsonKey(name: 'html') String? html,
      @JsonKey(name: 'publishedAt') String? publishedAt,
      @JsonKey(name: 'slug') String? slug,
      @JsonKey(name: 'title') String? title,
      @JsonKey(name: 'readingTime') int? readingTime,
      @JsonKey(name: 'tags') List<FAQTag?>? tags});
}

/// @nodoc
class __$FAQContentCopyWithImpl<$Res> extends _$FAQContentCopyWithImpl<$Res>
    implements _$FAQContentCopyWith<$Res> {
  __$FAQContentCopyWithImpl(
      _FAQContent _value, $Res Function(_FAQContent) _then)
      : super(_value, (v) => _then(v as _FAQContent));

  @override
  _FAQContent get _value => super._value as _FAQContent;

  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? excerpt = freezed,
    Object? featureImage = freezed,
    Object? html = freezed,
    Object? publishedAt = freezed,
    Object? slug = freezed,
    Object? title = freezed,
    Object? readingTime = freezed,
    Object? tags = freezed,
  }) {
    return _then(_FAQContent(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      excerpt: excerpt == freezed
          ? _value.excerpt
          : excerpt // ignore: cast_nullable_to_non_nullable
              as String?,
      featureImage: featureImage == freezed
          ? _value.featureImage
          : featureImage // ignore: cast_nullable_to_non_nullable
              as String?,
      html: html == freezed
          ? _value.html
          : html // ignore: cast_nullable_to_non_nullable
              as String?,
      publishedAt: publishedAt == freezed
          ? _value.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      slug: slug == freezed
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      readingTime: readingTime == freezed
          ? _value.readingTime
          : readingTime // ignore: cast_nullable_to_non_nullable
              as int?,
      tags: tags == freezed
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<FAQTag?>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FAQContent implements _FAQContent {
  _$_FAQContent(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'createdAt') this.createdAt,
      @JsonKey(name: 'excerpt') this.excerpt,
      @JsonKey(name: 'featureImage') this.featureImage,
      @JsonKey(name: 'html') this.html,
      @JsonKey(name: 'publishedAt') this.publishedAt,
      @JsonKey(name: 'slug') this.slug,
      @JsonKey(name: 'title') this.title,
      @JsonKey(name: 'readingTime') this.readingTime,
      @JsonKey(name: 'tags') this.tags});

  factory _$_FAQContent.fromJson(Map<String, dynamic> json) =>
      _$_$_FAQContentFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String? id;
  @override
  @JsonKey(name: 'createdAt')
  final String? createdAt;
  @override
  @JsonKey(name: 'excerpt')
  final String? excerpt;
  @override
  @JsonKey(name: 'featureImage')
  final String? featureImage;
  @override
  @JsonKey(name: 'html')
  final String? html;
  @override
  @JsonKey(name: 'publishedAt')
  final String? publishedAt;
  @override
  @JsonKey(name: 'slug')
  final String? slug;
  @override
  @JsonKey(name: 'title')
  final String? title;
  @override
  @JsonKey(name: 'readingTime')
  final int? readingTime;
  @override
  @JsonKey(name: 'tags')
  final List<FAQTag?>? tags;

  @override
  String toString() {
    return 'FAQContent(id: $id, createdAt: $createdAt, excerpt: $excerpt, featureImage: $featureImage, html: $html, publishedAt: $publishedAt, slug: $slug, title: $title, readingTime: $readingTime, tags: $tags)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FAQContent &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.excerpt, excerpt) ||
                const DeepCollectionEquality()
                    .equals(other.excerpt, excerpt)) &&
            (identical(other.featureImage, featureImage) ||
                const DeepCollectionEquality()
                    .equals(other.featureImage, featureImage)) &&
            (identical(other.html, html) ||
                const DeepCollectionEquality().equals(other.html, html)) &&
            (identical(other.publishedAt, publishedAt) ||
                const DeepCollectionEquality()
                    .equals(other.publishedAt, publishedAt)) &&
            (identical(other.slug, slug) ||
                const DeepCollectionEquality().equals(other.slug, slug)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.readingTime, readingTime) ||
                const DeepCollectionEquality()
                    .equals(other.readingTime, readingTime)) &&
            (identical(other.tags, tags) ||
                const DeepCollectionEquality().equals(other.tags, tags)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(excerpt) ^
      const DeepCollectionEquality().hash(featureImage) ^
      const DeepCollectionEquality().hash(html) ^
      const DeepCollectionEquality().hash(publishedAt) ^
      const DeepCollectionEquality().hash(slug) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(readingTime) ^
      const DeepCollectionEquality().hash(tags);

  @JsonKey(ignore: true)
  @override
  _$FAQContentCopyWith<_FAQContent> get copyWith =>
      __$FAQContentCopyWithImpl<_FAQContent>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_FAQContentToJson(this);
  }
}

abstract class _FAQContent implements FAQContent {
  factory _FAQContent(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'createdAt') String? createdAt,
      @JsonKey(name: 'excerpt') String? excerpt,
      @JsonKey(name: 'featureImage') String? featureImage,
      @JsonKey(name: 'html') String? html,
      @JsonKey(name: 'publishedAt') String? publishedAt,
      @JsonKey(name: 'slug') String? slug,
      @JsonKey(name: 'title') String? title,
      @JsonKey(name: 'readingTime') int? readingTime,
      @JsonKey(name: 'tags') List<FAQTag?>? tags}) = _$_FAQContent;

  factory _FAQContent.fromJson(Map<String, dynamic> json) =
      _$_FAQContent.fromJson;

  @override
  @JsonKey(name: 'id')
  String? get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'createdAt')
  String? get createdAt => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'excerpt')
  String? get excerpt => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'featureImage')
  String? get featureImage => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'html')
  String? get html => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'publishedAt')
  String? get publishedAt => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'slug')
  String? get slug => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'title')
  String? get title => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'readingTime')
  int? get readingTime => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'tags')
  List<FAQTag?>? get tags => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$FAQContentCopyWith<_FAQContent> get copyWith =>
      throw _privateConstructorUsedError;
}

FAQTag _$FAQTagFromJson(Map<String, dynamic> json) {
  return _FAQTag.fromJson(json);
}

/// @nodoc
class _$FAQTagTearOff {
  const _$FAQTagTearOff();

  _FAQTag call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'slug') String? slug}) {
    return _FAQTag(
      id: id,
      name: name,
      slug: slug,
    );
  }

  FAQTag fromJson(Map<String, Object> json) {
    return FAQTag.fromJson(json);
  }
}

/// @nodoc
const $FAQTag = _$FAQTagTearOff();

/// @nodoc
mixin _$FAQTag {
  @JsonKey(name: 'id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'slug')
  String? get slug => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FAQTagCopyWith<FAQTag> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FAQTagCopyWith<$Res> {
  factory $FAQTagCopyWith(FAQTag value, $Res Function(FAQTag) then) =
      _$FAQTagCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'slug') String? slug});
}

/// @nodoc
class _$FAQTagCopyWithImpl<$Res> implements $FAQTagCopyWith<$Res> {
  _$FAQTagCopyWithImpl(this._value, this._then);

  final FAQTag _value;
  // ignore: unused_field
  final $Res Function(FAQTag) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? slug = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      slug: slug == freezed
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$FAQTagCopyWith<$Res> implements $FAQTagCopyWith<$Res> {
  factory _$FAQTagCopyWith(_FAQTag value, $Res Function(_FAQTag) then) =
      __$FAQTagCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'slug') String? slug});
}

/// @nodoc
class __$FAQTagCopyWithImpl<$Res> extends _$FAQTagCopyWithImpl<$Res>
    implements _$FAQTagCopyWith<$Res> {
  __$FAQTagCopyWithImpl(_FAQTag _value, $Res Function(_FAQTag) _then)
      : super(_value, (v) => _then(v as _FAQTag));

  @override
  _FAQTag get _value => super._value as _FAQTag;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? slug = freezed,
  }) {
    return _then(_FAQTag(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      slug: slug == freezed
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FAQTag implements _FAQTag {
  _$_FAQTag(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'name') this.name,
      @JsonKey(name: 'slug') this.slug});

  factory _$_FAQTag.fromJson(Map<String, dynamic> json) =>
      _$_$_FAQTagFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String? id;
  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'slug')
  final String? slug;

  @override
  String toString() {
    return 'FAQTag(id: $id, name: $name, slug: $slug)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FAQTag &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.slug, slug) ||
                const DeepCollectionEquality().equals(other.slug, slug)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(slug);

  @JsonKey(ignore: true)
  @override
  _$FAQTagCopyWith<_FAQTag> get copyWith =>
      __$FAQTagCopyWithImpl<_FAQTag>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_FAQTagToJson(this);
  }
}

abstract class _FAQTag implements FAQTag {
  factory _FAQTag(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'slug') String? slug}) = _$_FAQTag;

  factory _FAQTag.fromJson(Map<String, dynamic> json) = _$_FAQTag.fromJson;

  @override
  @JsonKey(name: 'id')
  String? get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'slug')
  String? get slug => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$FAQTagCopyWith<_FAQTag> get copyWith => throw _privateConstructorUsedError;
}
