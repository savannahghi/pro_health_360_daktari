// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/entities.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/application/redux/states/user_state.dart';
import 'package:healthcloud/domain/core/entities/core/staff_state.dart';

/// - [userProfile]

class UpdateUserProfileAction extends ReduxAction<AppState> {
  UpdateUserProfileAction({
    this.profile,
    this.communicationSettings,
    this.userBioData,
  });

  final UserProfile? profile;
  final CommunicationSettings? communicationSettings;
  final BioData? userBioData;

  @override
  AppState reduce() {
    final UserProfile userProfile = state.staffState!.userState!.userProfile!;

    final BioData? bio = state.staffState!.userState!.userProfile!.userBioData;

    final CommunicationSettings settings =
        state.staffState!.userState!.communicationSettings!;

    final StaffState newStaffState = state.staffState!.copyWith(
      userState: UserState(
        userProfile: UserProfile(
          id: this.profile?.id ?? userProfile.id,
          username: this.profile?.username ?? userProfile.username,
          primaryPhoneNumber: this.profile?.primaryPhoneNumber ??
              userProfile.primaryPhoneNumber,
          primaryEmailAddress: this.profile?.primaryEmailAddress ??
              userProfile.primaryEmailAddress,

          /// [secondaryPhoneNumbers] and [secondaryEmailAddresses] are overwrite to avoid complex checking of occurrences
          secondaryPhoneNumbers: this.profile?.secondaryPhoneNumbers ??
              userProfile.secondaryPhoneNumbers,
          secondaryEmailAddresses: this.profile?.secondaryEmailAddresses ??
              userProfile.secondaryEmailAddresses,

          termsAccepted:
              this.profile?.termsAccepted ?? userProfile.termsAccepted,
          suspended: this.profile?.suspended ?? userProfile.suspended,
          photoUploadID:
              this.profile?.photoUploadID ?? userProfile.photoUploadID,

          userBioData: BioData(
            firstName: this.userBioData?.firstName ?? bio?.firstName,
            lastName: this.userBioData?.lastName ?? bio?.lastName,
            dateOfBirth: this.userBioData?.dateOfBirth ?? bio?.dateOfBirth,
            gender: this.userBioData?.gender ?? bio?.gender,
          ),
        ),
        communicationSettings: CommunicationSettings(
          allowEmail:
              this.communicationSettings?.allowEmail ?? settings.allowEmail,
          allowPush:
              this.communicationSettings?.allowPush ?? settings.allowPush,
          allowText:
              this.communicationSettings?.allowText ?? settings.allowText,
          allowWhatsApp: this.communicationSettings?.allowWhatsApp ??
              settings.allowWhatsApp,
        ),
      ),
    );

    final AppState newState = state.copyWith.call(staffState: newStaffState);

    return newState;
  }
}
