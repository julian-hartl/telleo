part of 'user_form_bloc.dart';

@freezed
class UserFormState with _$UserFormState {
  factory UserFormState.initial() => _UserFormState(
        isSubmitting: false,
        profilePictureUrl: ProfilePictureUrl(''),
        username: Name(''),
      );
  const factory UserFormState({
    required bool isSubmitting,
    required Name username,
    required ProfilePictureUrl profilePictureUrl,
  }) = _UserFormState;
}
