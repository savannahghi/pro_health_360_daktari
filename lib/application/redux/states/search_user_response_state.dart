// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prohealth360_daktari/domain/core/entities/search_user/search_user_response.dart';

part 'search_user_response_state.freezed.dart';
part 'search_user_response_state.g.dart';

@freezed
class SearchUserResponseState with _$SearchUserResponseState {
  factory SearchUserResponseState({
    List<SearchUserResponse?>? searchUserResponses,
    SearchUserResponse?
        selectedSearchUserResponse, // when the user selects a specific user from the list
    bool? errorSearchingUser,
    bool? timeoutSearchingUser,
    bool? noUserFound,
  }) = _SearchUserResponseState;

  factory SearchUserResponseState.fromJson(Map<String, dynamic> json) =>
      _$SearchUserResponseStateFromJson(json);

  factory SearchUserResponseState.initial() => SearchUserResponseState(
        searchUserResponses: <SearchUserResponse>[],
        errorSearchingUser: false,
        timeoutSearchingUser: false,
        selectedSearchUserResponse: SearchUserResponse.initial(),
      );
}
