// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'searched_clients.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SearchedClients _$SearchedClientsFromJson(Map<String, dynamic> json) {
  return _SearchedClients.fromJson(json);
}

/// @nodoc
class _$SearchedClientsTearOff {
  const _$SearchedClientsTearOff();

  _SearchedClients call(
      {@JsonKey(name: 'searchClientsByCCCNumber')
          List<SearchUserResponse>? clients}) {
    return _SearchedClients(
      clients: clients,
    );
  }

  SearchedClients fromJson(Map<String, Object?> json) {
    return SearchedClients.fromJson(json);
  }
}

/// @nodoc
const $SearchedClients = _$SearchedClientsTearOff();

/// @nodoc
mixin _$SearchedClients {
  @JsonKey(name: 'searchClientsByCCCNumber')
  List<SearchUserResponse>? get clients => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchedClientsCopyWith<SearchedClients> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchedClientsCopyWith<$Res> {
  factory $SearchedClientsCopyWith(
          SearchedClients value, $Res Function(SearchedClients) then) =
      _$SearchedClientsCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'searchClientsByCCCNumber')
          List<SearchUserResponse>? clients});
}

/// @nodoc
class _$SearchedClientsCopyWithImpl<$Res>
    implements $SearchedClientsCopyWith<$Res> {
  _$SearchedClientsCopyWithImpl(this._value, this._then);

  final SearchedClients _value;
  // ignore: unused_field
  final $Res Function(SearchedClients) _then;

  @override
  $Res call({
    Object? clients = freezed,
  }) {
    return _then(_value.copyWith(
      clients: clients == freezed
          ? _value.clients
          : clients // ignore: cast_nullable_to_non_nullable
              as List<SearchUserResponse>?,
    ));
  }
}

/// @nodoc
abstract class _$SearchedClientsCopyWith<$Res>
    implements $SearchedClientsCopyWith<$Res> {
  factory _$SearchedClientsCopyWith(
          _SearchedClients value, $Res Function(_SearchedClients) then) =
      __$SearchedClientsCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'searchClientsByCCCNumber')
          List<SearchUserResponse>? clients});
}

/// @nodoc
class __$SearchedClientsCopyWithImpl<$Res>
    extends _$SearchedClientsCopyWithImpl<$Res>
    implements _$SearchedClientsCopyWith<$Res> {
  __$SearchedClientsCopyWithImpl(
      _SearchedClients _value, $Res Function(_SearchedClients) _then)
      : super(_value, (v) => _then(v as _SearchedClients));

  @override
  _SearchedClients get _value => super._value as _SearchedClients;

  @override
  $Res call({
    Object? clients = freezed,
  }) {
    return _then(_SearchedClients(
      clients: clients == freezed
          ? _value.clients
          : clients // ignore: cast_nullable_to_non_nullable
              as List<SearchUserResponse>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SearchedClients implements _SearchedClients {
  _$_SearchedClients({@JsonKey(name: 'searchClientsByCCCNumber') this.clients});

  factory _$_SearchedClients.fromJson(Map<String, dynamic> json) =>
      _$$_SearchedClientsFromJson(json);

  @override
  @JsonKey(name: 'searchClientsByCCCNumber')
  final List<SearchUserResponse>? clients;

  @override
  String toString() {
    return 'SearchedClients(clients: $clients)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SearchedClients &&
            const DeepCollectionEquality().equals(other.clients, clients));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(clients));

  @JsonKey(ignore: true)
  @override
  _$SearchedClientsCopyWith<_SearchedClients> get copyWith =>
      __$SearchedClientsCopyWithImpl<_SearchedClients>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SearchedClientsToJson(this);
  }
}

abstract class _SearchedClients implements SearchedClients {
  factory _SearchedClients(
      {@JsonKey(name: 'searchClientsByCCCNumber')
          List<SearchUserResponse>? clients}) = _$_SearchedClients;

  factory _SearchedClients.fromJson(Map<String, dynamic> json) =
      _$_SearchedClients.fromJson;

  @override
  @JsonKey(name: 'searchClientsByCCCNumber')
  List<SearchUserResponse>? get clients;
  @override
  @JsonKey(ignore: true)
  _$SearchedClientsCopyWith<_SearchedClients> get copyWith =>
      throw _privateConstructorUsedError;
}
