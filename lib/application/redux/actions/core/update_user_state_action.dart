import 'package:async_redux/async_redux.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/application/core/services/helpers.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/application/redux/states/user_state.dart';
import 'package:domain_objects/entities.dart';

class UpdateUserStateAction extends ReduxAction<CoreState> {
  UpdateUserStateAction({
    this.inActivitySetInTime,
    this.userProfile,
    this.communicationSettings,
    this.auth,
    this.isSignedIn,
    this.signedInTime,
    this.tokenExpiryTime,
  });

  final String? inActivitySetInTime;
  final AuthCredentialResponse? auth;
  final CommunicationSettings? communicationSettings;
  final bool? isSignedIn;
  final String? signedInTime;
  final String? tokenExpiryTime;
  final UserProfile? userProfile;

  @override
  AppState reduce() {
    final UserState? newUserState = store.state.userState?.copyWith.call(
      inActivitySetInTime:
          inActivitySetInTime ?? store.state.userState?.inActivitySetInTime,
      userProfile: state.userState?.userProfile?.copyWith(
        id: this.userProfile?.id ?? state.userState?.userProfile?.id,
        username: this.userProfile?.username ??
            state.userState?.userProfile?.username,
        primaryPhoneNumber: this.userProfile?.primaryPhoneNumber ??
            state.userState?.userProfile?.primaryPhoneNumber,
        primaryEmailAddress: this.userProfile?.primaryEmailAddress ??
            state.userState?.userProfile?.primaryEmailAddress,
        secondaryPhoneNumbers:
            deconstructSecondaryPhoneNumber(state, this.userProfile),
        secondaryEmailAddresses:
            deconstructSecondaryEmailAddresses(state, this.userProfile),
        termsAccepted: this.userProfile?.termsAccepted ??
            state.userState?.userProfile?.termsAccepted,
        suspended: this.userProfile?.suspended ??
            state.userState?.userProfile?.suspended,
        photoUploadID: this.userProfile?.photoUploadID ??
            state.userState?.userProfile?.photoUploadID,
        userBioData: this.userProfile?.userBioData ??
            state.userState?.userProfile?.userBioData,
      ),
      communicationSettings:
          state.userState?.communicationSettings?.copyWith.call(
        profileID: this.communicationSettings?.profileID ??
            state.userState?.communicationSettings?.profileID,
        allowEmail: this.communicationSettings?.allowEmail ??
            state.userState?.communicationSettings?.allowEmail,
        allowPush: this.communicationSettings?.allowPush ??
            state.userState?.communicationSettings?.allowPush,
        allowText: this.communicationSettings?.allowText ??
            state.userState?.communicationSettings?.allowText,
        allowWhatsApp: this.communicationSettings?.allowWhatsApp ??
            state.userState?.communicationSettings?.allowWhatsApp,
      ),
      isSignedIn: this.isSignedIn ?? state.userState?.isSignedIn,
      tokenExpiryTime: this.tokenExpiryTime ?? state.userState?.tokenExpiryTime,
      signedInTime: this.signedInTime ?? state.userState?.signedInTime,
      auth: state.userState?.auth?.copyWith.call(
        canExperiment:
            this.auth?.canExperiment ?? state.userState?.auth?.canExperiment,
        idToken: this.auth?.idToken ?? state.userState?.auth?.idToken,
        customToken:
            this.auth?.customToken ?? state.userState?.auth?.customToken,
        expiresIn: this.auth?.expiresIn ?? state.userState?.auth?.expiresIn,
        refreshToken:
            this.auth?.refreshToken ?? state.userState?.auth?.refreshToken,
        isAdmin: this.auth?.isAdmin ?? state.userState?.auth?.isAdmin,
        isChangePin:
            this.auth?.isChangePin ?? state.userState?.auth?.isChangePin,
        isAnonymous:
            this.auth?.isAnonymous ?? state.userState?.auth?.isAnonymous,
        uid: this.auth?.uid ?? state.userState?.auth?.uid,
      ),
    );

    final AppState appState = state as AppState;
    final AppState newState = appState.copyWith(
      userState: newUserState,
    );
    return newState;
  }
}
