// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'supporting_documents.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SupportingDocument _$SupportingDocumentFromJson(Map<String, dynamic> json) {
  return _SupportingDocument.fromJson(json);
}

/// @nodoc
class _$SupportingDocumentTearOff {
  const _$SupportingDocumentTearOff();

  _SupportingDocument call(
      {required String title,
      required String description,
      required String upload}) {
    return _SupportingDocument(
      title: title,
      description: description,
      upload: upload,
    );
  }

  SupportingDocument fromJson(Map<String, Object> json) {
    return SupportingDocument.fromJson(json);
  }
}

/// @nodoc
const $SupportingDocument = _$SupportingDocumentTearOff();

/// @nodoc
mixin _$SupportingDocument {
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get upload => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SupportingDocumentCopyWith<SupportingDocument> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SupportingDocumentCopyWith<$Res> {
  factory $SupportingDocumentCopyWith(
          SupportingDocument value, $Res Function(SupportingDocument) then) =
      _$SupportingDocumentCopyWithImpl<$Res>;
  $Res call({String title, String description, String upload});
}

/// @nodoc
class _$SupportingDocumentCopyWithImpl<$Res>
    implements $SupportingDocumentCopyWith<$Res> {
  _$SupportingDocumentCopyWithImpl(this._value, this._then);

  final SupportingDocument _value;
  // ignore: unused_field
  final $Res Function(SupportingDocument) _then;

  @override
  $Res call({
    Object? title = freezed,
    Object? description = freezed,
    Object? upload = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      upload: upload == freezed
          ? _value.upload
          : upload // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$SupportingDocumentCopyWith<$Res>
    implements $SupportingDocumentCopyWith<$Res> {
  factory _$SupportingDocumentCopyWith(
          _SupportingDocument value, $Res Function(_SupportingDocument) then) =
      __$SupportingDocumentCopyWithImpl<$Res>;
  @override
  $Res call({String title, String description, String upload});
}

/// @nodoc
class __$SupportingDocumentCopyWithImpl<$Res>
    extends _$SupportingDocumentCopyWithImpl<$Res>
    implements _$SupportingDocumentCopyWith<$Res> {
  __$SupportingDocumentCopyWithImpl(
      _SupportingDocument _value, $Res Function(_SupportingDocument) _then)
      : super(_value, (v) => _then(v as _SupportingDocument));

  @override
  _SupportingDocument get _value => super._value as _SupportingDocument;

  @override
  $Res call({
    Object? title = freezed,
    Object? description = freezed,
    Object? upload = freezed,
  }) {
    return _then(_SupportingDocument(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      upload: upload == freezed
          ? _value.upload
          : upload // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SupportingDocument implements _SupportingDocument {
  const _$_SupportingDocument(
      {required this.title, required this.description, required this.upload});

  factory _$_SupportingDocument.fromJson(Map<String, dynamic> json) =>
      _$_$_SupportingDocumentFromJson(json);

  @override
  final String title;
  @override
  final String description;
  @override
  final String upload;

  @override
  String toString() {
    return 'SupportingDocument(title: $title, description: $description, upload: $upload)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SupportingDocument &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.upload, upload) ||
                const DeepCollectionEquality().equals(other.upload, upload)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(upload);

  @JsonKey(ignore: true)
  @override
  _$SupportingDocumentCopyWith<_SupportingDocument> get copyWith =>
      __$SupportingDocumentCopyWithImpl<_SupportingDocument>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SupportingDocumentToJson(this);
  }
}

abstract class _SupportingDocument implements SupportingDocument {
  const factory _SupportingDocument(
      {required String title,
      required String description,
      required String upload}) = _$_SupportingDocument;

  factory _SupportingDocument.fromJson(Map<String, dynamic> json) =
      _$_SupportingDocument.fromJson;

  @override
  String get title => throw _privateConstructorUsedError;
  @override
  String get description => throw _privateConstructorUsedError;
  @override
  String get upload => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SupportingDocumentCopyWith<_SupportingDocument> get copyWith =>
      throw _privateConstructorUsedError;
}
