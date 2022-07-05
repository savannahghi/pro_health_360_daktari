// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'dropdown_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
abstract class _$$_DropdownItemCopyWith<$Res>
    implements $DropdownItemCopyWith<$Res> {
  factory _$$_DropdownItemCopyWith(
          _$_DropdownItem value, $Res Function(_$_DropdownItem) then) =
      __$$_DropdownItemCopyWithImpl<$Res>;
  @override
  $Res call({String description, String value});
}

/// @nodoc
class __$$_DropdownItemCopyWithImpl<$Res>
    extends _$DropdownItemCopyWithImpl<$Res>
    implements _$$_DropdownItemCopyWith<$Res> {
  __$$_DropdownItemCopyWithImpl(
      _$_DropdownItem _value, $Res Function(_$_DropdownItem) _then)
      : super(_value, (v) => _then(v as _$_DropdownItem));

  @override
  _$_DropdownItem get _value => super._value as _$_DropdownItem;

  @override
  $Res call({
    Object? description = freezed,
    Object? value = freezed,
  }) {
    return _then(_$_DropdownItem(
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
        (other.runtimeType == runtimeType &&
            other is _$_DropdownItem &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  _$$_DropdownItemCopyWith<_$_DropdownItem> get copyWith =>
      __$$_DropdownItemCopyWithImpl<_$_DropdownItem>(this, _$identity);
}

abstract class _DropdownItem implements DropdownItem {
  factory _DropdownItem(
      {required final String description,
      required final String value}) = _$_DropdownItem;

  @override
  String get description => throw _privateConstructorUsedError;
  @override
  String get value => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_DropdownItemCopyWith<_$_DropdownItem> get copyWith =>
      throw _privateConstructorUsedError;
}
