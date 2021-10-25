// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'afyamoja_misc_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AfyaMojaMiscState _$AfyaMojaMiscStateFromJson(Map<String, dynamic> json) {
  return _AfyaMojaMiscState.fromJson(json);
}

/// @nodoc
class _$AfyaMojaMiscStateTearOff {
  const _$AfyaMojaMiscStateTearOff();

  _AfyaMojaMiscState call(
      {BottomNavObj? bottomNavObj, List<dynamic>? libraryListItems}) {
    return _AfyaMojaMiscState(
      bottomNavObj: bottomNavObj,
      libraryListItems: libraryListItems,
    );
  }

  AfyaMojaMiscState fromJson(Map<String, Object> json) {
    return AfyaMojaMiscState.fromJson(json);
  }
}

/// @nodoc
const $AfyaMojaMiscState = _$AfyaMojaMiscStateTearOff();

/// @nodoc
mixin _$AfyaMojaMiscState {
  BottomNavObj? get bottomNavObj => throw _privateConstructorUsedError;
  List<dynamic>? get libraryListItems => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AfyaMojaMiscStateCopyWith<AfyaMojaMiscState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AfyaMojaMiscStateCopyWith<$Res> {
  factory $AfyaMojaMiscStateCopyWith(
          AfyaMojaMiscState value, $Res Function(AfyaMojaMiscState) then) =
      _$AfyaMojaMiscStateCopyWithImpl<$Res>;
  $Res call({BottomNavObj? bottomNavObj, List<dynamic>? libraryListItems});
}

/// @nodoc
class _$AfyaMojaMiscStateCopyWithImpl<$Res>
    implements $AfyaMojaMiscStateCopyWith<$Res> {
  _$AfyaMojaMiscStateCopyWithImpl(this._value, this._then);

  final AfyaMojaMiscState _value;
  // ignore: unused_field
  final $Res Function(AfyaMojaMiscState) _then;

  @override
  $Res call({
    Object? bottomNavObj = freezed,
    Object? libraryListItems = freezed,
  }) {
    return _then(_value.copyWith(
      bottomNavObj: bottomNavObj == freezed
          ? _value.bottomNavObj
          : bottomNavObj // ignore: cast_nullable_to_non_nullable
              as BottomNavObj?,
      libraryListItems: libraryListItems == freezed
          ? _value.libraryListItems
          : libraryListItems // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ));
  }
}

/// @nodoc
abstract class _$AfyaMojaMiscStateCopyWith<$Res>
    implements $AfyaMojaMiscStateCopyWith<$Res> {
  factory _$AfyaMojaMiscStateCopyWith(
          _AfyaMojaMiscState value, $Res Function(_AfyaMojaMiscState) then) =
      __$AfyaMojaMiscStateCopyWithImpl<$Res>;
  @override
  $Res call({BottomNavObj? bottomNavObj, List<dynamic>? libraryListItems});
}

/// @nodoc
class __$AfyaMojaMiscStateCopyWithImpl<$Res>
    extends _$AfyaMojaMiscStateCopyWithImpl<$Res>
    implements _$AfyaMojaMiscStateCopyWith<$Res> {
  __$AfyaMojaMiscStateCopyWithImpl(
      _AfyaMojaMiscState _value, $Res Function(_AfyaMojaMiscState) _then)
      : super(_value, (v) => _then(v as _AfyaMojaMiscState));

  @override
  _AfyaMojaMiscState get _value => super._value as _AfyaMojaMiscState;

  @override
  $Res call({
    Object? bottomNavObj = freezed,
    Object? libraryListItems = freezed,
  }) {
    return _then(_AfyaMojaMiscState(
      bottomNavObj: bottomNavObj == freezed
          ? _value.bottomNavObj
          : bottomNavObj // ignore: cast_nullable_to_non_nullable
              as BottomNavObj?,
      libraryListItems: libraryListItems == freezed
          ? _value.libraryListItems
          : libraryListItems // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AfyaMojaMiscState implements _AfyaMojaMiscState {
  _$_AfyaMojaMiscState({this.bottomNavObj, this.libraryListItems});

  factory _$_AfyaMojaMiscState.fromJson(Map<String, dynamic> json) =>
      _$_$_AfyaMojaMiscStateFromJson(json);

  @override
  final BottomNavObj? bottomNavObj;
  @override
  final List<dynamic>? libraryListItems;

  @override
  String toString() {
    return 'AfyaMojaMiscState(bottomNavObj: $bottomNavObj, libraryListItems: $libraryListItems)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AfyaMojaMiscState &&
            (identical(other.bottomNavObj, bottomNavObj) ||
                const DeepCollectionEquality()
                    .equals(other.bottomNavObj, bottomNavObj)) &&
            (identical(other.libraryListItems, libraryListItems) ||
                const DeepCollectionEquality()
                    .equals(other.libraryListItems, libraryListItems)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(bottomNavObj) ^
      const DeepCollectionEquality().hash(libraryListItems);

  @JsonKey(ignore: true)
  @override
  _$AfyaMojaMiscStateCopyWith<_AfyaMojaMiscState> get copyWith =>
      __$AfyaMojaMiscStateCopyWithImpl<_AfyaMojaMiscState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AfyaMojaMiscStateToJson(this);
  }
}

abstract class _AfyaMojaMiscState implements AfyaMojaMiscState {
  factory _AfyaMojaMiscState(
      {BottomNavObj? bottomNavObj,
      List<dynamic>? libraryListItems}) = _$_AfyaMojaMiscState;

  factory _AfyaMojaMiscState.fromJson(Map<String, dynamic> json) =
      _$_AfyaMojaMiscState.fromJson;

  @override
  BottomNavObj? get bottomNavObj => throw _privateConstructorUsedError;
  @override
  List<dynamic>? get libraryListItems => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AfyaMojaMiscStateCopyWith<_AfyaMojaMiscState> get copyWith =>
      throw _privateConstructorUsedError;
}
