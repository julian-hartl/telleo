part of 'edit_profile_page_bloc.dart';

@freezed
class EditProfilePageEvent with _$EditProfilePageEvent {
  const factory EditProfilePageEvent.emailChanged(String email) = _EmailChanged;
  const factory EditProfilePageEvent.usernameChanged(String username) =
      _UsernameChanged;
  const factory EditProfilePageEvent.save() = _Save;
  const factory EditProfilePageEvent.initialize(
      {required String email,
      required String username,
      required String profilePictureUrl}) = _Initialize;
}
