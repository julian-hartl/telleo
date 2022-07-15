part of 'edit_profile_page_bloc.dart';

@freezed
class EditProfilePageState with _$EditProfilePageState {
  const factory EditProfilePageState({
    required bool isUpdating,
    required EmailAdress emailAdress,
    required Name username,
    required String? profilePicturePath,
    required bool showErrorMessages,
    required Option<Either<UserFailure, Unit>> userFailureOrSuccess,
  }) = _EditProfilPageState;

  factory EditProfilePageState.inital() => EditProfilePageState(
        isUpdating: false,
        emailAdress: EmailAdress(''),
        username: Name(''),
        profilePicturePath: null,
        showErrorMessages: false,
        userFailureOrSuccess: none(),
      );
}
