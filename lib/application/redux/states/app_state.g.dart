// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_State _$_$_StateFromJson(Map<String, dynamic> json) {
  return _$_State(
    homeState: json['homeState'] == null
        ? null
        : HomeState.fromJson(json['homeState'] as Map<String, dynamic>),
    onboardingState: json['onboardingState'] == null
        ? null
        : OnboardingState.fromJson(
            json['onboardingState'] as Map<String, dynamic>),
    bottomNavigationState: json['bottomNavigationState'] == null
        ? null
        : BottomNavigationState.fromJson(
            json['bottomNavigationState'] as Map<String, dynamic>),
    miscState: json['miscState'] == null
        ? null
        : MiscState.fromJson(json['miscState'] as Map<String, dynamic>),
    staffState: json['staffState'] == null
        ? null
        : StaffState.fromJson(json['staffState'] as Map<String, dynamic>),
    surveyState: json['surveyState'] == null
        ? null
        : SurveyState.fromJson(json['surveyState'] as Map<String, dynamic>),
    serviceRequestState: json['serviceRequestState'] == null
        ? null
        : ServiceRequestState.fromJson(
            json['serviceRequestState'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_StateToJson(_$_State instance) => <String, dynamic>{
      'homeState': instance.homeState,
      'onboardingState': instance.onboardingState,
      'bottomNavigationState': instance.bottomNavigationState,
      'miscState': instance.miscState,
      'staffState': instance.staffState,
      'surveyState': instance.surveyState,
      'serviceRequestState': instance.serviceRequestState,
    };

_$_StaffState _$_$_StaffStateFromJson(Map<String, dynamic> json) {
  return _$_StaffState(
    userState: json['userState'] == null
        ? null
        : UserState.fromJson(json['userState'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_StaffStateToJson(_$_StaffState instance) =>
    <String, dynamic>{
      'userState': instance.userState,
    };

_$_AuthState _$_$_AuthStateFromJson(Map<String, dynamic> json) {
  return _$_AuthState(
    credentials: json['credentials'] == null
        ? null
        : AuthCredentials.fromJson(json['credentials'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_AuthStateToJson(_$_AuthState instance) =>
    <String, dynamic>{
      'credentials': instance.credentials,
    };

_$_OnboardingState _$_$_OnboardingStateFromJson(Map<String, dynamic> json) {
  return _$_OnboardingState();
}

Map<String, dynamic> _$_$_OnboardingStateToJson(_$_OnboardingState instance) =>
    <String, dynamic>{};

_$_HomeState _$_$_HomeStateFromJson(Map<String, dynamic> json) {
  return _$_HomeState();
}

Map<String, dynamic> _$_$_HomeStateToJson(_$_HomeState instance) =>
    <String, dynamic>{};

_$_MiscState _$_$_MiscStateFromJson(Map<String, dynamic> json) {
  return _$_MiscState(
    visitCount: json['visitCount'] as String?,
    title: json['title'] as String?,
    message: json['message'] as String?,
    phoneNumber: json['phoneNumber'] as String?,
    otpCode: json['otpCode'] as String?,
    pinCode: json['pinCode'] as String?,
    acceptedTerms: json['acceptedTerms'] as bool?,
    faqList: (json['faqList'] as List<dynamic>?)
        ?.map((e) =>
            e == null ? null : FAQContent.fromJson(e as Map<String, dynamic>))
        .toList(),
    eventState: json['eventState'] == null
        ? null
        : EventState.fromJson(json['eventState'] as Map<String, dynamic>),
    defaultLocation: json['defaultLocation'] as String?,
    createPin: json['createPin'] as String?,
    confirmPin: json['confirmPin'] as String?,
    invalidCredentials: json['invalidCredentials'] as bool?,
    unKnownPhoneNo: json['unKnownPhoneNo'] as bool?,
    accountExists: json['accountExists'] as bool?,
    invalidPin: json['invalidPin'] as bool?,
    patientSearchTerm: json['patientSearchTerm'] as String?,
    hasCompletedEnteringOTP: json['hasCompletedEnteringOTP'] as bool?,
    isResendingOTP: json['isResendingOTP'] as bool?,
  );
}

Map<String, dynamic> _$_$_MiscStateToJson(_$_MiscState instance) =>
    <String, dynamic>{
      'visitCount': instance.visitCount,
      'title': instance.title,
      'message': instance.message,
      'phoneNumber': instance.phoneNumber,
      'otpCode': instance.otpCode,
      'pinCode': instance.pinCode,
      'acceptedTerms': instance.acceptedTerms,
      'faqList': instance.faqList,
      'eventState': instance.eventState,
      'defaultLocation': instance.defaultLocation,
      'createPin': instance.createPin,
      'confirmPin': instance.confirmPin,
      'invalidCredentials': instance.invalidCredentials,
      'unKnownPhoneNo': instance.unKnownPhoneNo,
      'accountExists': instance.accountExists,
      'invalidPin': instance.invalidPin,
      'patientSearchTerm': instance.patientSearchTerm,
      'hasCompletedEnteringOTP': instance.hasCompletedEnteringOTP,
      'isResendingOTP': instance.isResendingOTP,
    };

_$_SurveyState _$_$_SurveyStateFromJson(Map<String, dynamic> json) {
  return _$_SurveyState();
}

Map<String, dynamic> _$_$_SurveyStateToJson(_$_SurveyState instance) =>
    <String, dynamic>{};

_$_ServiceRequestState _$_$_ServiceRequestStateFromJson(
    Map<String, dynamic> json) {
  return _$_ServiceRequestState();
}

Map<String, dynamic> _$_$_ServiceRequestStateToJson(
        _$_ServiceRequestState instance) =>
    <String, dynamic>{};
