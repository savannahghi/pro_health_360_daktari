import 'package:async_redux/async_redux.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/application/redux/states/search_user_response_state.dart';
import 'package:mycarehubpro/domain/core/entities/search_user/search_user_response.dart';

class UpdateSearchUserResponseStateAction extends ReduxAction<AppState> {
  UpdateSearchUserResponseStateAction({
    this.searchUserResponses,
    this.errorSearchingUser,
    this.timeoutSearchingUser,
    this.noUserFound,
    this.selectedSearchUserResponse,
  });

  final bool? errorSearchingUser;
  final bool? timeoutSearchingUser;
  final bool? noUserFound;
  final List<SearchUserResponse>? searchUserResponses;
  final SearchUserResponse? selectedSearchUserResponse;

  @override
  AppState reduce() {
    final SearchUserResponseState newSearchUserResponseState =
        SearchUserResponseState(
      searchUserResponses: searchUserResponses ??
          state.miscState?.searchUserResponseState?.searchUserResponses,
      errorSearchingUser: errorSearchingUser ??
          state.miscState?.searchUserResponseState?.errorSearchingUser,
      timeoutSearchingUser: timeoutSearchingUser ??
          state.miscState?.searchUserResponseState?.timeoutSearchingUser,
      noUserFound:
          noUserFound ?? state.miscState?.searchUserResponseState?.noUserFound,
      selectedSearchUserResponse: selectedSearchUserResponse ??
          state.miscState?.searchUserResponseState?.selectedSearchUserResponse,
    );
    final AppState newState = state.copyWith(
      miscState: state.miscState
          ?.copyWith(searchUserResponseState: newSearchUserResponseState),
    );

    return newState;
  }
}
