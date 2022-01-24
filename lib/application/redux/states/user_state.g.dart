// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserState _$_$_UserStateFromJson(Map<String, dynamic> json) {
  return _$_UserState(
    userProfile: json['userProfile'] == null
        ? null
        : UserProfile.fromJson(json['userProfile'] as Map<String, dynamic>),
    customerProfile: json['customerProfile'] == null
        ? null
        : Customer.fromJson(json['customerProfile'] as Map<String, dynamic>),
    communicationSettings: json['communicationSettings'] == null
        ? null
        : CommunicationSettings.fromJson(
            json['communicationSettings'] as Map<String, dynamic>),
    auth: json['auth'] == null
        ? null
        : AuthCredentialResponse.fromJson(json['auth'] as Map<String, dynamic>),
    isSignedIn: json['isSignedIn'] as bool?,
    signedInTime: json['signedInTime'] as String?,
    inActivitySetInTime: json['inActivitySetInTime'] as String?,
    tokenExpiryTime: json['tokenExpiryTime'] as String?,
  );
}

Map<String, dynamic> _$_$_UserStateToJson(_$_UserState instance) =>
    <String, dynamic>{
      'userProfile': instance.userProfile,
      'customerProfile': instance.customerProfile,
      'communicationSettings': instance.communicationSettings,
      'auth': instance.auth,
      'isSignedIn': instance.isSignedIn,
      'signedInTime': instance.signedInTime,
      'inActivitySetInTime': instance.inActivitySetInTime,
      'tokenExpiryTime': instance.tokenExpiryTime,
    };
