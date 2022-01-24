import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/entities.dart' as core_entities;
import 'package:healthcloud/application/core/services/helpers.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/application/redux/states/user_state.dart';

/// [BatchUpdateUserStateAction] is used to update the packages internal state. If a state changes requires
/// for it to be replicated in the backend, a use-case specific action should be created
///
/// Its used to update the following: `userProfile`,  `communicationSettings`, `auth`,
/// `isSignedIn`, `inActivitySetInTime`, `signedInTime`, `tokenExpiryTime`
class BatchUpdateUserStateAction extends ReduxAction<AppState> {
  BatchUpdateUserStateAction({
    this.userProfile,
    this.communicationSettings,
    this.auth,
    this.isSignedIn,
    this.inActivitySetInTime,
    this.signedInTime,
    this.tokenExpiryTime,
  });

  final core_entities.AuthCredentialResponse? auth;
  final core_entities.CommunicationSettings? communicationSettings;
  final String? inActivitySetInTime;
  final bool? isSignedIn;
  final String? signedInTime;
  final String? tokenExpiryTime;
  final core_entities.UserProfile? userProfile;

  @override
  AppState reduce() {
    final UserState? newUserState = state.staffState?.userState?.copyWith.call(
      userProfile: state.staffState?.userState!.userProfile!.copyWith(
        id: this.userProfile?.id ??
            state.staffState?.userState?.userProfile?.id,
        username: this.userProfile?.username ??
            state.staffState?.userState!.userProfile!.username,
        primaryPhoneNumber: this.userProfile?.primaryPhoneNumber ??
            state.staffState?.userState!.userProfile!.primaryPhoneNumber,
        primaryEmailAddress: this.userProfile?.primaryEmailAddress ??
            state.staffState?.userState!.userProfile!.primaryEmailAddress,
        secondaryPhoneNumbers:
            deconstructSecondaryPhoneNumber(state, this.userProfile),
        secondaryEmailAddresses:
            deconstructSecondaryEmailAddresses(state, this.userProfile),
        termsAccepted: this.userProfile?.termsAccepted ??
            state.staffState?.userState!.userProfile!.termsAccepted,
        suspended: this.userProfile?.suspended ??
            state.staffState?.userState!.userProfile!.suspended,
        photoUploadID: this.userProfile?.photoUploadID ??
            state.staffState?.userState!.userProfile!.photoUploadID,
        userBioData: this.userProfile?.userBioData ??
            state.staffState?.userState!.userProfile!.userBioData,
      ),
      communicationSettings:
          state.staffState?.userState!.communicationSettings!.copyWith.call(
        profileID: this.communicationSettings?.profileID ??
            state.staffState?.userState!.communicationSettings!.profileID,
        allowEmail: this.communicationSettings?.allowEmail ??
            state.staffState?.userState!.communicationSettings!.allowEmail,
        allowPush: this.communicationSettings?.allowPush ??
            state.staffState?.userState!.communicationSettings!.allowPush,
        allowText: this.communicationSettings?.allowText ??
            state.staffState?.userState!.communicationSettings!.allowText,
        allowWhatsApp: this.communicationSettings?.allowWhatsApp ??
            state.staffState?.userState!.communicationSettings!.allowWhatsApp,
      ),
      isSignedIn: this.isSignedIn ?? state.staffState?.userState!.isSignedIn,
      tokenExpiryTime:
          this.tokenExpiryTime ?? state.staffState?.userState!.tokenExpiryTime,
      inActivitySetInTime: this.inActivitySetInTime ??
          state.staffState?.userState!.inActivitySetInTime,
      signedInTime:
          this.signedInTime ?? state.staffState?.userState!.signedInTime,
      auth: this.auth != null
          ? core_entities.AuthCredentialResponse(
              canExperiment: this.auth!.canExperiment ??
                  state.staffState?.userState!.auth!.canExperiment,
              idToken: this.auth!.idToken ??
                  state.staffState?.userState!.auth!.idToken,
              customToken: this.auth!.customToken ??
                  state.staffState?.userState!.auth!.customToken,
              expiresIn: this.auth!.expiresIn ??
                  state.staffState?.userState!.auth!.expiresIn,
              refreshToken: this.auth!.refreshToken ??
                  state.staffState?.userState!.auth!.refreshToken,
              isAdmin: this.auth!.isAdmin ??
                  state.staffState?.userState!.auth!.isAdmin,
              isChangePin: this.auth!.isChangePin ??
                  state.staffState?.userState!.auth!.isChangePin,
              isAnonymous: this.auth!.isAnonymous ??
                  state.staffState?.userState!.auth!.isAnonymous,
              uid: this.auth!.uid ?? state.staffState?.userState!.auth!.uid,
            )
          : state.staffState?.userState!.auth,
    );

    final StaffState newStaffState =
        state.staffState!.copyWith(userState: newUserState);

    return state.copyWith(staffState: newStaffState);
  }
}
