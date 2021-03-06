// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'search_user_response_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SearchUserResponseState _$SearchUserResponseStateFromJson(
    Map<String, dynamic> json) {
  return _SearchUserResponseState.fromJson(json);
}

/// @nodoc
mixin _$SearchUserResponseState {
  List<SearchUserResponse?>? get searchUserResponses =>
      throw _privateConstructorUsedError;
  SearchUserResponse? get selectedSearchUserResponse =>
      throw _privateConstructorUsedError; // when the user selects a specific user from the list
  bool? get errorSearchingUser => throw _privateConstructorUsedError;
  bool? get timeoutSearchingUser => throw _privateConstructorUsedError;
  bool? get noUserFound => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchUserResponseStateCopyWith<SearchUserResponseState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchUserResponseStateCopyWith<$Res> {
  factory $SearchUserResponseStateCopyWith(SearchUserResponseState value,
          $Res Function(SearchUserResponseState) then) =
      _$SearchUserResponseStateCopyWithImpl<$Res>;
  $Res call(
      {List<SearchUserResponse?>? searchUserResponses,
      SearchUserResponse? selectedSearchUserResponse,
      bool? errorSearchingUser,
      bool? timeoutSearchingUser,
      bool? noUserFound});

  $SearchUserResponseCopyWith<$Res>? get selectedSearchUserResponse;
}

/// @nodoc
class _$SearchUserResponseStateCopyWithImpl<$Res>
    implements $SearchUserResponseStateCopyWith<$Res> {
  _$SearchUserResponseStateCopyWithImpl(this._value, this._then);

  final SearchUserResponseState _value;
  // ignore: unused_field
  final $Res Function(SearchUserResponseState) _then;

  @override
  $Res call({
    Object? searchUserResponses = freezed,
    Object? selectedSearchUserResponse = freezed,
    Object? errorSearchingUser = freezed,
    Object? timeoutSearchingUser = freezed,
    Object? noUserFound = freezed,
  }) {
    return _then(_value.copyWith(
      searchUserResponses: searchUserResponses == freezed
          ? _value.searchUserResponses
          : searchUserResponses // ignore: cast_nullable_to_non_nullable
              as List<SearchUserResponse?>?,
      selectedSearchUserResponse: selectedSearchUserResponse == freezed
          ? _value.selectedSearchUserResponse
          : selectedSearchUserResponse // ignore: cast_nullable_to_non_nullable
              as SearchUserResponse?,
      errorSearchingUser: errorSearchingUser == freezed
          ? _value.errorSearchingUser
          : errorSearchingUser // ignore: cast_nullable_to_non_nullable
              as bool?,
      timeoutSearchingUser: timeoutSearchingUser == freezed
          ? _value.timeoutSearchingUser
          : timeoutSearchingUser // ignore: cast_nullable_to_non_nullable
              as bool?,
      noUserFound: noUserFound == freezed
          ? _value.noUserFound
          : noUserFound // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }

  @override
  $SearchUserResponseCopyWith<$Res>? get selectedSearchUserResponse {
    if (_value.selectedSearchUserResponse == null) {
      return null;
    }

    return $SearchUserResponseCopyWith<$Res>(_value.selectedSearchUserResponse!,
        (value) {
      return _then(_value.copyWith(selectedSearchUserResponse: value));
    });
  }
}

/// @nodoc
abstract class _$$_SearchUserResponseStateCopyWith<$Res>
    implements $SearchUserResponseStateCopyWith<$Res> {
  factory _$$_SearchUserResponseStateCopyWith(_$_SearchUserResponseState value,
          $Res Function(_$_SearchUserResponseState) then) =
      __$$_SearchUserResponseStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<SearchUserResponse?>? searchUserResponses,
      SearchUserResponse? selectedSearchUserResponse,
      bool? errorSearchingUser,
      bool? timeoutSearchingUser,
      bool? noUserFound});

  @override
  $SearchUserResponseCopyWith<$Res>? get selectedSearchUserResponse;
}

/// @nodoc
class __$$_SearchUserResponseStateCopyWithImpl<$Res>
    extends _$SearchUserResponseStateCopyWithImpl<$Res>
    implements _$$_SearchUserResponseStateCopyWith<$Res> {
  __$$_SearchUserResponseStateCopyWithImpl(_$_SearchUserResponseState _value,
      $Res Function(_$_SearchUserResponseState) _then)
      : super(_value, (v) => _then(v as _$_SearchUserResponseState));

  @override
  _$_SearchUserResponseState get _value =>
      super._value as _$_SearchUserResponseState;

  @override
  $Res call({
    Object? searchUserResponses = freezed,
    Object? selectedSearchUserResponse = freezed,
    Object? errorSearchingUser = freezed,
    Object? timeoutSearchingUser = freezed,
    Object? noUserFound = freezed,
  }) {
    return _then(_$_SearchUserResponseState(
      searchUserResponses: searchUserResponses == freezed
          ? _value._searchUserResponses
          : searchUserResponses // ignore: cast_nullable_to_non_nullable
              as List<SearchUserResponse?>?,
      selectedSearchUserResponse: selectedSearchUserResponse == freezed
          ? _value.selectedSearchUserResponse
          : selectedSearchUserResponse // ignore: cast_nullable_to_non_nullable
              as SearchUserResponse?,
      errorSearchingUser: errorSearchingUser == freezed
          ? _value.errorSearchingUser
          : errorSearchingUser // ignore: cast_nullable_to_non_nullable
              as bool?,
      timeoutSearchingUser: timeoutSearchingUser == freezed
          ? _value.timeoutSearchingUser
          : timeoutSearchingUser // ignore: cast_nullable_to_non_nullable
              as bool?,
      noUserFound: noUserFound == freezed
          ? _value.noUserFound
          : noUserFound // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SearchUserResponseState implements _SearchUserResponseState {
  _$_SearchUserResponseState(
      {final List<SearchUserResponse?>? searchUserResponses,
      this.selectedSearchUserResponse,
      this.errorSearchingUser,
      this.timeoutSearchingUser,
      this.noUserFound})
      : _searchUserResponses = searchUserResponses;

  factory _$_SearchUserResponseState.fromJson(Map<String, dynamic> json) =>
      _$$_SearchUserResponseStateFromJson(json);

  final List<SearchUserResponse?>? _searchUserResponses;
  @override
  List<SearchUserResponse?>? get searchUserResponses {
    final value = _searchUserResponses;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final SearchUserResponse? selectedSearchUserResponse;
// when the user selects a specific user from the list
  @override
  final bool? errorSearchingUser;
  @override
  final bool? timeoutSearchingUser;
  @override
  final bool? noUserFound;

  @override
  String toString() {
    return 'SearchUserResponseState(searchUserResponses: $searchUserResponses, selectedSearchUserResponse: $selectedSearchUserResponse, errorSearchingUser: $errorSearchingUser, timeoutSearchingUser: $timeoutSearchingUser, noUserFound: $noUserFound)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchUserResponseState &&
            const DeepCollectionEquality()
                .equals(other._searchUserResponses, _searchUserResponses) &&
            const DeepCollectionEquality().equals(
                other.selectedSearchUserResponse, selectedSearchUserResponse) &&
            const DeepCollectionEquality()
                .equals(other.errorSearchingUser, errorSearchingUser) &&
            const DeepCollectionEquality()
                .equals(other.timeoutSearchingUser, timeoutSearchingUser) &&
            const DeepCollectionEquality()
                .equals(other.noUserFound, noUserFound));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_searchUserResponses),
      const DeepCollectionEquality().hash(selectedSearchUserResponse),
      const DeepCollectionEquality().hash(errorSearchingUser),
      const DeepCollectionEquality().hash(timeoutSearchingUser),
      const DeepCollectionEquality().hash(noUserFound));

  @JsonKey(ignore: true)
  @override
  _$$_SearchUserResponseStateCopyWith<_$_SearchUserResponseState>
      get copyWith =>
          __$$_SearchUserResponseStateCopyWithImpl<_$_SearchUserResponseState>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SearchUserResponseStateToJson(this);
  }
}

abstract class _SearchUserResponseState implements SearchUserResponseState {
  factory _SearchUserResponseState(
      {final List<SearchUserResponse?>? searchUserResponses,
      final SearchUserResponse? selectedSearchUserResponse,
      final bool? errorSearchingUser,
      final bool? timeoutSearchingUser,
      final bool? noUserFound}) = _$_SearchUserResponseState;

  factory _SearchUserResponseState.fromJson(Map<String, dynamic> json) =
      _$_SearchUserResponseState.fromJson;

  @override
  List<SearchUserResponse?>? get searchUserResponses =>
      throw _privateConstructorUsedError;
  @override
  SearchUserResponse? get selectedSearchUserResponse =>
      throw _privateConstructorUsedError;
  @override // when the user selects a specific user from the list
  bool? get errorSearchingUser => throw _privateConstructorUsedError;
  @override
  bool? get timeoutSearchingUser => throw _privateConstructorUsedError;
  @override
  bool? get noUserFound => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_SearchUserResponseStateCopyWith<_$_SearchUserResponseState>
      get copyWith => throw _privateConstructorUsedError;
}
