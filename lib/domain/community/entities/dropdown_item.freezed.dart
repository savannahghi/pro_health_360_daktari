// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'dropdown_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$DropdownItemTearOff {
  const _$DropdownItemTearOff();

  _DropdownItem call({required String description, required String value}) {
    return _DropdownItem(
      description: description,
      value: value,
    );
  }
}

/// @nodoc
const $DropdownItem = _$DropdownItemTearOff();

/// @nodoc
mixin _$DropdownItem {
  String get description => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DropdownItemCopyWith<DropdownItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DropdownItemCopyWith<$Res> {
  factory $DropdownItemCopyWith(
          DropdownItem value, $Res Function(DropdownItem) then) =
      _$DropdownItemCopyWithImpl<$Res>;
  $Res call({String description, String value});
}

/// @nodoc
class _$DropdownItemCopyWithImpl<$Res> implements $DropdownItemCopyWith<$Res> {
  _$DropdownItemCopyWithImpl(this._value, this._then);

  final DropdownItem _value;
  // ignore: unused_field
  final $Res Function(DropdownItem) _then;

  @override
  $Res call({
    Object? description = freezed,
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$DropdownItemCopyWith<$Res>
    implements $DropdownItemCopyWith<$Res> {
  factory _$DropdownItemCopyWith(
          _DropdownItem value, $Res Function(_DropdownItem) then) =
      __$DropdownItemCopyWithImpl<$Res>;
  @override
  $Res call({String description, String value});
}

/// @nodoc
class __$DropdownItemCopyWithImpl<$Res> extends _$DropdownItemCopyWithImpl<$Res>
    implements _$DropdownItemCopyWith<$Res> {
  __$DropdownItemCopyWithImpl(
      _DropdownItem _value, $Res Function(_DropdownItem) _then)
      : super(_value, (v) => _then(v as _DropdownItem));

  @override
  _DropdownItem get _value => super._value as _DropdownItem;

  @override
  $Res call({
    Object? description = freezed,
    Object? value = freezed,
  }) {
    return _then(_DropdownItem(
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_DropdownItem implements _DropdownItem {
  _$_DropdownItem({required this.description, required this.value});

  @override
  final String description;
  @override
  final String value;

  @override
  String toString() {
    return 'DropdownItem(description: $description, value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DropdownItem &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  _$DropdownItemCopyWith<_DropdownItem> get copyWith =>
      __$DropdownItemCopyWithImpl<_DropdownItem>(this, _$identity);
}

abstract class _DropdownItem implements DropdownItem {
  factory _DropdownItem({required String description, required String value}) =
      _$_DropdownItem;

  @override
  String get description => throw _privateConstructorUsedError;
  @override
  String get value => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$DropdownItemCopyWith<_DropdownItem> get copyWith =>
      throw _privateConstructorUsedError;
}
