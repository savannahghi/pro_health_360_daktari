// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'accept_terms_response.freezed.dart';
part 'accept_terms_response.g.dart';

@freezed
class AcceptTermsResponse with _$AcceptTermsResponse {
  factory AcceptTermsResponse({
    @JsonKey(name: 'acceptTerms') required bool acceptTerms,
  }) = _AcceptTermsResponse;

  factory AcceptTermsResponse.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$AcceptTermsResponseFromJson(json);
}
