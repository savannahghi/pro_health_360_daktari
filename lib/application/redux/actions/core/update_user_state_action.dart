// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/entities.dart' as domain;

// Project imports:
import 'package:healthcloud/application/core/services/helpers.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/application/redux/states/user_state.dart';
import 'package:healthcloud/domain/core/entities/core/staff_state.dart';

class UpdateUserStateAction extends ReduxAction<AppState> {
  UpdateUserStateAction({
    this.inActivitySetInTime,
    this.userProfile,
    this.communicationSettings,
    this.auth,
    this.isSignedIn,
    this.signedInTime,
    this.tokenExpiryTime,
  });

  final domain.AuthCredentialResponse? auth;
  final domain.CommunicationSettings? communicationSettings;
  final String? inActivitySetInTime;
  final bool? isSignedIn;
  final String? signedInTime;
  final String? tokenExpiryTime;
  final domain.UserProfile? userProfile;

  @override
  AppState reduce() {
    final UserState? newUserState =
        store.state.staffState?.userState?.copyWith.call(
      inActivitySetInTime: inActivitySetInTime ??
          store.state.staffState?.userState?.inActivitySetInTime,
      userProfile: state.staffState?.userState?.userProfile?.copyWith(
        id: this.userProfile?.id ??
            state.staffState?.userState?.userProfile?.id,
        username: this.userProfile?.username ??
            state.staffState?.userState?.userProfile?.username,
        primaryPhoneNumber: this.userProfile?.primaryPhoneNumber ??
            state.staffState?.userState?.userProfile?.primaryPhoneNumber,
        primaryEmailAddress: this.userProfile?.primaryEmailAddress ??
            state.staffState?.userState?.userProfile?.primaryEmailAddress,
        secondaryPhoneNumbers:
            deconstructSecondaryPhoneNumber(state, this.userProfile),
        secondaryEmailAddresses:
            deconstructSecondaryEmailAddresses(state, this.userProfile),
        termsAccepted: this.userProfile?.termsAccepted ??
            state.staffState?.userState?.userProfile?.termsAccepted,
        suspended: this.userProfile?.suspended ??
            state.staffState?.userState?.userProfile?.suspended,
        photoUploadID: this.userProfile?.photoUploadID ??
            state.staffState?.userState?.userProfile?.photoUploadID,
        userBioData: this.userProfile?.userBioData ??
            state.staffState?.userState?.userProfile?.userBioData,
      ),
      communicationSettings:
          state.staffState?.userState?.communicationSettings?.copyWith.call(
        profileID: this.communicationSettings?.profileID ??
            state.staffState?.userState?.communicationSettings?.profileID,
        allowEmail: this.communicationSettings?.allowEmail ??
            state.staffState?.userState?.communicationSettings?.allowEmail,
        allowPush: this.communicationSettings?.allowPush ??
            state.staffState?.userState?.communicationSettings?.allowPush,
        allowText: this.communicationSettings?.allowText ??
            state.staffState?.userState?.communicationSettings?.allowText,
        allowWhatsApp: this.communicationSettings?.allowWhatsApp ??
            state.staffState?.userState?.communicationSettings?.allowWhatsApp,
      ),
      isSignedIn: this.isSignedIn ?? state.staffState?.userState?.isSignedIn,
      tokenExpiryTime:
          this.tokenExpiryTime ?? state.staffState?.userState?.tokenExpiryTime,
      signedInTime:
          this.signedInTime ?? state.staffState?.userState?.signedInTime,
      auth: state.staffState?.userState?.auth?.copyWith.call(
        canExperiment: this.auth?.canExperiment ??
            state.staffState?.userState?.auth?.canExperiment,
        idToken:
            this.auth?.idToken ?? state.staffState?.userState?.auth?.idToken,
        customToken: this.auth?.customToken ??
            state.staffState?.userState?.auth?.customToken,
        expiresIn: this.auth?.expiresIn ??
            state.staffState?.userState?.auth?.expiresIn,
        refreshToken: this.auth?.refreshToken ??
            state.staffState?.userState?.auth?.refreshToken,
        isAdmin:
            this.auth?.isAdmin ?? state.staffState?.userState?.auth?.isAdmin,
        isChangePin: this.auth?.isChangePin ??
            state.staffState?.userState?.auth?.isChangePin,
        isAnonymous: this.auth?.isAnonymous ??
            state.staffState?.userState?.auth?.isAnonymous,
        uid: this.auth?.uid ?? state.staffState?.userState?.auth?.uid,
      ),
    );

    final StaffState? newStaffState = state.staffState?.copyWith(
      userState: newUserState,
    );
    final AppState newState = state.copyWith(
      staffState: newStaffState,
    );
    return newState;
  }
}
