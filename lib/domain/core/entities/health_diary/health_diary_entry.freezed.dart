// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'health_diary_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HealthDiaryEdge _$HealthDiaryEdgeFromJson(Map<String, dynamic> json) {
  return _HealthDiaryEdge.fromJson(json);
}

/// @nodoc
class _$HealthDiaryEdgeTearOff {
  const _$HealthDiaryEdgeTearOff();

  _HealthDiaryEdge call(
      {@JsonKey(name: 'getSharedHealthDiaryEntry')
          required HealthDiaryEntry healthDiaryEntry}) {
    return _HealthDiaryEdge(
      healthDiaryEntry: healthDiaryEntry,
    );
  }

  HealthDiaryEdge fromJson(Map<String, Object?> json) {
    return HealthDiaryEdge.fromJson(json);
  }
}

/// @nodoc
const $HealthDiaryEdge = _$HealthDiaryEdgeTearOff();

/// @nodoc
mixin _$HealthDiaryEdge {
  @JsonKey(name: 'getSharedHealthDiaryEntry')
  HealthDiaryEntry get healthDiaryEntry => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HealthDiaryEdgeCopyWith<HealthDiaryEdge> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HealthDiaryEdgeCopyWith<$Res> {
  factory $HealthDiaryEdgeCopyWith(
          HealthDiaryEdge value, $Res Function(HealthDiaryEdge) then) =
      _$HealthDiaryEdgeCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'getSharedHealthDiaryEntry')
          HealthDiaryEntry healthDiaryEntry});

  $HealthDiaryEntryCopyWith<$Res> get healthDiaryEntry;
}

/// @nodoc
class _$HealthDiaryEdgeCopyWithImpl<$Res>
    implements $HealthDiaryEdgeCopyWith<$Res> {
  _$HealthDiaryEdgeCopyWithImpl(this._value, this._then);

  final HealthDiaryEdge _value;
  // ignore: unused_field
  final $Res Function(HealthDiaryEdge) _then;

  @override
  $Res call({
    Object? healthDiaryEntry = freezed,
  }) {
    return _then(_value.copyWith(
      healthDiaryEntry: healthDiaryEntry == freezed
          ? _value.healthDiaryEntry
          : healthDiaryEntry // ignore: cast_nullable_to_non_nullable
              as HealthDiaryEntry,
    ));
  }

  @override
  $HealthDiaryEntryCopyWith<$Res> get healthDiaryEntry {
    return $HealthDiaryEntryCopyWith<$Res>(_value.healthDiaryEntry, (value) {
      return _then(_value.copyWith(healthDiaryEntry: value));
    });
  }
}

/// @nodoc
abstract class _$HealthDiaryEdgeCopyWith<$Res>
    implements $HealthDiaryEdgeCopyWith<$Res> {
  factory _$HealthDiaryEdgeCopyWith(
          _HealthDiaryEdge value, $Res Function(_HealthDiaryEdge) then) =
      __$HealthDiaryEdgeCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'getSharedHealthDiaryEntry')
          HealthDiaryEntry healthDiaryEntry});

  @override
  $HealthDiaryEntryCopyWith<$Res> get healthDiaryEntry;
}

