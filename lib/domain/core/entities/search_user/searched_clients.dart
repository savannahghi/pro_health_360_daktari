// Package imports:

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prohealth360_daktari/domain/core/entities/search_user/search_user_response.dart';

part 'searched_clients.freezed.dart';
part 'searched_clients.g.dart';

@freezed
class SearchedClients with _$SearchedClients {
  factory SearchedClients({
    @JsonKey(name: 'searchClientUser') List<SearchUserResponse>? clients,
  }) = _SearchedClients;

  factory SearchedClients.fromJson(Map<String, dynamic> json) =>
      _$SearchedClientsFromJson(json);
}
