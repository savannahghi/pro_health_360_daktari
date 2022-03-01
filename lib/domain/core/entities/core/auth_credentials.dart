// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_credentials.freezed.dart';
part 'auth_credentials.g.dart';

@freezed
class AuthCredentials with _$AuthCredentials {
  factory AuthCredentials({
    @JsonKey(name: 'idToken') String? idToken,
    @JsonKey(name: 'expiresIn') String? expiresIn,
    @JsonKey(name: 'refreshToken') String? refreshToken,
    @JsonKey(name: 'tokenExpiryTimestamp') String? tokenExpiryTimestamp,

    // Other supporting fields that are not returned by the backend
    bool? isSignedIn,
    String? signedInTime,
  }) = _AuthCredentials;

  factory AuthCredentials.fromJson(Map<String, dynamic> json) =>
      _$AuthCredentialsFromJson(json);

  factory AuthCredentials.initial() => AuthCredentials(
        expiresIn: UNKNOWN,
        idToken: UNKNOWN,
        refreshToken: UNKNOWN,
        isSignedIn: false,
        signedInTime: UNKNOWN,
        tokenExpiryTimestamp: UNKNOWN,
      );
}