/// @nodoc
class __$HealthDiaryEdgeCopyWithImpl<$Res>
    extends _$HealthDiaryEdgeCopyWithImpl<$Res>
    implements _$HealthDiaryEdgeCopyWith<$Res> {
  __$HealthDiaryEdgeCopyWithImpl(
      _HealthDiaryEdge _value, $Res Function(_HealthDiaryEdge) _then)
      : super(_value, (v) => _then(v as _HealthDiaryEdge));

  @override
  _HealthDiaryEdge get _value => super._value as _HealthDiaryEdge;

  @override
  $Res call({
    Object? healthDiaryEntry = freezed,
  }) {
    return _then(_HealthDiaryEdge(
      healthDiaryEntry: healthDiaryEntry == freezed
          ? _value.healthDiaryEntry
          : healthDiaryEntry // ignore: cast_nullable_to_non_nullable
              as HealthDiaryEntry,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_HealthDiaryEdge implements _HealthDiaryEdge {
  _$_HealthDiaryEdge(
      {@JsonKey(name: 'getSharedHealthDiaryEntry')
          required this.healthDiaryEntry});

  factory _$_HealthDiaryEdge.fromJson(Map<String, dynamic> json) =>
      _$$_HealthDiaryEdgeFromJson(json);

  @override
  @JsonKey(name: 'getSharedHealthDiaryEntry')
  final HealthDiaryEntry healthDiaryEntry;

  @override
  String toString() {
    return 'HealthDiaryEdge(healthDiaryEntry: $healthDiaryEntry)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HealthDiaryEdge &&
            const DeepCollectionEquality()
                .equals(other.healthDiaryEntry, healthDiaryEntry));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(healthDiaryEntry));

  @JsonKey(ignore: true)
  @override
  _$HealthDiaryEdgeCopyWith<_HealthDiaryEdge> get copyWith =>
      __$HealthDiaryEdgeCopyWithImpl<_HealthDiaryEdge>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HealthDiaryEdgeToJson(this);
  }
}

abstract class _HealthDiaryEdge implements HealthDiaryEdge {
  factory _HealthDiaryEdge(
      {@JsonKey(name: 'getSharedHealthDiaryEntry')
          required HealthDiaryEntry healthDiaryEntry}) = _$_HealthDiaryEdge;

  factory _HealthDiaryEdge.fromJson(Map<String, dynamic> json) =
      _$_HealthDiaryEdge.fromJson;

  @override
  @JsonKey(name: 'getSharedHealthDiaryEntry')
  HealthDiaryEntry get healthDiaryEntry;
  @override
  @JsonKey(ignore: true)
  _$HealthDiaryEdgeCopyWith<_HealthDiaryEdge> get copyWith =>
      throw _privateConstructorUsedError;
}

HealthDiaryEntry _$HealthDiaryEntryFromJson(Map<String, dynamic> json) {
  return _HealthDiaryEntry.fromJson(json);
}

/// @nodoc
class _$HealthDiaryEntryTearOff {
  const _$HealthDiaryEntryTearOff();

  _HealthDiaryEntry call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'mood') String? mood,
      @JsonKey(name: 'note') String? note,
      @JsonKey(name: 'entryType') String? entryType,
      @JsonKey(name: 'createdAt') String? createdAt,
      @JsonKey(name: 'active', defaultValue: false) bool? active}) {
    return _HealthDiaryEntry(
      id: id,
      mood: mood,
      note: note,
      entryType: entryType,
      createdAt: createdAt,
      active: active,
    );
  }

  HealthDiaryEntry fromJson(Map<String, Object?> json) {
    return HealthDiaryEntry.fromJson(json);
  }
}

/// @nodoc
const $HealthDiaryEntry = _$HealthDiaryEntryTearOff();

/// @nodoc
mixin _$HealthDiaryEntry {
  @JsonKey(name: 'id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'mood')
  String? get mood => throw _privateConstructorUsedError;
  @JsonKey(name: 'note')
  String? get note => throw _privateConstructorUsedError;
  @JsonKey(name: 'entryType')
  String? get entryType => throw _privateConstructorUsedError;
  @JsonKey(name: 'createdAt')
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'active', defaultValue: false)
  bool? get active => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HealthDiaryEntryCopyWith<HealthDiaryEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HealthDiaryEntryCopyWith<$Res> {
  factory $HealthDiaryEntryCopyWith(
          HealthDiaryEntry value, $Res Function(HealthDiaryEntry) then) =
      _$HealthDiaryEntryCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'mood') String? mood,
      @JsonKey(name: 'note') String? note,
      @JsonKey(name: 'entryType') String? entryType,
      @JsonKey(name: 'createdAt') String? createdAt,
      @JsonKey(name: 'active', defaultValue: false) bool? active});
}

/// @nodoc
class _$HealthDiaryEntryCopyWithImpl<$Res>
    implements $HealthDiaryEntryCopyWith<$Res> {
  _$HealthDiaryEntryCopyWithImpl(this._value, this._then);

  final HealthDiaryEntry _value;
  // ignore: unused_field
  final $Res Function(HealthDiaryEntry) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? mood = freezed,
    Object? note = freezed,
    Object? entryType = freezed,
    Object? createdAt = freezed,
    Object? active = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      mood: mood == freezed
          ? _value.mood
          : mood // ignore: cast_nullable_to_non_nullable
              as String?,
      note: note == freezed
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      entryType: entryType == freezed
          ? _value.entryType
          : entryType // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      active: active == freezed
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$HealthDiaryEntryCopyWith<$Res>
    implements $HealthDiaryEntryCopyWith<$Res> {
  factory _$HealthDiaryEntryCopyWith(
          _HealthDiaryEntry value, $Res Function(_HealthDiaryEntry) then) =
      __$HealthDiaryEntryCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'mood') String? mood,
      @JsonKey(name: 'note') String? note,
      @JsonKey(name: 'entryType') String? entryType,
      @JsonKey(name: 'createdAt') String? createdAt,
      @JsonKey(name: 'active', defaultValue: false) bool? active});
}

