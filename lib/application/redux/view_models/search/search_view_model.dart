import 'package:async_redux/async_redux.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/domain/core/entities/search_user/search_user_response.dart';

class SearchViewModel extends Vm {
  final Wait wait;
  final bool? errorFetchingSearchUserResponse;
  final bool? timeoutFetchingSearchUserResponse;
  final bool? noUserFound;
  final List<SearchUserResponse?>? searchUserResponses;
  final SearchUserResponse? selectedSearchUserResponse;

  SearchViewModel({
    required this.wait,
    this.searchUserResponses,
    this.errorFetchingSearchUserResponse,
    this.timeoutFetchingSearchUserResponse,
    this.noUserFound,
    this.selectedSearchUserResponse,
  }) : super(
          equals: <Object?>[
            wait,
            errorFetchingSearchUserResponse,
            timeoutFetchingSearchUserResponse,
            searchUserResponses,
            selectedSearchUserResponse,
            noUserFound,
          ],
        );

  factory SearchViewModel.fromStore(Store<AppState> store) {
    return SearchViewModel(
      wait: store.state.wait!,
      errorFetchingSearchUserResponse:
          store.state.miscState?.searchUserResponseState?.errorSearchingUser,
      timeoutFetchingSearchUserResponse:
          store.state.miscState?.searchUserResponseState?.timeoutSearchingUser,
      noUserFound: store.state.miscState?.searchUserResponseState?.noUserFound,
      searchUserResponses:
          store.state.miscState?.searchUserResponseState?.searchUserResponses,
      selectedSearchUserResponse: store
          .state.miscState?.searchUserResponseState?.selectedSearchUserResponse,
    );
  }
}
