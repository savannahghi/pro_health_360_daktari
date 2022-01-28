// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_credentials.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AuthCredentials _$_$_AuthCredentialsFromJson(Map<String, dynamic> json) {
  return _$_AuthCredentials(
    idToken: json['idToken'] as String?,
    expiresIn: json['expiresIn'] as String?,
    refreshToken: json['refreshToken'] as String?,
    tokenExpiryTimestamp: json['tokenExpiryTimestamp'] as String?,
    isSignedIn: json['isSignedIn'] as bool?,
    signedInTime: json['signedInTime'] as String?,
  );
}

Map<String, dynamic> _$_$_AuthCredentialsToJson(_$_AuthCredentials instance) =>
    <String, dynamic>{
      'idToken': instance.idToken,
      'expiresIn': instance.expiresIn,
      'refreshToken': instance.refreshToken,
      'tokenExpiryTimestamp': instance.tokenExpiryTimestamp,
      'isSignedIn': instance.isSignedIn,
      'signedInTime': instance.signedInTime,
    };