/// @nodoc
class __$HealthDiaryEntryCopyWithImpl<$Res>
    extends _$HealthDiaryEntryCopyWithImpl<$Res>
    implements _$HealthDiaryEntryCopyWith<$Res> {
  __$HealthDiaryEntryCopyWithImpl(
      _HealthDiaryEntry _value, $Res Function(_HealthDiaryEntry) _then)
      : super(_value, (v) => _then(v as _HealthDiaryEntry));

  @override
  _HealthDiaryEntry get _value => super._value as _HealthDiaryEntry;

  @override
  $Res call({
    Object? id = freezed,
    Object? mood = freezed,
    Object? note = freezed,
    Object? entryType = freezed,
    Object? createdAt = freezed,
    Object? active = freezed,
  }) {
    return _then(_HealthDiaryEntry(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      mood: mood == freezed
          ? _value.mood
          : mood // ignore: cast_nullable_to_non_nullable
              as String?,
      note: note == freezed
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      entryType: entryType == freezed
          ? _value.entryType
          : entryType // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      active: active == freezed
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_HealthDiaryEntry implements _HealthDiaryEntry {
  _$_HealthDiaryEntry(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'mood') this.mood,
      @JsonKey(name: 'note') this.note,
      @JsonKey(name: 'entryType') this.entryType,
      @JsonKey(name: 'createdAt') this.createdAt,
      @JsonKey(name: 'active', defaultValue: false) this.active});

  factory _$_HealthDiaryEntry.fromJson(Map<String, dynamic> json) =>
      _$$_HealthDiaryEntryFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String? id;
  @override
  @JsonKey(name: 'mood')
  final String? mood;
  @override
  @JsonKey(name: 'note')
  final String? note;
  @override
  @JsonKey(name: 'entryType')
  final String? entryType;
  @override
  @JsonKey(name: 'createdAt')
  final String? createdAt;
  @override
  @JsonKey(name: 'active', defaultValue: false)
  final bool? active;

  @override
  String toString() {
    return 'HealthDiaryEntry(id: $id, mood: $mood, note: $note, entryType: $entryType, createdAt: $createdAt, active: $active)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HealthDiaryEntry &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.mood, mood) &&
            const DeepCollectionEquality().equals(other.note, note) &&
            const DeepCollectionEquality().equals(other.entryType, entryType) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.active, active));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(mood),
      const DeepCollectionEquality().hash(note),
      const DeepCollectionEquality().hash(entryType),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(active));

  @JsonKey(ignore: true)
  @override
  _$HealthDiaryEntryCopyWith<_HealthDiaryEntry> get copyWith =>
      __$HealthDiaryEntryCopyWithImpl<_HealthDiaryEntry>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HealthDiaryEntryToJson(this);
  }
}

abstract class _HealthDiaryEntry implements HealthDiaryEntry {
  factory _HealthDiaryEntry(
          {@JsonKey(name: 'id') String? id,
          @JsonKey(name: 'mood') String? mood,
          @JsonKey(name: 'note') String? note,
          @JsonKey(name: 'entryType') String? entryType,
          @JsonKey(name: 'createdAt') String? createdAt,
          @JsonKey(name: 'active', defaultValue: false) bool? active}) =
      _$_HealthDiaryEntry;

  factory _HealthDiaryEntry.fromJson(Map<String, dynamic> json) =
      _$_HealthDiaryEntry.fromJson;

  @override
  @JsonKey(name: 'id')
  String? get id;
  @override
  @JsonKey(name: 'mood')
  String? get mood;
  @override
  @JsonKey(name: 'note')
  String? get note;
  @override
  @JsonKey(name: 'entryType')
  String? get entryType;
  @override
  @JsonKey(name: 'createdAt')
  String? get createdAt;
  @override
  @JsonKey(name: 'active', defaultValue: false)
  bool? get active;
  @override
  @JsonKey(ignore: true)
  _$HealthDiaryEntryCopyWith<_HealthDiaryEntry> get copyWith =>
      throw _privateConstructorUsedError;
}
